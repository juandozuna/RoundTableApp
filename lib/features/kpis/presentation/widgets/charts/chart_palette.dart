import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';

/// Theme colours the chart painters need, resolved once per build.
@immutable
class ChartPalette {
  const ChartPalette({
    required this.ink,
    required this.muted,
    required this.line,
    required this.background,
    required this.accent,
    required this.highlight,
    required this.ok,
    required this.pending,
    required this.offline,
    required this.labelStyle,
    required this.strongLabelStyle,
  });

  factory ChartPalette.of(BuildContext context) {
    final colors = context.colors;
    final status = context.statusColors;
    final base = context.textStyles.chartLabel;
    return ChartPalette(
      ink: colors.ink,
      muted: colors.muted,
      line: colors.line,
      background: colors.background,
      accent: colors.accent,
      highlight: status.lilac,
      ok: status.ok,
      pending: status.pending,
      offline: status.offline,
      labelStyle: base.copyWith(color: colors.muted),
      strongLabelStyle: base.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  final Color ink;
  final Color muted;
  final Color line;
  final Color background;
  final Color accent;
  final Color highlight;
  final Color ok;
  final Color pending;
  final Color offline;
  final TextStyle labelStyle;
  final TextStyle strongLabelStyle;
}
