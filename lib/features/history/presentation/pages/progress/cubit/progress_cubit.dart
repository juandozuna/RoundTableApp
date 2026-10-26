import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/user_role.dart';
import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/session_context/session_context.dart';
import '../../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../../../domain/use_cases/watch/watch_member_history_use_case.dart';
import '../../../../domain/use_cases/watch/watch_table_history_use_case.dart';
import 'progress_state.dart';

/// The "Progreso" destination: a member's own history or, for the
/// facilitator, the history of the table they lead. Follows the active
/// context, so switching table or role re-targets it.
@injectable
class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit(
    this._watchContext,
    this._watchMemberHistory,
    this._watchTableHistory,
    this._watchConnectivity,
  ) : super(const ProgressState());

  final WatchSessionContextUseCase _watchContext;
  final WatchMemberHistoryUseCase _watchMemberHistory;
  final WatchTableHistoryUseCase _watchTableHistory;
  final WatchConnectivityUseCase _watchConnectivity;

  StreamSubscription<SessionContext?>? _context;
  StreamSubscription<bool>? _connectivity;
  StreamSubscription<Object?>? _history;

  /// Starts (or restarts, for "Reintentar") following the active context.
  Future<void> load() async {
    await _context?.cancel();
    await _history?.cancel();
    emit(state.copyWith(status: ProgressStatus.loading, error: null));
    _connectivity ??= _watchConnectivity().listen(
      (online) => emit(state.copyWith(online: online)),
    );
    _context = _watchContext().listen(_follow);
  }

  Future<void> _follow(SessionContext? context) async {
    await _history?.cancel();
    final tableId = context?.tableId;
    final personId = context?.personId;
    if (context == null || tableId == null) {
      return emit(_unavailable());
    }
    switch (context.role) {
      case UserRole.member when personId != null:
        _history = _watchMemberHistory(tableId: tableId, personId: personId)
            .listen(
              (history) => emit(
                state.copyWith(
                  status: ProgressStatus.member,
                  member: history,
                  table: null,
                  error: null,
                ),
              ),
              onError: _onError,
            );
      case UserRole.facilitator:
        _history = _watchTableHistory(tableId).listen(
          (history) => emit(
            state.copyWith(
              status: ProgressStatus.facilitator,
              table: history,
              member: null,
              error: null,
            ),
          ),
          onError: _onError,
        );
      default:
        emit(_unavailable());
    }
  }

  ProgressState _unavailable() => state.copyWith(
    status: ProgressStatus.unavailable,
    member: null,
    table: null,
    error: null,
  );

  void _onError(Object error) =>
      emit(state.copyWith(status: ProgressStatus.failure, error: error));

  @override
  Future<void> close() async {
    await _context?.cancel();
    await _history?.cancel();
    await _connectivity?.cancel();
    return super.close();
  }
}
