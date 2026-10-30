/// Whether the app is in the foreground, so background work (polling) can
/// pause while nobody is looking.
abstract interface class AppLifecycleService {
  bool get isForeground;

  /// Emits only changes: `true` when the app comes to the foreground, `false`
  /// when it goes to the background.
  Stream<bool> watchForeground();
}
