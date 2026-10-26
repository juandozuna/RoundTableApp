import 'package:injectable/injectable.dart';

import '../../../core/sync/data/sync_database.dart';
import 'local/session_drift_database.dart';

@module
abstract class SessionDataModule {
  /// Resolved lazily, after bootstrap opened the sync database.
  @lazySingleton
  SessionDriftDatabase sessionDriftDatabase(SyncDatabase database) =>
      SessionDriftDatabase(database);
}
