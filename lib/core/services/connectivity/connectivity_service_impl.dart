import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import '../logging/app_log.dart';
import 'connectivity_service.dart';

@LazySingleton(as: ConnectivityService)
class ConnectivityServiceImpl implements ConnectivityService {
  ConnectivityServiceImpl(this._connectivity);

  final Connectivity _connectivity;

  /// Assumes online when the platform cannot report connectivity; remote
  /// calls still surface real failures.
  @override
  Future<bool> isOnline() async {
    try {
      return _isOnline(await _connectivity.checkConnectivity());
    } on Object catch (error) {
      AppLog.warning('connectivity', 'Connectivity check failed', error);
      return true;
    }
  }

  @override
  Stream<bool> watchOnline() async* {
    yield await isOnline();
    yield* _connectivity.onConnectivityChanged
        .map(_isOnline)
        .handleError(
          (Object error) => AppLog.warning(
            'connectivity',
            'Connectivity stream failed',
            error,
          ),
        )
        .distinct();
  }

  static bool _isOnline(List<ConnectivityResult> results) =>
      results.any((result) => result != ConnectivityResult.none);
}
