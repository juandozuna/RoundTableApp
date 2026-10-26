import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_palette.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';
import 'status_colors.dart';

/// Material 3 themes built from the "Mesa en vivo" tokens.
abstract final class AppTheme {
  static ThemeData get light => build(AppPalette.light, Brightness.light);

  static ThemeData get dark => build(AppPalette.dark, Brightness.dark);

  static ThemeData build(AppPalette p, Brightness brightness) {
    final scheme = ColorScheme(
      brightness: brightness,
      primary: p.acc,
      onPrimary: p.onc,
      primaryContainer: p.accb,
      onPrimaryContainer: p.onacc,
      secondary: p.lilac,
      onSecondary: p.onc,
      secondaryContainer: p.surf2,
      onSecondaryContainer: p.ink,
      tertiary: p.sky,
      onTertiary: p.onc,
      error: p.err,
      onError: p.onc,
      surface: p.surf,
      onSurface: p.ink,
      onSurfaceVariant: p.mut,
      surfaceContainerLowest: p.bg,
      surfaceContainerLow: p.bg2,
      surfaceContainer: p.surf,
      surfaceContainerHigh: p.surf2,
      surfaceContainerHighest: p.surf2,
      outline: p.bd,
      outlineVariant: p.line,
      inverseSurface: p.ink,
      onInverseSurface: p.bg,
      inversePrimary: p.accb,
      shadow: Colors.black,
      scrim: const Color(0x9E05030E),
      surfaceTint: Colors.transparent,
    );
    final textTheme = AppTypeScale.textTheme(p.ink, p.mut);
    final controlShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadii.md),
    );

    OutlineInputBorder inputBorder(Color color, [double width = 2]) =>
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          borderSide: BorderSide(color: color, width: width),
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: p.bg,
      canvasColor: p.bg,
      dividerColor: p.line,
      focusColor: p.glow,
      hoverColor: p.acc.withValues(alpha: 0.08),
      splashFactory: InkSparkle.splashFactory,
      materialTapTargetSize: MaterialTapTargetSize.padded,
      visualDensity: VisualDensity.standard,
      extensions: [
        AppColors.fromPalette(p),
        StatusColors.fromPalette(p),
        AppTextStyles.from(textTheme),
      ],
      appBarTheme: AppBarTheme(
        backgroundColor: p.bg,
        foregroundColor: p.ink,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: p.accb,
          foregroundColor: p.onacc,
          disabledBackgroundColor: p.surf2,
          disabledForegroundColor: p.mut,
          minimumSize: const Size(AppSizes.minTarget, AppSizes.control),
          shape: controlShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: p.ink,
          backgroundColor: p.surf2,
          side: BorderSide(color: p.bd, width: 2),
          minimumSize: const Size(AppSizes.minTarget, AppSizes.control),
          shape: controlShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: p.acc,
          minimumSize: const Size(AppSizes.minTarget, AppSizes.minTarget),
          shape: controlShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: p.ink,
          minimumSize: const Size(AppSizes.minTarget, AppSizes.minTarget),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surf,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.md + 2,
        ),
        labelStyle: textTheme.bodyLarge?.copyWith(color: p.mut),
        floatingLabelStyle: textTheme.labelLarge?.copyWith(color: p.acc),
        hintStyle: textTheme.bodyLarge?.copyWith(color: p.mut),
        helperStyle: textTheme.bodySmall,
        errorStyle: textTheme.labelMedium?.copyWith(color: p.err),
        errorMaxLines: 3,
        border: inputBorder(p.bd),
        enabledBorder: inputBorder(p.bd),
        focusedBorder: inputBorder(p.acc, 3),
        errorBorder: inputBorder(p.err),
        focusedErrorBorder: inputBorder(p.err, 3),
        disabledBorder: inputBorder(p.line),
      ),
      cardTheme: CardThemeData(
        color: p.surf,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.xl),
          side: BorderSide(color: p.line),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: p.bd, width: 2),
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? p.accb : p.surf,
        ),
        checkColor: WidgetStatePropertyAll(p.onacc),
      ),
      dividerTheme: DividerThemeData(color: p.line, thickness: 1, space: 1),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: p.ink,
        contentTextStyle: textTheme.labelLarge?.copyWith(color: p.bg),
        actionTextColor: p.bg,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: p.surf,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadii.sheet),
        ),
        titleTextStyle: textTheme.titleLarge,
        contentTextStyle: textTheme.bodyLarge?.copyWith(color: p.mut),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: p.surf,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: p.line,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadii.sheet),
          ),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: p.bg2,
        surfaceTintColor: Colors.transparent,
        indicatorColor: p.surf2,
        height: 72,
        // Six destinations on a 390 px phone: no side padding, so "Invitaciones" stays on one line.
        labelPadding: EdgeInsets.zero,
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) => textTheme.labelSmall?.copyWith(
            color: states.contains(WidgetState.selected) ? p.ink : p.mut,
          ),
        ),
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected) ? p.acc : p.mut,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: p.bg2,
        indicatorColor: p.surf2,
        selectedIconTheme: IconThemeData(color: p.acc),
        unselectedIconTheme: IconThemeData(color: p.mut),
        selectedLabelTextStyle: textTheme.labelMedium,
        unselectedLabelTextStyle: textTheme.labelMedium?.copyWith(color: p.mut),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: p.acc,
        linearTrackColor: p.surf2,
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: p.ink,
          borderRadius: BorderRadius.circular(AppRadii.sm),
        ),
        textStyle: textTheme.labelMedium?.copyWith(color: p.bg),
      ),
    );
  }
}
