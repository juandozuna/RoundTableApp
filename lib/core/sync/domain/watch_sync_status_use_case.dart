import 'package:injectable/injectable.dart';

import 'sync_snapshot.dart';
import 'sync_status_service.dart';

@injectable
class WatchSyncStatusUseCase {
  const WatchSyncStatusUseCase(this._service);

  final SyncStatusService _service;

  Stream<SyncSnapshot> call() => _service.watch();
}
