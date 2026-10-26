import 'package:gold_roundtables/features/session/data/dev/dev_sync_fallback.dart';

/// Tests never start the dev PostgREST mirror.
class NoDevSyncFallback implements DevSyncFallback {
  const NoDevSyncFallback();

  @override
  void ensureRunning() {}
}
