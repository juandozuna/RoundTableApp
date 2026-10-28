import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../config/app_config.dart';
import '../../routing/app_router.dart';
import '../session_context/session_context_service.dart';
import 'error_reporter.dart';
import 'error_scrubber.dart';

/// Builds the report context from the active role, the router location and
/// the build metadata.
@LazySingleton(as: ErrorContextProvider)
class AppErrorContextProvider implements ErrorContextProvider {
  AppErrorContextProvider(this._session, this._router, this._config);

  final SessionContextService _session;
  final AppRouter _router;
  final AppConfig _config;
  String _appVersion = ErrorReportContext.unknown;

  /// Reads `pubspec` version + build number; keeps `unknown` if the platform
  /// plugin is unavailable.
  @override
  Future<void> prepare() async {
    try {
      final info = await PackageInfo.fromPlatform();
      _appVersion = '${info.version}+${info.buildNumber}';
    } on Object {
      _appVersion = ErrorReportContext.unknown;
    }
  }

  @override
  ErrorReportContext read() => ErrorReportContext(
    role: _session.current?.role.name,
    route: _currentRoute(),
    appVersion: _appVersion,
    environment: _config.environment.name,
    platform: kIsWeb ? 'web' : defaultTargetPlatform.name,
  );

  String? _currentRoute() {
    try {
      final uri = _router.config.routerDelegate.currentConfiguration.uri;
      return ErrorScrubber.route(uri.toString());
    } on Object {
      return null;
    }
  }
}
