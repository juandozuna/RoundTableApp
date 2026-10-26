import 'package:injectable/injectable.dart';

import '../../models/member_history.dart';
import '../../services/history_service.dart';

/// A person's own history, or any member's timeline for the facilitator.
@injectable
class WatchMemberHistoryUseCase {
  const WatchMemberHistoryUseCase(this._history);

  final HistoryService _history;

  Stream<MemberHistory> call({
    required String tableId,
    required String personId,
  }) => _history.watchMemberHistory(tableId: tableId, personId: personId);
}
