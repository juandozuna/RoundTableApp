import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/models/account_context.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/domain/models/signed_in_user.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/sign_in_with_provider_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/watch_auth_failures_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/watch_signed_in_user_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_out/sign_out_use_case.dart';
import 'package:gold_roundtables/features/invites/data/services/invite_attempts_service_impl.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_problem.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_status.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_profile.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_result.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/redeem/preview_invite_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/redeem/redeem_invite_use_case.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/redeem/cubit/redeem_cubit.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/redeem/cubit/redeem_state.dart';

import '../helpers/fakes.dart';

void main() {
  late FakeInviteService invites;
  late FakeAuthService auth;
  late FakeAccess access;
  late FakeConnectivity connectivity;

  const google = SignedInUser(
    id: 'u1',
    email: 'valeria@gmail.com',
    provider: AuthProvider.google,
    firstName: 'Valeria',
    lastName: 'Cordero',
  );

  RedeemCubit build() {
    final clock = FixedClock(DateTime.utc(2026, 10, 25));
    return RedeemCubit(
      PreviewInviteUseCase(invites, InviteAttemptsServiceImpl(clock), clock),
      RedeemInviteUseCase(invites, access),
      SignInWithProviderUseCase(auth, connectivity),
      SignOutUseCase(auth),
      WatchSignedInUserUseCase(auth),
      WatchAuthFailuresUseCase(auth),
      WatchConnectivityUseCase(connectivity),
    );
  }

  RedeemResult result() => RedeemResult(
    person: makeInvite('1').person,
    invite: makeInvite('1', status: InviteStatus.accepted),
    contexts: const [
      AccountContext(
        kind: UserRole.member,
        personId: 'person-1',
        label: 'Miembro · Mesa Esperanza 03',
      ),
    ],
  );

  setUp(() {
    invites = FakeInviteService();
    auth = FakeAuthService();
    access = FakeAccess();
    connectivity = FakeConnectivity();
  });

  blocTest<RedeemCubit, RedeemState>(
    'shows the welcome card for a valid code',
    build: build,
    act: (cubit) => cubit.load('MESA34'),
    skip: 1, // loading
    expect: () => [
      isA<RedeemState>()
          .having((s) => s.step, 'step', RedeemStep.preview)
          .having((s) => s.preview?.invitedByName, 'inviter', 'Sofía Herrera'),
    ],
  );

  blocTest<RedeemCubit, RedeemState>(
    'reuses the preview the code page already fetched',
    build: build,
    act: (cubit) => cubit.load('MESA34', preloaded: previewMesa34),
    expect: () => [
      isA<RedeemState>().having((s) => s.step, 'step', RedeemStep.preview),
    ],
    verify: (_) => expect(invites.calls, isEmpty),
  );

  for (final problem in [
    InviteProblem.expired,
    InviteProblem.alreadyUsed,
    InviteProblem.revoked,
    InviteProblem.notFound,
  ]) {
    blocTest<RedeemCubit, RedeemState>(
      'a $problem invite is blocked with its reason',
      build: () {
        invites.previewFailures['MESA34'] = InviteFailure(problem);
        return build();
      },
      act: (cubit) => cubit.load('MESA34'),
      skip: 1,
      expect: () => [
        isA<RedeemState>()
            .having((s) => s.step, 'step', RedeemStep.blocked)
            .having((s) => s.problem, 'problem', problem),
      ],
    );
  }

  blocTest<RedeemCubit, RedeemState>(
    'after the provider returns, goes on to the profile prefilled',
    build: build,
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      await cubit.signIn(AuthProvider.google);
      auth.emitUser(google);
    },
    verify: (cubit) {
      expect(auth.lastReturnPath, '/invitacion/MESA34');
      expect(cubit.state.step, RedeemStep.profile);
      // First name comes from the inviter's registration, last name from the provider.
      expect(cubit.state.profile?.firstName, 'Rodrigo');
      expect(cubit.state.profile?.lastName, 'Cordero');
      expect(cubit.state.signingInWith, isNull);
    },
  );

  blocTest<RedeemCubit, RedeemState>(
    'already signed in (returned from the provider on web): asks before continuing',
    build: () {
      auth = FakeAuthService(google);
      return build();
    },
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      expect(cubit.state.step, RedeemStep.preview);
      expect(cubit.state.isSignedIn, isTrue);
      cubit.continueWithAccount();
    },
    verify: (cubit) => expect(cubit.state.step, RedeemStep.profile),
  );

  blocTest<RedeemCubit, RedeemState>(
    'a cancelled provider screen leaves a notice and no account',
    build: build,
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      await cubit.signIn(AuthProvider.apple);
      auth.failureController.add(const AuthFailure(AuthFailureKind.cancelled));
    },
    verify: (cubit) {
      expect(cubit.state.authNotice, AuthFailureKind.cancelled);
      expect(cubit.state.signingInWith, isNull);
      expect(cubit.state.step, RedeemStep.preview);
    },
  );

  blocTest<RedeemCubit, RedeemState>(
    'offline sign-in is refused before leaving the app',
    build: () {
      connectivity.online = false;
      return build();
    },
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      await cubit.signIn(AuthProvider.google);
    },
    verify: (cubit) => expect(cubit.state.authNotice, AuthFailureKind.offline),
  );

  blocTest<RedeemCubit, RedeemState>(
    'redeeming reloads the account preferring the new person',
    build: () {
      auth = FakeAuthService(google);
      invites.redeemResult = result();
      return build();
    },
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      cubit.continueWithAccount();
      await cubit.submit(
        const RedeemProfile(firstName: 'Rodrigo', lastName: 'Paz'),
      );
    },
    verify: (cubit) {
      expect(cubit.state.step, RedeemStep.welcome);
      expect(
        cubit.state.result?.joinedContext?.label,
        'Miembro · Mesa Esperanza 03',
      );
      expect(invites.lastProfile?.lastName, 'Paz');
      expect(access.refreshes, ['person-1']);
    },
  );

  for (final problem in [
    InviteProblem.linkedElsewhere,
    InviteProblem.identityLinkedElsewhere,
    InviteProblem.personInactive,
    InviteProblem.alreadyUsed,
  ]) {
    blocTest<RedeemCubit, RedeemState>(
      'redeem failing with $problem blocks with that reason',
      build: () {
        auth = FakeAuthService(google);
        invites.redeemFailure = InviteFailure(problem);
        return build();
      },
      act: (cubit) async {
        await cubit.load('MESA34', preloaded: previewMesa34);
        cubit.continueWithAccount();
        await cubit.submit(const RedeemProfile(firstName: 'Rodrigo'));
      },
      verify: (cubit) {
        expect(cubit.state.step, RedeemStep.blocked);
        expect(cubit.state.problem, problem);
        expect(access.refreshes, isEmpty);
      },
    );
  }

  blocTest<RedeemCubit, RedeemState>(
    'losing the connection while redeeming keeps the profile to retry',
    build: () {
      auth = FakeAuthService(google);
      invites.redeemFailure = const InviteFailure(InviteProblem.offline);
      return build();
    },
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      cubit.continueWithAccount();
      await cubit.submit(const RedeemProfile(firstName: 'Rodrigo'));
    },
    verify: (cubit) {
      expect(cubit.state.step, RedeemStep.profile);
      expect(cubit.state.problem, InviteProblem.offline);
      expect(cubit.state.profile?.firstName, 'Rodrigo');
    },
  );

  blocTest<RedeemCubit, RedeemState>(
    '"usar otra cuenta" signs out and returns to the provider choice',
    build: () {
      auth = FakeAuthService(google);
      invites.redeemFailure = const InviteFailure(
        InviteProblem.linkedElsewhere,
      );
      return build();
    },
    act: (cubit) async {
      await cubit.load('MESA34', preloaded: previewMesa34);
      cubit.continueWithAccount();
      await cubit.submit(const RedeemProfile(firstName: 'Rodrigo'));
      await cubit.useAnotherAccount();
    },
    verify: (cubit) {
      expect(auth.signOuts, 1);
      expect(cubit.state.step, RedeemStep.preview);
      expect(cubit.state.isSignedIn, isFalse);
    },
  );
}
