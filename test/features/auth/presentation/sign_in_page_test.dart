import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/cubit/sign_in_state.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

class MockSignInCubit extends MockCubit<SignInState> implements SignInCubit {}

void main() {
  late MockSignInCubit cubit;

  const allProviders = [
    AuthProvider.google,
    AuthProvider.apple,
    AuthProvider.facebook,
  ];

  setUpAll(() {
    registerFallbackValue(AuthProvider.google);
    registerFallbackValue(SignInMode.signIn);
  });

  setUp(() {
    cubit = MockSignInCubit();
  });

  Future<void> pump(
    WidgetTester tester,
    SignInState state, {
    Size? size,
  }) async {
    when(() => cubit.state).thenReturn(state);
    tester.view.physicalSize = size ?? const Size(390, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: BlocProvider<SignInCubit>.value(
          value: cubit,
          child: const SignInPage(),
        ),
      ),
    );
  }

  group('enabled methods', () {
    testWidgets('email only (the production default) shows no provider', (
      tester,
    ) async {
      await pump(tester, const SignInState());

      expect(find.text('Entra a tu mesa'), findsOneWidget);
      expect(find.text('Correo *'), findsOneWidget);
      expect(find.text('Contraseña *'), findsOneWidget);
      expect(find.text('Entrar'), findsOneWidget);
      expect(find.text('¿Olvidaste tu contraseña?'), findsOneWidget);
      expect(find.text('¿Primera vez? Crear cuenta'), findsOneWidget);
      expect(find.text('Continuar con Google'), findsNothing);
      expect(find.text('Continuar con Apple'), findsNothing);
      expect(find.text('Continuar con Facebook'), findsNothing);
      expect(find.text('Tengo un código de invitación'), findsOneWidget);
      expect(find.text('Escanear QR'), findsOneWidget);
      expect(find.textContaining('No se usa SMS'), findsOneWidget);
    });

    testWidgets('providers only shows no email form', (tester) async {
      await pump(
        tester,
        const SignInState(emailEnabled: false, providers: allProviders),
      );

      expect(find.text('Continuar con Google'), findsOneWidget);
      expect(find.text('Continuar con Apple'), findsOneWidget);
      expect(find.text('Continuar con Facebook'), findsOneWidget);
      expect(find.text('Correo *'), findsNothing);
      expect(find.text('Entrar'), findsNothing);
    });

    testWidgets('a single enabled provider is the only provider shown', (
      tester,
    ) async {
      await pump(tester, const SignInState(providers: [AuthProvider.google]));

      expect(find.text('Continuar con Google'), findsOneWidget);
      expect(find.text('Continuar con Apple'), findsNothing);
      expect(find.text('Correo *'), findsOneWidget);
    });

    testWidgets('everything enabled shows email and the three providers', (
      tester,
    ) async {
      await pump(tester, const SignInState(providers: allProviders));

      expect(find.text('Correo *'), findsOneWidget);
      expect(find.text('Continuar con Google'), findsOneWidget);
      expect(find.text('Continuar con Apple'), findsOneWidget);
      expect(find.text('Continuar con Facebook'), findsOneWidget);
    });
  });

  group('email form', () {
    testWidgets('empty fields are validated and nothing is sent', (
      tester,
    ) async {
      await pump(tester, const SignInState());

      await tester.tap(find.text('Entrar'));
      await tester.pump();

      expect(find.text('Este campo es obligatorio.'), findsNWidgets(2));
      verifyNever(() => cubit.signInWithEmail(any(), any()));
    });

    testWidgets('a valid form signs in with the typed values', (tester) async {
      when(() => cubit.signInWithEmail(any(), any())).thenAnswer((_) async {});
      await pump(tester, const SignInState());

      await tester.enterText(find.byType(TextField).at(0), 'Ana@Correo.com');
      await tester.enterText(find.byType(TextField).at(1), 'secreto-123');
      await tester.tap(find.text('Entrar'));
      await tester.pump();

      verify(
        () => cubit.signInWithEmail('ana@correo.com', 'secreto-123'),
      ).called(1);
    });

    testWidgets('the password is hidden until the eye is tapped', (
      tester,
    ) async {
      await pump(tester, const SignInState());

      EditableText field() => tester.widget<EditableText>(
        find.descendant(
          of: find.byType(TextField).at(1),
          matching: find.byType(EditableText),
        ),
      );
      expect(field().obscureText, isTrue);

      await tester.tap(find.byTooltip('Mostrar contraseña'));
      await tester.pump();
      expect(field().obscureText, isFalse);
      expect(find.byTooltip('Ocultar contraseña'), findsOneWidget);
    });

    testWidgets('the mode links ask the cubit to change mode', (tester) async {
      await pump(tester, const SignInState());

      await tester.tap(find.text('¿Olvidaste tu contraseña?'));
      verify(() => cubit.showMode(SignInMode.resetPassword)).called(1);

      await tester.tap(find.text('¿Primera vez? Crear cuenta'));
      verify(() => cubit.showMode(SignInMode.createAccount)).called(1);
    });

    testWidgets('create account asks for a long password twice', (
      tester,
    ) async {
      when(() => cubit.createAccount(any(), any())).thenAnswer((_) async {});
      await pump(tester, const SignInState(mode: SignInMode.createAccount));

      expect(find.text('Crea tu cuenta'), findsOneWidget);
      expect(find.text('Repite la contraseña *'), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), 'ana@correo.com');
      await tester.enterText(find.byType(TextField).at(1), 'corta');
      await tester.enterText(find.byType(TextField).at(2), 'otra');
      await tester.tap(find.text('Crear cuenta').last);
      await tester.pump();
      expect(
        find.text('La contraseña debe tener al menos 8 caracteres.'),
        findsOneWidget,
      );
      expect(find.text('Las contraseñas no coinciden.'), findsOneWidget);
      verifyNever(() => cubit.createAccount(any(), any()));

      await tester.enterText(find.byType(TextField).at(1), 'secreto-123');
      await tester.enterText(find.byType(TextField).at(2), 'secreto-123');
      await tester.tap(find.text('Crear cuenta').last);
      await tester.pump();
      verify(
        () => cubit.createAccount('ana@correo.com', 'secreto-123'),
      ).called(1);
    });

    testWidgets('reset mode sends the link and offers a way back', (
      tester,
    ) async {
      when(
        () => cubit.requestPasswordReset(
          any(),
          returnPath: any(named: 'returnPath'),
        ),
      ).thenAnswer((_) async {});
      await pump(tester, const SignInState(mode: SignInMode.resetPassword));

      expect(find.text('Recupera tu contraseña'), findsOneWidget);
      expect(find.text('Contraseña *'), findsNothing);
      expect(find.byTooltip('Volver'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'ana@correo.com');
      await tester.tap(find.text('Enviar enlace'));
      await tester.pump();
      verify(
        () => cubit.requestPasswordReset(
          'ana@correo.com',
          returnPath: '/nueva-contrasena',
        ),
      ).called(1);

      await tester.tap(find.byTooltip('Volver'));
      verify(() => cubit.showMode(SignInMode.signIn)).called(1);
    });

    testWidgets('the form is locked while a request is running', (
      tester,
    ) async {
      await pump(tester, const SignInState(emailBusy: true));
      await tester.tap(find.text('¿Olvidaste tu contraseña?'));
      verifyNever(() => cubit.showMode(any()));
    });
  });

  group('notices', () {
    testWidgets('shows why sign-in failed', (tester) async {
      await pump(tester, const SignInState(notice: SignInNotice.offline));
      expect(find.text('Necesitas internet para entrar'), findsOneWidget);
    });

    testWidgets('wrong credentials are explained in plain words', (
      tester,
    ) async {
      await pump(
        tester,
        const SignInState(notice: SignInNotice.invalidCredentials),
      );
      expect(find.text('Correo o contraseña incorrectos.'), findsOneWidget);
    });

    testWidgets('the reset email confirmation is shown', (tester) async {
      await pump(
        tester,
        const SignInState(notice: SignInNotice.resetEmailSent),
      );
      expect(find.text('Revisa tu correo'), findsOneWidget);
    });
  });

  testWidgets('tapping a provider starts that flow', (tester) async {
    await pump(tester, const SignInState(providers: allProviders));
    when(
      () => cubit.signIn(any(), returnPath: any(named: 'returnPath')),
    ).thenAnswer((_) async {});

    await tester.tap(find.text('Continuar con Google'));
    verify(
      () => cubit.signIn(
        AuthProvider.google,
        returnPath: any(named: 'returnPath'),
      ),
    ).called(1);
  });

  testWidgets('wide screens show the brand pane next to the gate', (
    tester,
  ) async {
    await pump(tester, const SignInState(), size: const Size(1280, 800));
    expect(find.textContaining('Una sola puerta'), findsOneWidget);
    expect(find.text('Correo *'), findsOneWidget);
  });
}
