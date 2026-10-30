import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/logging/app_log.dart';
import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../../core/sync/domain/watch_sync_status_use_case.dart';
import '../../../../domain/models/home_overview.dart';
import '../../../../domain/use_cases/overview/watch_home_overview_use_case.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._watchOverview, this._watchConnectivity, this._watchSyncStatus)
    : super(const HomeState()) {
    _auxiliary
      ..add(_watchConnectivity().listen(_onConnectivity))
      ..add(_watchSyncStatus().listen(_onSync));
  }

  final WatchHomeOverviewUseCase _watchOverview;
  final WatchConnectivityUseCase _watchConnectivity;
  final WatchSyncStatusUseCase _watchSyncStatus;
  final List<StreamSubscription<Object?>> _auxiliary = [];
  StreamSubscription<HomeOverview>? _overview;

  /// Starts (or restarts, for "Reintentar") the overview subscription.
  Future<void> load() async {
    await _overview?.cancel();
    emit(state.copyWith(status: HomeStatus.loading, error: null));
    _overview = _watchOverview().listen(_onOverview, onError: _onError);
  }

  void _onOverview(HomeOverview overview) => emit(
    state.copyWith(status: HomeStatus.ready, overview: overview, error: null),
  );

  /// Once the overview has loaded, a failed refresh keeps it on screen; the
  /// next data replaces it.
  void _onError(Object error) {
    if (state.status == HomeStatus.ready) {
      AppLog.warning('home', 'Home refresh failed', error);
      return;
    }
    emit(state.copyWith(status: HomeStatus.failure, error: error));
  }

  void _onConnectivity(bool online) => emit(state.copyWith(online: online));

  void _onSync(SyncSnapshot sync) => emit(state.copyWith(sync: sync));

  @override
  Future<void> close() async {
    await _overview?.cancel();
    for (final subscription in _auxiliary) {
      await subscription.cancel();
    }
    return super.close();
  }
}
