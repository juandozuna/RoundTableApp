import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../config/app_config.dart';
import '../logging/app_log.dart';
import 'firebase_bootstrap.dart';

@LazySingleton(as: FirebaseBootstrap)
class FirebaseBootstrapImpl implements FirebaseBootstrap {
  FirebaseBootstrapImpl(this._config);

  final AppConfig _config;
  bool _available = false;
  Future<bool>? _initialization;

  @override
  bool get isAvailable => _available;

  @override
  Future<bool> initialize() => _initialization ??= _initialize();

  Future<bool> _initialize() async {
    final options = firebaseOptionsFor(
      _config.firebase,
      isWeb: kIsWeb,
      platform: defaultTargetPlatform,
    );
    if (options == null) {
      AppLog.info('firebase', 'Firebase config missing; push disabled.');
      return false;
    }
    try {
      await Firebase.initializeApp(options: options);
      _available = true;
    } on Object catch (error) {
      AppLog.warning('firebase', 'Firebase unavailable; push disabled.', error);
      _available = false;
    }
    return _available;
  }
}

/// The [FirebaseOptions] for the running platform, or `null` when the
/// dart-defines for it are incomplete (push stays off).
@visibleForTesting
FirebaseOptions? firebaseOptionsFor(
  FirebaseConfig config, {
  required bool isWeb,
  required TargetPlatform platform,
}) {
  if (!config.isCompleteFor(isWeb: isWeb, platform: platform)) return null;
  return FirebaseOptions(
    apiKey: config.apiKey,
    appId: config.appIdFor(isWeb: isWeb, platform: platform),
    messagingSenderId: config.messagingSenderId,
    projectId: config.projectId,
    storageBucket: config.storageBucket.isEmpty ? null : config.storageBucket,
    iosBundleId: !isWeb && platform == TargetPlatform.iOS
        ? (config.iosBundleId.isEmpty ? null : config.iosBundleId)
        : null,
  );
}
