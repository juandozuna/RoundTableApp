import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/access_state.dart';
import '../../domain/models/account_context.dart';
import '../../domain/models/signed_in_user.dart';
import '../../domain/use_cases/access/refresh_access_use_case.dart';
import '../../domain/use_cases/access/select_context_use_case.dart';
import '../../domain/use_cases/access/watch_access_state_use_case.dart';
import '../../domain/use_cases/sign_in/watch_signed_in_user_use_case.dart';
import 'access_cubit_state.dart';

/// Shared by the access page, the context picker, the header switcher and
/// the account page: what the identity can enter and under which context.
@injectable
class AccessCubit extends Cubit<AccessCubitState> {
  AccessCubit(
    this._watchAccess,
    this._watchUser,
    this._refreshAccess,
    this._selectContext,
  ) : super(AccessCubitState(user: _watchUser.current)) {
    _subscriptions
      ..add(_watchAccess().listen(_onAccess))
      ..add(_watchUser().listen(_onUser));
  }

  final WatchAccessStateUseCase _watchAccess;
  final WatchSignedInUserUseCase _watchUser;
  final RefreshAccessUseCase _refreshAccess;
  final SelectContextUseCase _selectContext;
  final List<StreamSubscription<Object?>> _subscriptions = [];

  void _onAccess(AccessState access) =>
      emit(state.copyWith(access: access, refreshing: false));

  void _onUser(SignedInUser? user) => emit(state.copyWith(user: user));

  Future<void> select(AccountContext context) => _selectContext(context);

  Future<void> refresh() async {
    emit(state.copyWith(refreshing: true));
    await _refreshAccess();
    if (!isClosed) emit(state.copyWith(refreshing: false));
  }

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
