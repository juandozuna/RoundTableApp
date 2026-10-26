import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/logging/app_log.dart';
import '../../../../../../core/sync/domain/watch_sync_status_use_case.dart';
import '../../../../domain/use_cases/sign_out/sign_out_and_erase_local_data_use_case.dart';
import '../../../../domain/use_cases/sign_out/sign_out_use_case.dart';
import 'sign_out_state.dart';

@injectable
class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit(
    this._watchSync,
    this._watchConnectivity,
    this._signOut,
    this._signOutAndErase,
  ) : super(const SignOutState.checking());

  /// How long "Sincronizar y salir" waits for the upload queue to drain.
  static const Duration syncTimeout = Duration(seconds: 45);

  final WatchSyncStatusUseCase _watchSync;
  final WatchConnectivityUseCase _watchConnectivity;
  final SignOutUseCase _signOut;
  final SignOutAndEraseLocalDataUseCase _signOutAndErase;

  Future<void> load() async {
    emit(const SignOutState.checking());
    final snapshot = await _watchSync().first;
    final online = await _watchConnectivity().first;
    if (isClosed) return;
    emit(
      SignOutState.confirm(pendingCount: snapshot.pendingCount, online: online),
    );
  }

  /// Signs out keeping local data; unsent changes upload at the next sign-in
  /// of the same person (ADR 0004).
  Future<void> signOut() => _finish(_signOut.call);

  Future<void> signOutAndErase() => _finish(_signOutAndErase.call);

  Future<void> syncThenSignOut() async {
    final confirm = state;
    emit(const SignOutState.syncing());
    try {
      await _watchSync()
          .firstWhere((snapshot) => snapshot.pendingCount == 0)
          .timeout(syncTimeout);
    } on TimeoutException {
      if (isClosed) return;
      emit(
        SignOutState.confirm(
          pendingCount: confirm is SignOutConfirm ? confirm.pendingCount : 0,
          online: confirm is SignOutConfirm ? confirm.online : false,
          problem: SignOutProblem.syncTimeout,
        ),
      );
      return;
    }
    await signOut();
  }

  Future<void> _finish(Future<void> Function() action) async {
    final confirm = state;
    emit(const SignOutState.signingOut());
    try {
      await action();
      if (!isClosed) emit(const SignOutState.done());
    } on Object catch (error) {
      AppLog.warning('auth', 'Sign-out failed', error);
      if (isClosed) return;
      emit(
        SignOutState.confirm(
          pendingCount: confirm is SignOutConfirm ? confirm.pendingCount : 0,
          online: confirm is SignOutConfirm ? confirm.online : false,
          problem: SignOutProblem.failed,
        ),
      );
    }
  }
}
