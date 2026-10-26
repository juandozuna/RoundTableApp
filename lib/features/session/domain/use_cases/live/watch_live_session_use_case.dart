import 'package:injectable/injectable.dart';

import '../../models/live_session.dart';
import '../../services/live_session_service.dart';

@injectable
class WatchLiveSessionUseCase {
  const WatchLiveSessionUseCase(this._sessions);

  final LiveSessionService _sessions;

  Stream<LiveSession?> call({String? tableId}) =>
      _sessions.watch(tableId: tableId);
}
