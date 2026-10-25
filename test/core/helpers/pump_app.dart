import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';

extension PumpApp on WidgetTester {
  /// Pumps [child] inside a themed, Spanish-localized app.
  Future<void> pumpApp(
    Widget child, {
    Brightness brightness = Brightness.light,
    Size size = const Size(390, 844),
  }) async {
    view.physicalSize = size;
    view.devicePixelRatio = 1;
    addTearDown(view.reset);
    await pumpWidget(
      MaterialApp(
        theme: brightness == Brightness.light ? AppTheme.light : AppTheme.dark,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(body: SingleChildScrollView(child: child)),
      ),
    );
  }
}
