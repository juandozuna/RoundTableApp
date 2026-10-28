import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../clock/clock_service.dart';
import '../logging/app_log.dart';
import 'error_reporter.dart';
import 'error_scrubber.dart';

/// Writes every error as one structured JSON log line (what Android logcat,
/// the browser console and log collectors see) and forwards it to the
/// optional [ErrorReportSink]. Repeats of the same error within
/// [dedupeWindow] and bursts above [maxPerWindow] are dropped so a failing
/// widget cannot flood the log or the sink.
@LazySingleton(as: ErrorReporter)
class LoggingErrorReporter implements ErrorReporter {
  LoggingErrorReporter(this._context, this._sink, this._clock);

  static const Duration dedupeWindow = Duration(minutes: 1);
  static const int maxPerWindow = 30;
  static const String logScope = 'error_report';

  final ErrorContextProvider _context;
  final ErrorReportSink _sink;
  final ClockService _clock;
  final Map<String, DateTime> _recent = {};
  final List<DateTime> _sent = [];

  @override
  void report({
    required String source,
    required Object error,
    StackTrace? stackTrace,
    bool fatal = false,
  }) {
    try {
      final now = _clock.nowUtc();
      final report = ErrorReport(
        source: source,
        errorType: error.runtimeType.toString(),
        message: ErrorScrubber.message(error.toString()),
        stackTrace: ErrorScrubber.stack(stackTrace),
        fatal: fatal,
        occurredAt: now,
        context: _context.read(),
      );
      if (!_admit(report, now)) return;
      AppLog.error(logScope, jsonEncode(report.toJson()), error, stackTrace);
      _sink.send(report).catchError((Object failure) {
        AppLog.warning(logScope, 'Error sink failed', failure);
      });
    } on Object catch (failure) {
      AppLog.warning(logScope, 'Could not report an error', failure);
    }
  }

  bool _admit(ErrorReport report, DateTime now) {
    _recent.removeWhere((_, seen) => now.difference(seen) >= dedupeWindow);
    _sent.removeWhere((at) => now.difference(at) >= dedupeWindow);
    if (_recent.containsKey(report.fingerprint)) return false;
    if (_sent.length >= maxPerWindow) return false;
    _recent[report.fingerprint] = now;
    _sent.add(now);
    return true;
  }
}
