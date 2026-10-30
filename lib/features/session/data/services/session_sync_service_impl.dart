import 'package:injectable/injectable.dart';

import '../../../../core/data/data_change_signal.dart';
import '../../../../core/data/data_scope.dart';
import '../../domain/services/session_sync_service.dart';

@LazySingleton(as: SessionSyncService)
class SessionSyncServiceImpl implements SessionSyncService {
  SessionSyncServiceImpl(this._signal);

  final DataChangeSignal _signal;

  /// Live screens refetch now instead of waiting for the next poll.
  @override
  Future<void> requestSync() async => _signal.notify(DataScope.session);
}
