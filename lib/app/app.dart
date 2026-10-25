import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../core/theme/app_breakpoints.dart';
import '../core/theme/app_theme.dart';
import '../l10n/gen/app_localizations.dart';

class GoldRoundtablesApp extends StatelessWidget {
  const GoldRoundtablesApp({super.key, required this.router});

  final GoRouter router;

  static const Locale locale = Locale('es');

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppBreakpoints.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MaterialApp.router(
        onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        routerConfig: router,
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(
              start: 0,
              end: AppBreakpoints.tablet - 1,
              name: AppBreakpoints.phoneName,
            ),
            Breakpoint(
              start: AppBreakpoints.tablet,
              end: AppBreakpoints.desktop,
              name: AppBreakpoints.tabletName,
            ),
            Breakpoint(
              start: AppBreakpoints.desktop + 1,
              end: double.infinity,
              name: AppBreakpoints.desktopName,
            ),
          ],
        ),
      ),
    );
  }
}
