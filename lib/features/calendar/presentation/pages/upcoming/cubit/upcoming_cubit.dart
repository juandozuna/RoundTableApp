import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../domain/models/upcoming_filter.dart';
import '../../../../domain/models/upcoming_sessions.dart';
import '../../../../domain/use_cases/watch/watch_upcoming_sessions_use_case.dart';
import 'upcoming_state.dart';

/// The "Calendario" destination: upcoming sessions of the active context,
/// filterable by location, facilitator and table for managers.
@injectable
class UpcomingCubit extends Cubit<UpcomingState> {
  UpcomingCubit(this._watchSessions, this._watchConnectivity)
    : super(const UpcomingState());

  final WatchUpcomingSessionsUseCase _watchSessions;
  final WatchConnectivityUseCase _watchConnectivity;

  StreamSubscription<UpcomingSessions>? _sessions;
  StreamSubscription<bool>? _connectivity;

  /// Starts (or restarts, for "Reintentar") following the active context.
  Future<void> load() async {
    await _sessions?.cancel();
    emit(state.copyWith(status: UpcomingStatus.loading, error: null));
    _connectivity ??= _watchConnectivity().listen(_onConnectivity);
    _sessions = _watchSessions().listen(_onSessions, onError: _onError);
  }

  void filterByLocation(String? id) =>
      emit(state.copyWith(filter: state.filter.copyWith(locationId: id)));

  void filterByFacilitator(String? id) =>
      emit(state.copyWith(filter: state.filter.copyWith(facilitatorId: id)));

  void filterByTable(String? id) =>
      emit(state.copyWith(filter: state.filter.copyWith(roundTableId: id)));

  void clearFilter() => emit(state.copyWith(filter: const UpcomingFilter()));

  void _onSessions(UpcomingSessions sessions) => emit(
    state.copyWith(
      status: UpcomingStatus.ready,
      sessions: sessions,
      error: null,
    ),
  );

  void _onError(Object error) =>
      emit(state.copyWith(status: UpcomingStatus.failure, error: error));

  void _onConnectivity(bool online) {
    final reconnected = online && !state.online;
    emit(state.copyWith(online: online));
    final retryable = state.isManager || state.status == UpcomingStatus.failure;
    if (reconnected && retryable) unawaited(load());
  }

  @override
  Future<void> close() async {
    await _sessions?.cancel();
    await _connectivity?.cancel();
    return super.close();
  }
}
