import 'package:flutter/painting.dart';

/// Raw colour tokens of the "Mesa en vivo" design language (ADR 0013),
/// copied from the CSS custom properties of
/// docs/design/prototypes/session-flow-b-mesa-en-vivo.html.
/// Widgets use [AppColors] / [StatusColors] from the theme, never these.
class AppPalette {
  const AppPalette({
    required this.page,
    required this.bg,
    required this.bg2,
    required this.surf,
    required this.surf2,
    required this.line,
    required this.ink,
    required this.mut,
    required this.acc,
    required this.accb,
    required this.accg,
    required this.bd,
    required this.onacc,
    required this.lime,
    required this.amber,
    required this.off,
    required this.mag,
    required this.err,
    required this.sky,
    required this.cyan,
    required this.lilac,
    required this.onc,
    required this.glow,
  });

  final Color page;
  final Color bg;
  final Color bg2;
  final Color surf;
  final Color surf2;
  final Color line;
  final Color ink;
  final Color mut;
  final Color acc;
  final Color accb;
  final Color accg;
  final Color bd;
  final Color onacc;
  final Color lime;
  final Color amber;
  final Color off;
  final Color mag;
  final Color err;
  final Color sky;
  final Color cyan;
  final Color lilac;
  final Color onc;
  final Color glow;

  static const AppPalette dark = AppPalette(
    page: Color(0xFF08060F),
    bg: Color(0xFF0E0B1A),
    bg2: Color(0xFF14102A),
    surf: Color(0xFF1A1530),
    surf2: Color(0xFF251E45),
    line: Color(0xFF3A3166),
    ink: Color(0xFFF4F1FF),
    mut: Color(0xFFA9A1CC),
    acc: Color(0xFFA48BFF),
    accb: Color(0xFF6F4DFF),
    accg: Color(0xFF8654F7),
    bd: Color(0xFF7A70B5),
    onacc: Color(0xFFFFFFFF),
    lime: Color(0xFF3DE08A),
    amber: Color(0xFFFFB547),
    off: Color(0xFF8F98BC),
    mag: Color(0xFFFF4F9A),
    err: Color(0xFFFF7A7A),
    sky: Color(0xFF5CC8FF),
    cyan: Color(0xFF2DD4D4),
    lilac: Color(0xFFC7B6FF),
    onc: Color(0xFF0B0A14),
    glow: Color(0x478B6CFF), // rgba(139,108,255,.28)
  );

  static const AppPalette light = AppPalette(
    page: Color(0xFFE4DEFA),
    bg: Color(0xFFF3F0FF),
    bg2: Color(0xFFE9E4FF),
    surf: Color(0xFFFFFFFF),
    surf2: Color(0xFFECE7FF),
    line: Color(0xFFC9BFF0),
    ink: Color(0xFF1B1438),
    mut: Color(0xFF554C7E),
    acc: Color(0xFF5B3FE0),
    accb: Color(0xFF5B3FE0),
    accg: Color(0xFF7A4DF0),
    bd: Color(0xFF7C72B8),
    onacc: Color(0xFFFFFFFF),
    lime: Color(0xFF096B3A),
    amber: Color(0xFF8A5200),
    off: Color(0xFF515A80),
    mag: Color(0xFFB0165F),
    err: Color(0xFFB3261E),
    sky: Color(0xFF095F8F),
    cyan: Color(0xFF086363),
    lilac: Color(0xFF5B3FE0),
    onc: Color(0xFFFFFFFF),
    glow: Color(0x2E5B3FE0), // rgba(91,63,224,.18)
  );

  /// Fill of offline / verbal-mode actions (same in both themes; white text).
  static const List<Color> offlineGradient = [
    Color(0xFF4A527A),
    Color(0xFF5D6794),
  ];

  /// Initials-avatar backgrounds; all carry white text at >= 4.5:1.
  static const List<Color> avatarColors = [
    Color(0xFF5B3FE0),
    Color(0xFFB0165F),
    Color(0xFF086363),
    Color(0xFF8A5200),
    Color(0xFF1D6F42),
    Color(0xFF9B3FB0),
    Color(0xFF2F5FB0),
    Color(0xFFA8431C),
  ];
}
