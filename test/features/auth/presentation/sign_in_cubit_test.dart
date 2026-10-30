import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_methods.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/domain/models/signed_in_user.dart';
import 'package:gold_roundtables/features/auth/domain/models/sign_up_outcome.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_methods_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/dev_auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/create_dev_account_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/create_email_account_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/get_enabled_auth_methods_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/request_password_reset_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/sign_in_with_dev_password_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/sign_in_with_email_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/sign_in_with_provider_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/watch_auth_failures_use_case.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_state.dart';

import '../helpers/fakes.dart';

class FakeAuth implements AuthService {
  final StreamController<AuthFailure> failureController =
      StreamController<AuthFailure>.broadcast();
  AuthProvider? lastProvider;
  String? lastReturnPath;
  AuthFailure? throwOnSignIn;

  @override
  SignedInUser? get currentUser => null;

  @override
  Stream<AuthFailure> get failures => failureController.stream;

  @override
  Future<void> signInWithProvider(
    AuthProvider provider, {
    String? returnPath,
  }) async {
    lastProvider = provider;
    lastReturnPath = returnPath;
    final failure = throwOnSignIn;
    if (failure != null) throw failure;
  }

  @override
  Future<void> signOut() async {}

  @override
  Stream<SignedInUser?> watchUser() => const Stream.empty();
}

class FakeConnectivity implements ConnectivityService {
  FakeConnectivity(this.online);

  final bool online;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watchOnline() => Stream.value(online);
}

class FakeDev implements DevAuthService {
  AuthFailure? failure;

  @override
  bool get isAvailable => true;

  @override
  Future<String> createAccount() async => 'nuevo@dev.local';

  @override
  Future<void> signIn(String email, String password) async {
    if (failure != null) throw failure!;
  }
}

class FakeMethods implements AuthMethodsService {
  FakeMethods(this.enabled);

  @override
  final EnabledAuthMethods enabled;
}

void main() {
  late FakeAuth auth;
  late FakeDev dev;
  late FakeEmailAuth email;
  var online = true;
  var methods = const EnabledAuthMethods();

  SignInCubit build() {
    final connectivity = FakeConnectivity(online);
    return SignInCubit(
      SignInWithProviderUseCase(auth, connectivity),
      SignInWithEmailUseCase(email, connectivity),
      CreateEmailAccountUseCase(email, connectivity),
      RequestPasswordResetUseCase(email, connectivity),
      SignInWithDevPasswordUseCase(dev),
      CreateDevAccountUseCase(dev),
      WatchAuthFailuresUseCase(auth),
      GetEnabledAuthMethodsUseCase(FakeMethods(methods)),
    );
  }

  const withProviders = EnabledAuthMethods(
    providers: [AuthProvider.google, AuthProvider.apple, AuthProvider.facebook],
  );
  const providerState = SignInState(
    providers: [AuthProvider.google, AuthProvider.apple, AuthProvider.facebook],
  );

  setUp(() {
    auth = FakeAuth();
    dev = FakeDev();
    email = FakeEmailAuth();
    online = true;
    methods = const EnabledAuthMethods();
  });

  test('starts from the methods the build enables', () {
    expect(build().state, const SignInState());
    methods = const EnabledAuthMethods(
      email: false,
      providers: [AuthProvider.google],
    );
    final social = build().state;
    expect(social.emailEnabled, isFalse);
    expect(social.providers, [AuthProvider.google]);
  });

  group('providers', () {
    setUp(() => methods = withProviders);

    blocTest<SignInCubit, SignInState>(
      'opens the provider flow and waits for the session',
      build: build,
      act: (cubit) =>
          cubit.signIn(AuthProvider.google, returnPath: '/invitacion/ABC234'),
      expect: () => [providerState.copyWith(signingInWith: AuthProvider.google)],
      verify: (_) {
        expect(auth.lastProvider, AuthProvider.google);
        expect(auth.lastReturnPath, '/invitacion/ABC234');
      },
    );

    blocTest<SignInCubit, SignInState>(
      'first sign-in without internet explains that it needs a connection',
      build: () {
        online = false;
        return build();
      },
      act: (cubit) => cubit.signIn(AuthProvider.apple),
      expect: () => [
        providerState.copyWith(signingInWith: AuthProvider.apple),
        providerState.copyWith(notice: SignInNotice.offline),
      ],
      verify: (_) => expect(auth.lastProvider, isNull),
    );

    blocTest<SignInCubit, SignInState>(
      'a provider that was cancelled afterwards clears the busy state',
      build: build,
      act: (cubit) async {
        await cubit.signIn(AuthProvider.facebook);
        auth.failureController.add(
          const AuthFailure(AuthFailureKind.cancelled),
        );
      },
      expect: () => [
        providerState.copyWith(signingInWith: AuthProvider.facebook),
        providerState.copyWith(notice: SignInNotice.cancelled),
      ],
    );

    blocTest<SignInCubit, SignInState>(
      'ignores a second tap while busy',
      build: build,
      act: (cubit) async {
        await cubit.signIn(AuthProvider.google);
        await cubit.signIn(AuthProvider.apple);
      },
      expect: () => [providerState.copyWith(signingInWith: AuthProvider.google)],
    );
  });

  group('email', () {
    blocTest<SignInCubit, SignInState>(
      'signs in with email and password',
      build: build,
      act: (cubit) => cubit.signInWithEmail('ana@correo.com', 'secreto-123'),
      expect: () => [
        const SignInState(emailBusy: true),
        const SignInState(),
      ],
      verify: (_) =>
          expect(email.calls, ['signIn:ana@correo.com:secreto-123']),
    );

    blocTest<SignInCubit, SignInState>(
      'wrong credentials show the credentials notice',
      build: () {
        email.failure = const AuthFailure(AuthFailureKind.invalidCredentials);
        return build();
      },
      act: (cubit) => cubit.signInWithEmail('ana@correo.com', 'nope'),
      expect: () => [
        const SignInState(emailBusy: true),
        const SignInState(notice: SignInNotice.invalidCredentials),
      ],
    );

    blocTest<SignInCubit, SignInState>(
      'sign-in without internet does not reach the server',
      build: () {
        online = false;
        return build();
      },
      act: (cubit) => cubit.signInWithEmail('ana@correo.com', 'secreto-123'),
      expect: () => [
        const SignInState(emailBusy: true),
        const SignInState(notice: SignInNotice.offline),
      ],
      verify: (_) => expect(email.calls, isEmpty),
    );

    blocTest<SignInCubit, SignInState>(
      'switching mode keeps the form and clears the notice',
      build: build,
      seed: () => const SignInState(notice: SignInNotice.invalidCredentials),
      act: (cubit) => cubit.showMode(SignInMode.createAccount),
      expect: () => [const SignInState(mode: SignInMode.createAccount)],
    );

    blocTest<SignInCubit, SignInState>(
      'creating an account signs in right away when no confirmation is needed',
      build: build,
      act: (cubit) async {
        cubit.showMode(SignInMode.createAccount);
        await cubit.createAccount('ana@correo.com', 'secreto-123');
      },
      expect: () => [
        const SignInState(mode: SignInMode.createAccount),
        const SignInState(mode: SignInMode.createAccount, emailBusy: true),
        const SignInState(mode: SignInMode.createAccount),
      ],
      verify: (_) =>
          expect(email.calls, ['createAccount:ana@correo.com:secreto-123']),
    );

    blocTest<SignInCubit, SignInState>(
      'when the server wants the email confirmed the person is told to check it',
      build: () {
        email.outcome = SignUpOutcome.confirmationPending;
        return build();
      },
      act: (cubit) => cubit.createAccount('ana@correo.com', 'secreto-123'),
      expect: () => [
        const SignInState(emailBusy: true),
        const SignInState(notice: SignInNotice.confirmEmailSent),
      ],
    );

    for (final (kind, notice) in [
      (AuthFailureKind.emailAlreadyRegistered, SignInNotice.emailAlreadyRegistered),
      (AuthFailureKind.weakPassword, SignInNotice.weakPassword),
      (AuthFailureKind.rateLimited, SignInNotice.rateLimited),
      (AuthFailureKind.emailNotConfirmed, SignInNotice.emailNotConfirmed),
      (AuthFailureKind.unknown, SignInNotice.failed),
    ]) {
      blocTest<SignInCubit, SignInState>(
        'a $kind failure becomes the $notice notice',
        build: () {
          email.failure = AuthFailure(kind);
          return build();
        },
        act: (cubit) => cubit.createAccount('ana@correo.com', 'secreto-123'),
        expect: () => [
          const SignInState(emailBusy: true),
          SignInState(notice: notice),
        ],
      );
    }

    blocTest<SignInCubit, SignInState>(
      'asking for a reset email returns to sign-in with a confirmation',
      build: build,
      act: (cubit) async {
        cubit.showMode(SignInMode.resetPassword);
        await cubit.requestPasswordReset(
          'ana@correo.com',
          returnPath: '/nueva-contrasena',
        );
      },
      expect: () => [
        const SignInState(mode: SignInMode.resetPassword),
        const SignInState(mode: SignInMode.resetPassword, emailBusy: true),
        const SignInState(notice: SignInNotice.resetEmailSent),
      ],
      verify: (_) =>
          expect(email.calls, ['reset:ana@correo.com:/nueva-contrasena']),
    );

    blocTest<SignInCubit, SignInState>(
      'ignores a second submit while busy',
      build: build,
      act: (cubit) async {
        final first = cubit.signInWithEmail('a@b.co', 'secreto-123');
        await cubit.signInWithEmail('a@b.co', 'secreto-123');
        await first;
      },
      verify: (_) => expect(email.calls, hasLength(1)),
    );
  });

  blocTest<SignInCubit, SignInState>(
    'wrong dev credentials show the credentials notice',
    build: () {
      dev.failure = const AuthFailure(AuthFailureKind.invalidCredentials);
      return build();
    },
    act: (cubit) => cubit.signInAsDevUser('x@dev.local', 'nope'),
    expect: () => [
      const SignInState(devBusy: true),
      const SignInState(notice: SignInNotice.invalidCredentials),
    ],
  );
}
