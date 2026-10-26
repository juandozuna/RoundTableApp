/// Development-only stand-in for the PowerSync service, which only arrives
/// with the Docker phase. Compiled in only with `--dart-define=DEV_AUTH=true`
/// and active only when `POWERSYNC_URL` is empty.
abstract interface class DevSyncFallback {
  /// Starts mirroring the user's rows from PostgREST into the local database
  /// and pushing queued changes through the normal uploader. Safe to call
  /// repeatedly; does nothing outside dev builds without PowerSync.
  void ensureRunning();
}
