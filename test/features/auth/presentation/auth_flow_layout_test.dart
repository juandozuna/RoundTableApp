import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/auth/presentation/widgets/auth_flow_layout.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';

void main() {
  testWidgets('custom back action is reachable by its tooltip', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    var backs = 0;
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('es'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: AuthFlowLayout(
          onBack: () => backs++,
          banner: const Text('sin conexión'),
          child: const Text('contenido'),
        ),
      ),
    );
    expect(find.text('contenido'), findsOneWidget);
    expect(find.text('sin conexión'), findsOneWidget);

    await tester.tap(find.byTooltip('Volver'));
    expect(backs, 1);
    expect(tester.getSize(find.byTooltip('Volver')).shortestSide, 44);
  });
}
