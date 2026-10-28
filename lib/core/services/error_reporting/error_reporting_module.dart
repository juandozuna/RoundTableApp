import 'package:injectable/injectable.dart';

import '../../config/app_config.dart';
import 'error_reporter.dart';
import 'http_error_report_sink.dart';

@module
abstract class ErrorReportingModule {
  /// HTTP transport when `ERROR_REPORT_URL` is set; otherwise errors only go
  /// to the structured log.
  @lazySingleton
  ErrorReportSink errorReportSink(AppConfig config) => config.hasErrorReporting
      ? HttpErrorReportSink(config.errorReportUrl)
      : const NoErrorReportSink();
}
