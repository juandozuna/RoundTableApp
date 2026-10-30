import 'package:injectable/injectable.dart';

import '../../services/connectivity/connectivity_service.dart';
import '../domain/sync_snapshot.dart';
import '../domain/sync_status_service.dart';

/// Online-only [SyncStatusService]: writes go to the server immediately and
/// are never queued, so nothing is ever pending; only the connection state
/// is reported. A future local outbox replaces this with one that counts its
/// queued operations.
@LazySingleton(as: SyncStatusService)
class ConnectivitySyncStatusService implements SyncStatusService {
  ConnectivitySyncStatusService(this._connectivity);

  final ConnectivityService _connectivity;

  @override
  Stream<SyncSnapshot> watch() => _connectivity.watchOnline().map(
    (online) => SyncSnapshot(
      connection: online ? SyncConnection.connected : SyncConnection.offline,
    ),
  );
}
