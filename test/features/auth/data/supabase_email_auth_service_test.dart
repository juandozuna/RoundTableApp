import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/config/app_config.dart';
import 'package:gold_roundtables/core/config/app_environment.dart';
import 'package:gold_roundtables/features/auth/data/services/supabase_email_auth_service.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/sign_up_outcome.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class MockGoTrue extends Mock implements supabase.GoTrueClient {}

const _config = AppConfig(
  supabaseUrl: 'http://localhost',
  supabaseAnonKey: 'anon',
  powerSyncUrl: '',
  devAuthEnabled: false,
  environment: AppEnvironment.local,
);

supabase.AuthResponse _response({bool withSession = true}) =>
    supabase.AuthResponse(
      session: withSession
          ? supabase.Session(
              accessToken: 'a',
              tokenType: 'bearer',
              user: const supabase.User(
                id: 'u',
                appMetadata: {},
                userMetadata: {},
                aud: 'authenticated',
                createdAt: '2026-01-01',
              ),
            )
          : null,
    );

void main() {
  late MockGoTrue auth;
  late StreamController<supabase.AuthState> events;
  late SupabaseEmailAuthService service;

  setUpAll(() => registerFallbackValue(supabase.UserAttributes()));

  setUp(() {
    auth = MockGoTrue();
    events = StreamController<supabase.AuthState>.broadcast();
    when(() => auth.onAuthStateChange).thenAnswer((_) => events.stream);
    service = SupabaseEmailAuthService(_config, authClient: auth);
  });

  tearDown(() => events.close());

  test('signs in with the trimmed email and the password as typed', () async {
    when(
      () => auth.signInWithPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => _response());

    await service.signIn('  ana@correo.com ', ' secreto 123 ');

    verify(
      () => auth.signInWithPassword(
        email: 'ana@correo.com',
        password: ' secreto 123 ',
      ),
    ).called(1);
  });

  test('a wrong password becomes invalidCredentials, never a raw error', () {
    when(
      () => auth.signInWithPassword(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenThrow(
      const supabase.AuthApiException(
        'Invalid login credentials',
        statusCode: '400',
        code: 'invalid_credentials',
      ),
    );

    expect(
      service.signIn('ana@correo.com', 'nope'),
      throwsA(
        isA<AuthFailure>().having(
          (f) => f.kind,
          'kind',
          AuthFailureKind.invalidCredentials,
        ),
      ),
    );
  });

  test('sign-up reports whether the person is signed in', () async {
    when(
      () => auth.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => _response());
    expect(
      await service.createAccount('a@b.co', 'secreto-123'),
      SignUpOutcome.signedIn,
    );

    when(
      () => auth.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => _response(withSession: false));
    expect(
      await service.createAccount('a@b.co', 'secreto-123'),
      SignUpOutcome.confirmationPending,
    );
  });

  test('sign-up with a taken email is emailAlreadyRegistered', () {
    when(
      () => auth.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenThrow(
      const supabase.AuthApiException(
        'User already registered',
        statusCode: '422',
        code: 'user_already_exists',
      ),
    );
    expect(
      service.createAccount('a@b.co', 'secreto-123'),
      throwsA(
        isA<AuthFailure>().having(
          (f) => f.kind,
          'kind',
          AuthFailureKind.emailAlreadyRegistered,
        ),
      ),
    );
  });

  test('the reset email asks Supabase to return to the app', () async {
    when(
      () => auth.resetPasswordForEmail(
        any(),
        redirectTo: any(named: 'redirectTo'),
      ),
    ).thenAnswer((_) async {});

    await service.requestPasswordReset(
      ' ana@correo.com ',
      returnPath: '/nueva-contrasena',
    );

    // Tests are not web: the mobile deep link is used.
    verify(
      () => auth.resetPasswordForEmail(
        'ana@correo.com',
        redirectTo: 'io.goldroundtables.app://login-callback',
      ),
    ).called(1);
  });

  test('a rate-limited reset is rateLimited', () {
    when(
      () => auth.resetPasswordForEmail(
        any(),
        redirectTo: any(named: 'redirectTo'),
      ),
    ).thenThrow(
      const supabase.AuthApiException(
        'rate limit',
        statusCode: '429',
        code: 'over_email_send_rate_limit',
      ),
    );
    expect(
      service.requestPasswordReset('a@b.co', returnPath: '/x'),
      throwsA(
        isA<AuthFailure>().having(
          (f) => f.kind,
          'kind',
          AuthFailureKind.rateLimited,
        ),
      ),
    );
  });

  test(
    'a recovery event marks the password as pending until it is set',
    () async {
      when(() => auth.updateUser(any())).thenAnswer(
        (_) async => supabase.UserResponse.fromJson({
          'id': 'u',
          'aud': 'authenticated',
          'created_at': '2026-01-01',
          'app_metadata': <String, dynamic>{},
          'user_metadata': <String, dynamic>{},
        }),
      );
      final changes = <bool>[];
      service.watchPasswordRecoveryPending().listen(changes.add);
      expect(service.isPasswordRecoveryPending, isFalse);

      events.add(
        const supabase.AuthState(
          supabase.AuthChangeEvent.passwordRecovery,
          null,
        ),
      );
      await pumpEventQueue();
      expect(service.isPasswordRecoveryPending, isTrue);

      await service.updatePassword('nueva-clave-1');
      expect(service.isPasswordRecoveryPending, isFalse);
      await pumpEventQueue();
      expect(changes, [true, false]);
      verify(() => auth.updateUser(any())).called(1);
    },
  );

  test('signing out ends a pending recovery', () async {
    events.add(
      const supabase.AuthState(supabase.AuthChangeEvent.passwordRecovery, null),
    );
    await pumpEventQueue();
    events.add(
      const supabase.AuthState(supabase.AuthChangeEvent.signedOut, null),
    );
    await pumpEventQueue();
    expect(service.isPasswordRecoveryPending, isFalse);
  });
}
