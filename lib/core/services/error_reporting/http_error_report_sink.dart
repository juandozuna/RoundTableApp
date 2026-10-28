import 'package:dio/dio.dart';

import '../logging/app_log.dart';
import 'error_reporter.dart';

/// Posts the report as JSON to a configurable URL (`ERROR_REPORT_URL`), for
/// example a log collector or a Sentry-compatible relay. Uses its own Dio so
/// the Supabase session token is never sent to it.
class HttpErrorReportSink implements ErrorReportSink {
  HttpErrorReportSink(this._url, {Dio? dio}) : _dio = dio ?? _defaultDio();

  final String _url;
  final Dio _dio;

  static Dio _defaultDio() => Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      contentType: Headers.jsonContentType,
    ),
  );

  @override
  Future<void> send(ErrorReport report) async {
    try {
      await _dio.post<void>(_url, data: report.toJson());
    } on DioException catch (error) {
      AppLog.warning('error_report', 'Error report not delivered', error.type);
    }
  }
}
