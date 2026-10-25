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
    final web = _config.firebase;
    if (kIsWeb && !web.isComplete) {
      AppLog.info('firebase', 'Firebase web config missing; push disabled.');
      return false;
    }
    try {
      await Firebase.initializeApp(
        options: kIsWeb
            ? FirebaseOptions(
                apiKey: web.apiKey,
                appId: web.appId,
                messagingSenderId: web.messagingSenderId,
                projectId: web.projectId,
              )
            : null,
      );
      _available = true;
    } on Object catch (error) {
      AppLog.warning('firebase', 'Firebase unavailable; push disabled.', error);
      _available = false;
    }
    return _available;
  }
}
