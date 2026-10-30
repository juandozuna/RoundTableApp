import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/domain/models/signed_in_user.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_in/set_new_password_use_case.dart';
import 'package:gold_roundtables/features/auth/domain/use_cases/sign_out/sign_out_use_case.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/reset_password/cubit/reset_password_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/reset_password/cubit/reset_password_state.dart';

import '../helpers/fakes.dart';
import 'sign_in_cubit_test.dart' show FakeConnectivity;

class _SignOutRecorder implements AuthService {
  int signOuts = 0;

  @override
  SignedInUser? get currentUser => null;

  @override
  Stream<AuthFailure> get failures => const Stream.empty();

  @override
  Future<void> signInWithProvider(
    AuthProvider provider, {
    String? returnPath,
  }) async {}

  @override
  Future<void> signOut() async => signOuts++;

  @override
  Stream<SignedInUser?> watchUser() => const Stream.empty();
}

void main() {
  late FakeEmailAuth email;
  late _SignOutRecorder auth;
  var online = true;

  ResetPasswordCubit build() => ResetPasswordCubit(
    SetNewPasswordUseCase(email, FakeConnectivity(online)),
    SignOutUseCase(auth),
  );

  setUp(() {
    email = FakeEmailAuth();
    auth = _SignOutRecorder();
    online = true;
  });

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'saves the new password and offers to continue',
    build: build,
    act: (cubit) => cubit.save('nueva-clave-1'),
    expect: () => [
      const ResetPasswordState(saving: true),
      const ResetPasswordState(done: true),
    ],
    verify: (_) => expect(email.calls, ['updatePassword:nueva-clave-1']),
  );

  for (final (kind, notice) in [
    (AuthFailureKind.weakPassword, ResetPasswordNotice.weakPassword),
    (AuthFailureKind.linkExpired, ResetPasswordNotice.linkExpired),
    (AuthFailureKind.rateLimited, ResetPasswordNotice.rateLimited),
    (AuthFailureKind.unknown, ResetPasswordNotice.failed),
  ]) {
    blocTest<ResetPasswordCubit, ResetPasswordState>(
      'a $kind failure shows $notice',
      build: () {
        email.failure = AuthFailure(kind);
        return build();
      },
      act: (cubit) => cubit.save('nueva-clave-1'),
      expect: () => [
        const ResetPasswordState(saving: true),
        ResetPasswordState(notice: notice),
      ],
    );
  }

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'without internet nothing is sent',
    build: () {
      online = false;
      return build();
    },
    act: (cubit) => cubit.save('nueva-clave-1'),
    expect: () => [
      const ResetPasswordState(saving: true),
      const ResetPasswordState(notice: ResetPasswordNotice.offline),
    ],
    verify: (_) => expect(email.calls, isEmpty),
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'cancelling ends the recovery session',
    build: build,
    act: (cubit) => cubit.cancel(),
    verify: (_) => expect(auth.signOuts, 1),
  );
}
