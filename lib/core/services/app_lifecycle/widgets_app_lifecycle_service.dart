import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import 'app_lifecycle_service.dart';

@LazySingleton(as: AppLifecycleService)
class WidgetsAppLifecycleService
    with WidgetsBindingObserver
    implements AppLifecycleService {
  WidgetsAppLifecycleService() {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    _isForeground = _foregroundOf(binding.lifecycleState);
    binding.addObserver(this);
  }

  final StreamController<bool> _changes = StreamController<bool>.broadcast();
  late bool _isForeground;

  @override
  bool get isForeground => _isForeground;

  @override
  Stream<bool> watchForeground() => _changes.stream;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final next = _foregroundOf(state);
    if (next == _isForeground) return;
    _isForeground = next;
    _changes.add(next);
  }

  /// `inactive` is transient (system dialogs, app switcher gesture), so it
  /// still counts as foreground; an unknown state at startup does too.
  static bool _foregroundOf(AppLifecycleState? state) => switch (state) {
    AppLifecycleState.hidden ||
    AppLifecycleState.paused ||
    AppLifecycleState.detached => false,
    _ => true,
  };

  @disposeMethod
  Future<void> dispose() async {
    WidgetsBinding.instance.removeObserver(this);
    await _changes.close();
  }
}
