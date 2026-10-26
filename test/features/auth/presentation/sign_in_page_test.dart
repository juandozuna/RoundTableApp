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

  setUpAll(() => registerFallbackValue(AuthProvider.google));

  setUp(() {
    cubit = MockSignInCubit();
  });

  Future<void> pump(
    WidgetTester tester,
    SignInState state, {
    Size? size,
  }) async {
    when(() => cubit.state).thenReturn(state);
    tester.view.physicalSize = size ?? const Size(390, 1400);
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

  testWidgets('offers the three providers, the invite code and QR', (
    tester,
  ) async {
    await pump(tester, const SignInState());

    expect(find.text('Entra a tu mesa'), findsOneWidget);
    expect(find.text('Continuar con Google'), findsOneWidget);
    expect(find.text('Continuar con Apple'), findsOneWidget);
    expect(find.text('Continuar con Facebook'), findsOneWidget);
    expect(find.text('Tengo un código de invitación'), findsOneWidget);
    expect(find.text('Escanear QR'), findsOneWidget);
    expect(find.textContaining('No se usa SMS'), findsOneWidget);
  });

  testWidgets('shows why sign-in failed', (tester) async {
    await pump(tester, const SignInState(notice: SignInNotice.offline));
    expect(find.text('Necesitas internet para entrar'), findsOneWidget);
  });

  testWidgets('tapping a provider starts that flow', (tester) async {
    await pump(tester, const SignInState());
    when(
      () => cubit.signIn(any(), returnPath: any(named: 'returnPath')),
    ).thenAnswer((_) async {});

    await tester.tap(find.text('Continuar con Google'));
    verify(
      () => cubit.signIn(any(), returnPath: any(named: 'returnPath')),
    ).called(1);
  });

  testWidgets('wide screens show the brand pane next to the gate', (
    tester,
  ) async {
    await pump(tester, const SignInState(), size: const Size(1280, 800));
    expect(find.textContaining('Una sola puerta'), findsOneWidget);
    expect(find.text('Continuar con Google'), findsOneWidget);
  });
}
