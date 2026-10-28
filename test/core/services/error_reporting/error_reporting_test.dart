import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/error_reporting/error_handlers.dart';
import 'package:gold_roundtables/core/services/error_reporting/error_reporter.dart';
import 'package:gold_roundtables/core/services/error_reporting/error_reporting_observer.dart';
import 'package:gold_roundtables/core/services/error_reporting/error_scrubber.dart';
import 'package:gold_roundtables/core/services/error_reporting/http_error_report_sink.dart';
import 'package:gold_roundtables/core/services/error_reporting/logging_error_reporter.dart';

class FixedClock implements ClockService {
  FixedClock(this.now);

  DateTime now;

  @override
  DateTime nowUtc() => now;
}

class RecordingSink implements ErrorReportSink {
  final List<ErrorReport> sent = [];
  Object? failWith;

  @override
  Future<void> send(ErrorReport report) async {
    if (failWith != null) throw failWith!;
    sent.add(report);
  }
}

class FakeReporter implements ErrorReporter {
  final List<({String source, Object error, bool fatal})> reports = [];

  @override
  void report({
    required String source,
    required Object error,
    StackTrace? stackTrace,
    bool fatal = false,
  }) => reports.add((source: source, error: error, fatal: fatal));
}

class CapturingAdapter implements HttpClientAdapter {
  RequestOptions? request;
  bool fail = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<List<int>>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    request = options;
    if (fail) {
      throw DioException.connectionError(
        requestOptions: options,
        reason: 'offline',
      );
    }
    return ResponseBody.fromString('', 204);
  }

  @override
  void close({bool force = false}) {}
}

class _CounterCubit extends Cubit<int> {
  _CounterCubit() : super(0);

  void fail(Object error) => addError(error);
}

void main() {
  const context = ErrorReportContext(
    role: 'facilitator',
    route: '/session/:id',
    appVersion: '1.2.3+4',
    environment: 'production',
    platform: 'android',
  );

  group('LoggingErrorReporter', () {
    late FixedClock clock;
    late RecordingSink sink;
    late LoggingErrorReporter reporter;

    setUp(() {
      clock = FixedClock(DateTime.utc(2026, 10, 26, 12));
      sink = RecordingSink();
      reporter = LoggingErrorReporter(
        const StaticErrorContextProvider(context),
        sink,
        clock,
      );
    });

    test('sends a Sentry-shaped report with context and no raw input', () {
      reporter.report(
        source: ErrorSources.bloc,
        error: const FormatException('bad value from ana@example.com'),
        stackTrace: StackTrace.current,
        fatal: true,
      );

      final report = sink.sent.single;
      final json = report.toJson();
      expect(json['level'], 'fatal');
      expect(json['release'], '1.2.3+4');
      expect(json['environment'], 'production');
      expect(json['tags'], {
        'role': 'facilitator',
        'route': '/session/:id',
        'device_platform': 'android',
        'source': 'bloc',
      });
      final exception = (json['exception']! as Map)['values'] as List;
      expect((exception.single as Map)['type'], 'FormatException');
      expect(json.toString(), isNot(contains('ana@example.com')));
      expect(json['timestamp'], '2026-10-26T12:00:00.000Z');
    });

    test('drops the same error repeated within a minute', () {
      void fire() => reporter.report(
        source: ErrorSources.flutter,
        error: StateError('boom'),
      );
      fire();
      fire();
      expect(sink.sent, hasLength(1));

      clock.now = clock.now.add(LoggingErrorReporter.dedupeWindow);
      fire();
      expect(sink.sent, hasLength(2));
    });

    test('caps bursts of different errors per window', () {
      for (var i = 0; i < LoggingErrorReporter.maxPerWindow + 10; i++) {
        reporter.report(source: 'x', error: StateError('error $i'));
      }
      expect(sink.sent, hasLength(LoggingErrorReporter.maxPerWindow));
    });

    test('never throws when the sink fails', () async {
      sink.failWith = StateError('sink down');
      expect(
        () => reporter.report(source: 'x', error: StateError('boom')),
        returnsNormally,
      );
      await Future<void>.delayed(Duration.zero);
    });
  });

  group('ErrorScrubber', () {
    test('redacts emails, ids, tokens and phone numbers', () {
      final text = ErrorScrubber.message(
        'user ana@example.com id 3f2504e0-4f89-41d3-9a0c-0305e82c3301 '
        'phone +57 300 123 4567 jwt eyJhbGciOi.eyJzdWIiOi.c2ln',
      );
      expect(text, isNot(contains('ana@example.com')));
      expect(text, isNot(contains('3f2504e0')));
      expect(text, isNot(contains('300 123')));
      expect(text, isNot(contains('eyJ')));
    });

    test('truncates long messages and stacks', () {
      expect(
        ErrorScrubber.message('a' * 1000).length,
        ErrorScrubber.maxMessageLength + 1,
      );
      final stack = StackTrace.fromString(
        List.generate(100, (i) => '#$i frame').join('\n'),
      );
      expect(
        ErrorScrubber.stack(stack)!.split('\n'),
        hasLength(ErrorScrubber.maxStackLines),
      );
    });

    test('route keeps the path only and hides ids and invite codes', () {
      expect(
        ErrorScrubber.route(
          '/tables/3f2504e0-4f89-41d3-9a0c-0305e82c3301/members?name=Ana',
        ),
        '/tables/:id/members',
      );
      expect(ErrorScrubber.route('/join/AB12CD'), '/join/:id');
      expect(ErrorScrubber.route('/session'), '/session');
    });
  });

  group('HttpErrorReportSink', () {
    ErrorReport report() => ErrorReport(
      source: 'flutter',
      errorType: 'StateError',
      message: 'boom',
      occurredAt: DateTime.utc(2026),
      context: context,
    );

    test('posts the JSON payload without credentials', () async {
      final adapter = CapturingAdapter();
      final sink = HttpErrorReportSink(
        'https://logs.example.com/ingest',
        dio: Dio()..httpClientAdapter = adapter,
      );

      await sink.send(report());

      final request = adapter.request!;
      expect(request.method, 'POST');
      expect(request.uri.toString(), 'https://logs.example.com/ingest');
      expect((request.data as Map)['logger'], 'flutter');
      expect(request.headers.keys, isNot(contains('Authorization')));
    });

    test('swallows delivery failures', () async {
      final adapter = CapturingAdapter()..fail = true;
      final sink = HttpErrorReportSink(
        'https://logs.example.com/ingest',
        dio: Dio()..httpClientAdapter = adapter,
      );
      await sink.send(report());
    });
  });

  group('error handlers', () {
    test('the Bloc observer reports Cubit errors', () async {
      final reporter = FakeReporter();
      final previous = Bloc.observer;
      Bloc.observer = ErrorReportingBlocObserver(() => reporter);
      addTearDown(() => Bloc.observer = previous);

      final cubit = _CounterCubit()..fail(StateError('cubit failed'));
      await cubit.close();

      expect(reporter.reports.single.source, ErrorSources.bloc);
      expect(reporter.reports.single.error, isA<StateError>());
    });

    test('installErrorHandlers routes framework and platform errors', () {
      final reporter = FakeReporter();
      final previous = Bloc.observer;
      addTearDown(() => Bloc.observer = previous);
      final previousFlutter = FlutterError.onError;
      final previousPlatform = PlatformDispatcher.instance.onError;
      addTearDown(() {
        FlutterError.onError = previousFlutter;
        PlatformDispatcher.instance.onError = previousPlatform;
      });
      installErrorHandlers(() => reporter);

      expect(Bloc.observer, isA<ErrorReportingBlocObserver>());
      FlutterError.onError!(FlutterErrorDetails(exception: StateError('ui')));
      final handled = PlatformDispatcher.instance.onError!(
        StateError('async'),
        StackTrace.empty,
      );

      expect(handled, isTrue);
      expect(reporter.reports.map((r) => (r.source, r.fatal)), [
        (ErrorSources.flutter, false),
        (ErrorSources.platform, true),
      ]);
    });
  });
}
