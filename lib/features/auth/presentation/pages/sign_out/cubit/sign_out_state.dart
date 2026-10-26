import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_state.freezed.dart';

enum SignOutProblem { syncTimeout, failed }

@freezed
sealed class SignOutState with _$SignOutState {
  const factory SignOutState.checking() = SignOutChecking;

  /// Waiting for the person's decision. [pendingCount] changes saved only on
  /// this device; [online] tells whether syncing first is possible.
  const factory SignOutState.confirm({
    required int pendingCount,
    required bool online,
    SignOutProblem? problem,
  }) = SignOutConfirm;

  const factory SignOutState.syncing() = SignOutSyncing;
  const factory SignOutState.signingOut() = SignOutSigningOut;
  const factory SignOutState.done() = SignOutDone;
}
