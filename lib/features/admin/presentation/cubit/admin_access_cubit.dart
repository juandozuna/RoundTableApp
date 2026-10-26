import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../domain/models/admin_scope.dart';
import '../../domain/use_cases/scope/watch_admin_scope_use_case.dart';
import 'admin_access_state.dart';

@injectable
class AdminAccessCubit extends Cubit<AdminAccessState> {
  AdminAccessCubit(this._watchScope, this._watchConnectivity)
    : super(const AdminAccessState()) {
    _subscriptions
      ..add(_watchConnectivity().listen(_onConnectivity))
      ..add(_watchScope().listen(_onScope, onError: _onError));
  }

  final WatchAdminScopeUseCase _watchScope;
  final WatchConnectivityUseCase _watchConnectivity;
  final List<StreamSubscription<Object?>> _subscriptions = [];

  void _onConnectivity(bool online) => emit(state.copyWith(online: online));

  void _onScope(AdminScope? scope) => emit(
    state.copyWith(
      scope: scope,
      status: scope == null
          ? AdminAccessStatus.denied
          : AdminAccessStatus.ready,
      error: null,
    ),
  );

  void _onError(Object error) => emit(
    state.copyWith(
      status: AdminAccessStatus.failure,
      error: error is ApiException
          ? error
          : const ApiException(kind: ApiErrorKind.unknown),
    ),
  );

  /// Re-reads the scope after a failure (for example when back online).
  void retry() {
    emit(state.copyWith(status: AdminAccessStatus.loading, error: null));
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions
      ..clear()
      ..add(_watchConnectivity().listen(_onConnectivity))
      ..add(_watchScope().listen(_onScope, onError: _onError));
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
