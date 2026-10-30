import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/reset_password/cubit/reset_password_cubit.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/reset_password/cubit/reset_password_state.dart';
import 'package:gold_roundtables/features/auth/presentation/pages/reset_password/reset_password_page.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';
import 'package:mocktail/mocktail.dart';

class MockResetCubit extends MockCubit<ResetPasswordState>
    implements ResetPasswordCubit {}

void main() {
  late MockResetCubit cubit;

  setUp(() => cubit = MockResetCubit());

  Future<void> pump(WidgetTester tester, ResetPasswordState state) async {
    when(() => cubit.state).thenReturn(state);
    tester.view.physicalSize = const Size(390, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: BlocProvider<ResetPasswordCubit>.value(
          value: cubit,
          child: const ResetPasswordPage(),
        ),
      ),
    );
  }

  testWidgets('saves a valid, repeated password', (tester) async {
    when(() => cubit.save(any())).thenAnswer((_) async {});
    await pump(tester, const ResetPasswordState());

    await tester.enterText(find.byType(TextField).at(0), 'nueva-clave-1');
    await tester.enterText(find.byType(TextField).at(1), 'nueva-clave-2');
    await tester.tap(find.text('Guardar contraseña'));
    await tester.pump();
    expect(find.text('Las contraseñas no coinciden.'), findsOneWidget);
    verifyNever(() => cubit.save(any()));

    await tester.enterText(find.byType(TextField).at(1), 'nueva-clave-1');
    await tester.tap(find.text('Guardar contraseña'));
    await tester.pump();
    verify(() => cubit.save('nueva-clave-1')).called(1);
  });

  testWidgets('has two ways out: the back arrow and "Ahora no"', (
    tester,
  ) async {
    when(() => cubit.cancel()).thenAnswer((_) async {});
    await pump(tester, const ResetPasswordState());

    await tester.tap(find.byTooltip('Volver'));
    await tester.tap(find.text('Ahora no'));
    verify(() => cubit.cancel()).called(2);
  });

  testWidgets('shows the expired-link notice', (tester) async {
    await pump(
      tester,
      const ResetPasswordState(notice: ResetPasswordNotice.linkExpired),
    );
    expect(find.text('El enlace ya no sirve'), findsOneWidget);
  });

  testWidgets('after saving it offers to continue', (tester) async {
    await pump(tester, const ResetPasswordState(done: true));
    expect(find.text('Contraseña actualizada'), findsOneWidget);
    expect(find.text('Continuar'), findsOneWidget);
    expect(find.text('Guardar contraseña'), findsNothing);
  });
}
