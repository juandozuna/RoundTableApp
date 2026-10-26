import 'package:injectable/injectable.dart';

import '../../services/session_sync_service.dart';

@injectable
class RequestSyncUseCase {
  const RequestSyncUseCase(this._sync);

  final SessionSyncService _sync;

  Future<void> call() => _sync.requestSync();
}
