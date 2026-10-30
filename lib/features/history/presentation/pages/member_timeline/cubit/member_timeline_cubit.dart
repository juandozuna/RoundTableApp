import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/logging/app_log.dart';
import '../../../../domain/models/member_history.dart';
import '../../../../domain/use_cases/watch/watch_member_history_use_case.dart';
import 'member_timeline_state.dart';

/// One member's timeline, opened by the table's facilitator (PC-10).
@injectable
class MemberTimelineCubit extends Cubit<MemberTimelineState> {
  MemberTimelineCubit(this._watchMemberHistory, this._watchConnectivity)
    : super(const MemberTimelineState());

  final WatchMemberHistoryUseCase _watchMemberHistory;
  final WatchConnectivityUseCase _watchConnectivity;

  StreamSubscription<MemberHistory>? _history;
  StreamSubscription<bool>? _connectivity;
  ({String tableId, String personId})? _target;

  Future<void> load({required String tableId, required String personId}) async {
    _target = (tableId: tableId, personId: personId);
    await _history?.cancel();
    emit(state.copyWith(status: MemberTimelineStatus.loading, error: null));
    _connectivity ??= _watchConnectivity().listen(
      (online) => emit(state.copyWith(online: online)),
    );
    _history = _watchMemberHistory(tableId: tableId, personId: personId).listen(
      (history) => emit(
        state.copyWith(
          status: MemberTimelineStatus.ready,
          history: history,
          error: null,
        ),
      ),
      onError: _onError,
    );
  }

  /// Once the timeline has loaded, a failed refresh keeps it on screen; the
  /// next data replaces it.
  void _onError(Object error) {
    if (state.status == MemberTimelineStatus.ready) {
      AppLog.warning('history', 'Member timeline refresh failed', error);
      return;
    }
    emit(state.copyWith(status: MemberTimelineStatus.failure, error: error));
  }

  Future<void> retry() async {
    final target = _target;
    if (target != null) {
      await load(tableId: target.tableId, personId: target.personId);
    }
  }

  @override
  Future<void> close() async {
    await _history?.cancel();
    await _connectivity?.cancel();
    return super.close();
  }
}
