import 'package:flutter/material.dart';

import 'app_palette.dart';

/// Surface, ink and accent tokens. Read with `context.colors`.
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.page,
    required this.background,
    required this.backgroundAlt,
    required this.surface,
    required this.surfaceAlt,
    required this.line,
    required this.ink,
    required this.muted,
    required this.accent,
    required this.accentStrong,
    required this.accentGradientEnd,
    required this.border,
    required this.onAccent,
    required this.glow,
  });

  factory AppColors.fromPalette(AppPalette p) => AppColors(
    page: p.page,
    background: p.bg,
    backgroundAlt: p.bg2,
    surface: p.surf,
    surfaceAlt: p.surf2,
    line: p.line,
    ink: p.ink,
    muted: p.mut,
    accent: p.acc,
    accentStrong: p.accb,
    accentGradientEnd: p.accg,
    border: p.bd,
    onAccent: p.onacc,
    glow: p.glow,
  );

  final Color page;
  final Color background;
  final Color backgroundAlt;
  final Color surface;
  final Color surfaceAlt;

  /// Hairlines and card borders (decorative, not a control boundary).
  final Color line;

  /// Primary text.
  final Color ink;

  /// Secondary text.
  final Color muted;

  /// Accent for text, icons and focus on surfaces.
  final Color accent;

  /// Accent fill behind [onAccent] content.
  final Color accentStrong;
  final Color accentGradientEnd;

  /// Control boundaries (inputs, secondary buttons).
  final Color border;
  final Color onAccent;
  final Color glow;

  LinearGradient get accentGradient => LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentStrong, accentGradientEnd],
  );

  @override
  AppColors copyWith({
    Color? page,
    Color? background,
    Color? backgroundAlt,
    Color? surface,
    Color? surfaceAlt,
    Color? line,
    Color? ink,
    Color? muted,
    Color? accent,
    Color? accentStrong,
    Color? accentGradientEnd,
    Color? border,
    Color? onAccent,
    Color? glow,
  }) => AppColors(
    page: page ?? this.page,
    background: background ?? this.background,
    backgroundAlt: backgroundAlt ?? this.backgroundAlt,
    surface: surface ?? this.surface,
    surfaceAlt: surfaceAlt ?? this.surfaceAlt,
    line: line ?? this.line,
    ink: ink ?? this.ink,
    muted: muted ?? this.muted,
    accent: accent ?? this.accent,
    accentStrong: accentStrong ?? this.accentStrong,
    accentGradientEnd: accentGradientEnd ?? this.accentGradientEnd,
    border: border ?? this.border,
    onAccent: onAccent ?? this.onAccent,
    glow: glow ?? this.glow,
  );

  @override
  AppColors lerp(AppColors? other, double t) {
    if (other == null) return this;
    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColors(
      page: mix(page, other.page),
      background: mix(background, other.background),
      backgroundAlt: mix(backgroundAlt, other.backgroundAlt),
      surface: mix(surface, other.surface),
      surfaceAlt: mix(surfaceAlt, other.surfaceAlt),
      line: mix(line, other.line),
      ink: mix(ink, other.ink),
      muted: mix(muted, other.muted),
      accent: mix(accent, other.accent),
      accentStrong: mix(accentStrong, other.accentStrong),
      accentGradientEnd: mix(accentGradientEnd, other.accentGradientEnd),
      border: mix(border, other.border),
      onAccent: mix(onAccent, other.onAccent),
      glow: mix(glow, other.glow),
    );
  }
}
