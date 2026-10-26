import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/domain/models/signed_in_user.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/dev_auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/create_dev_account_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/sign_in_with_dev_password_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/sign_in_with_provider_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/watch_auth_failures_use_case.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_state.dart';

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

void main() {
  late FakeAuth auth;
  late FakeDev dev;
  var online = true;

  SignInCubit build() => SignInCubit(
    SignInWithProviderUseCase(auth, FakeConnectivity(online)),
    SignInWithDevPasswordUseCase(dev),
    CreateDevAccountUseCase(dev),
    WatchAuthFailuresUseCase(auth),
  );

  setUp(() {
    auth = FakeAuth();
    dev = FakeDev();
    online = true;
  });

  blocTest<SignInCubit, SignInState>(
    'opens the provider flow and waits for the session',
    build: build,
    act: (cubit) =>
        cubit.signIn(AuthProvider.google, returnPath: '/invitacion/ABC234'),
    expect: () => [const SignInState(signingInWith: AuthProvider.google)],
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
      const SignInState(signingInWith: AuthProvider.apple),
      const SignInState(notice: SignInNotice.offline),
    ],
    verify: (_) => expect(auth.lastProvider, isNull),
  );

  blocTest<SignInCubit, SignInState>(
    'a provider that was cancelled afterwards clears the busy state',
    build: build,
    act: (cubit) async {
      await cubit.signIn(AuthProvider.facebook);
      auth.failureController.add(const AuthFailure(AuthFailureKind.cancelled));
    },
    expect: () => [
      const SignInState(signingInWith: AuthProvider.facebook),
      const SignInState(notice: SignInNotice.cancelled),
    ],
  );

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

  blocTest<SignInCubit, SignInState>(
    'ignores a second tap while busy',
    build: build,
    act: (cubit) async {
      await cubit.signIn(AuthProvider.google);
      await cubit.signIn(AuthProvider.apple);
    },
    expect: () => [const SignInState(signingInWith: AuthProvider.google)],
  );
}
