import 'package:flutter/material.dart';

/// Heavy headings, tabular figures. All sizes live here; features use
/// `Theme.of(context).textTheme` or `context.textStyles`, never raw
/// `fontSize` (AGENTS.md §12).
abstract final class AppTypeScale {
  static TextTheme textTheme(Color ink, Color muted) => TextTheme(
    displaySmall: TextStyle(
      fontSize: 30,
      height: 1.05,
      fontWeight: FontWeight.w900,
      letterSpacing: -0.6,
      color: ink,
    ),
    headlineMedium: TextStyle(
      fontSize: 26,
      height: 1.1,
      fontWeight: FontWeight.w900,
      letterSpacing: -0.5,
      color: ink,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      height: 1.15,
      fontWeight: FontWeight.w900,
      letterSpacing: -0.3,
      color: ink,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w900,
      color: ink,
    ),
    titleMedium: TextStyle(
      fontSize: 17,
      height: 1.25,
      fontWeight: FontWeight.w800,
      color: ink,
    ),
    titleSmall: TextStyle(
      fontSize: 15,
      height: 1.3,
      fontWeight: FontWeight.w800,
      color: ink,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      height: 1.35,
      fontWeight: FontWeight.w500,
      color: ink,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: 1.35,
      fontWeight: FontWeight.w500,
      color: ink,
    ),
    bodySmall: TextStyle(
      fontSize: 12.5,
      height: 1.35,
      fontWeight: FontWeight.w600,
      color: muted,
    ),
    labelLarge: TextStyle(
      fontSize: 15,
      height: 1.2,
      fontWeight: FontWeight.w800,
      color: ink,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      height: 1.2,
      fontWeight: FontWeight.w800,
      color: ink,
    ),
    labelSmall: TextStyle(
      fontSize: 11,
      height: 1.2,
      fontWeight: FontWeight.w800,
      letterSpacing: 1.4,
      color: muted,
    ),
  );
}

/// Extra styles that the Material [TextTheme] has no slot for.
/// Read with `context.textStyles`.
@immutable
class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.kicker,
    required this.pill,
    required this.number,
    required this.numberLarge,
    required this.primaryAction,
  });

  factory AppTextStyles.from(TextTheme theme) {
    const tabular = [FontFeature.tabularFigures()];
    return AppTextStyles(
      kicker: theme.labelSmall!,
      pill: theme.labelMedium!.copyWith(fontSize: 12),
      number: theme.headlineSmall!.copyWith(fontFeatures: tabular),
      numberLarge: theme.displaySmall!.copyWith(
        fontSize: 38,
        letterSpacing: -1.1,
        height: 1,
        fontFeatures: tabular,
      ),
      primaryAction: theme.titleMedium!.copyWith(fontWeight: FontWeight.w900),
    );
  }

  /// Uppercase section label ("ETAPA 3 DE 6"). Uppercase the string itself.
  final TextStyle kicker;

  /// Status pills and chips.
  final TextStyle pill;

  /// Scores and counters, tabular figures.
  final TextStyle number;

  /// Hero numbers (table centre), tabular figures.
  final TextStyle numberLarge;

  /// Label of the main call to action.
  final TextStyle primaryAction;

  @override
  AppTextStyles copyWith({
    TextStyle? kicker,
    TextStyle? pill,
    TextStyle? number,
    TextStyle? numberLarge,
    TextStyle? primaryAction,
  }) => AppTextStyles(
    kicker: kicker ?? this.kicker,
    pill: pill ?? this.pill,
    number: number ?? this.number,
    numberLarge: numberLarge ?? this.numberLarge,
    primaryAction: primaryAction ?? this.primaryAction,
  );

  @override
  AppTextStyles lerp(AppTextStyles? other, double t) {
    if (other == null) return this;
    return AppTextStyles(
      kicker: TextStyle.lerp(kicker, other.kicker, t)!,
      pill: TextStyle.lerp(pill, other.pill, t)!,
      number: TextStyle.lerp(number, other.number, t)!,
      numberLarge: TextStyle.lerp(numberLarge, other.numberLarge, t)!,
      primaryAction: TextStyle.lerp(primaryAction, other.primaryAction, t)!,
    );
  }
}
