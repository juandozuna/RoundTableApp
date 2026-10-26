import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../auth/domain/models/auth_failure.dart';
import '../../../../../auth/domain/models/auth_provider.dart';
import '../../../../../auth/domain/models/signed_in_user.dart';
import '../../../../../auth/domain/use_cases/sign_in/sign_in_with_provider_use_case.dart';
import '../../../../../auth/domain/use_cases/sign_in/watch_auth_failures_use_case.dart';
import '../../../../../auth/domain/use_cases/sign_in/watch_signed_in_user_use_case.dart';
import '../../../../../auth/domain/use_cases/sign_out/sign_out_use_case.dart';
import '../../../../domain/models/invite_preview.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/models/redeem_profile.dart';
import '../../../../domain/use_cases/redeem/preview_invite_use_case.dart';
import '../../../../domain/use_cases/redeem/redeem_invite_use_case.dart';
import '../../../../invites_routes.dart';
import 'redeem_state.dart';

/// Opening an invitation: preview → confirm with a provider → prefilled
/// profile → redeem → welcome (ADR 0007, ADR 0015).
@injectable
class RedeemCubit extends Cubit<RedeemState> {
  RedeemCubit(
    this._preview,
    this._redeem,
    this._signIn,
    this._signOut,
    this._watchUser,
    this._watchFailures,
    this._watchConnectivity,
  ) : super(RedeemState(user: _watchUser.current)) {
    _subscriptions
      ..add(_watchUser().listen(_onUser))
      ..add(_watchFailures().listen(_onAuthFailure))
      ..add(
        _watchConnectivity().listen(
          (online) => emit(state.copyWith(online: online)),
        ),
      );
  }

  final PreviewInviteUseCase _preview;
  final RedeemInviteUseCase _redeem;
  final SignInWithProviderUseCase _signIn;
  final SignOutUseCase _signOut;
  final WatchSignedInUserUseCase _watchUser;
  final WatchAuthFailuresUseCase _watchFailures;
  final WatchConnectivityUseCase _watchConnectivity;
  final List<StreamSubscription<Object?>> _subscriptions = [];
  String _code = '';

  /// [preloaded] is the preview the code-entry page already fetched.
  Future<void> load(String code, {InvitePreview? preloaded}) async {
    _code = code;
    if (preloaded != null) {
      emit(state.copyWith(step: RedeemStep.preview, preview: preloaded));
      return;
    }
    emit(state.copyWith(step: RedeemStep.loading, problem: null));
    try {
      final preview = await _preview(code);
      if (isClosed) return;
      emit(state.copyWith(step: RedeemStep.preview, preview: preview));
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      emit(state.copyWith(step: RedeemStep.blocked, problem: failure.problem));
    }
  }

  Future<void> retry() => load(_code);

  Future<void> signIn(AuthProvider provider) async {
    if (state.signingInWith != null) return;
    emit(state.copyWith(signingInWith: provider, authNotice: null));
    try {
      await _signIn(provider, returnPath: InvitesRoutes.redeemFor(_code));
    } on AuthFailure catch (failure) {
      emit(state.copyWith(signingInWith: null, authNotice: failure.kind));
    }
  }

  void cancelSignIn() => emit(
    state.copyWith(signingInWith: null, authNotice: AuthFailureKind.cancelled),
  );

  /// Signed in already (returned from the provider): go confirm the profile.
  void continueWithAccount() {
    if (state.user == null) return;
    emit(
      state.copyWith(
        step: RedeemStep.profile,
        profile: _prefill(state.preview, state.user!),
        problem: null,
      ),
    );
  }

  void backToPreview() =>
      emit(state.copyWith(step: RedeemStep.preview, problem: null));

  Future<void> submit(RedeemProfile profile) async {
    if (state.step == RedeemStep.submitting) return;
    emit(
      state.copyWith(
        step: RedeemStep.submitting,
        profile: profile,
        problem: null,
      ),
    );
    try {
      final result = await _redeem(_code, profile);
      if (isClosed) return;
      emit(state.copyWith(step: RedeemStep.welcome, result: result));
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      final recoverable =
          failure.problem == InviteProblem.offline ||
          failure.problem == InviteProblem.generic ||
          failure.problem == InviteProblem.validation;
      emit(
        state.copyWith(
          step: recoverable ? RedeemStep.profile : RedeemStep.blocked,
          problem: failure.problem,
        ),
      );
    }
  }

  /// Signs out so another provider account can be used for this invite.
  Future<void> useAnotherAccount() async {
    await _signOut();
    if (isClosed) return;
    emit(
      state.copyWith(
        step: RedeemStep.preview,
        user: null,
        problem: null,
        signingInWith: null,
        authNotice: null,
      ),
    );
  }

  void _onUser(SignedInUser? user) {
    final justSignedIn = state.signingInWith != null && user != null;
    emit(
      state.copyWith(
        user: user,
        signingInWith: user == null ? state.signingInWith : null,
        authNotice: user == null ? state.authNotice : null,
      ),
    );
    if (justSignedIn && state.step == RedeemStep.preview) continueWithAccount();
  }

  void _onAuthFailure(AuthFailure failure) =>
      emit(state.copyWith(signingInWith: null, authNotice: failure.kind));

  RedeemProfile _prefill(InvitePreview? preview, SignedInUser user) =>
      RedeemProfile(
        firstName: preview?.personFirstName ?? user.firstName,
        lastName: user.lastName,
      );

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
