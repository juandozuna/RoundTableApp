import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../../core/sync/domain/watch_sync_status_use_case.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._watchConnectivity, this._watchSyncStatus)
    : super(const HomeState()) {
    _subscriptions
      ..add(_watchConnectivity().listen(_onConnectivity))
      ..add(_watchSyncStatus().listen(_onSync));
  }

  final WatchConnectivityUseCase _watchConnectivity;
  final WatchSyncStatusUseCase _watchSyncStatus;
  final List<StreamSubscription<Object?>> _subscriptions = [];

  void _onConnectivity(bool online) => emit(state.copyWith(online: online));

  void _onSync(SyncSnapshot sync) => emit(state.copyWith(sync: sync));

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
