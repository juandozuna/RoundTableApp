import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../auth/domain/models/auth_failure.dart';
import '../../../../../auth/domain/models/auth_provider.dart';
import '../../../../../auth/domain/models/signed_in_user.dart';
import '../../../../domain/models/invite_preview.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/models/redeem_profile.dart';
import '../../../../domain/models/redeem_result.dart';

part 'redeem_state.freezed.dart';

enum RedeemStep {
  /// Loading the invite preview.
  loading,

  /// Welcome card: who invited you, where, as what; then pick a provider.
  preview,

  /// Prefilled profile to confirm.
  profile,
  submitting,
  welcome,

  /// Cannot continue: [RedeemState.problem] says why.
  blocked,
}

@freezed
abstract class RedeemState with _$RedeemState {
  const factory RedeemState({
    @Default(RedeemStep.loading) RedeemStep step,
    InvitePreview? preview,
    SignedInUser? user,

    /// Provider screen is open.
    AuthProvider? signingInWith,

    /// Provider sign-in did not complete (cancelled, offline…).
    AuthFailureKind? authNotice,
    InviteProblem? problem,
    RedeemProfile? profile,
    RedeemResult? result,
    @Default(true) bool online,
  }) = _RedeemState;

  const RedeemState._();

  bool get isSignedIn => user != null;
}
