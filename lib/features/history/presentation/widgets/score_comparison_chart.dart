import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

/// One value of the chart: its program number and the two scores (1–10).
class ScoreBar {
  const ScoreBar({
    required this.label,
    required this.semanticLabel,
    this.initial,
    this.followUp,
  });

  final String label;
  final String semanticLabel;
  final double? initial;
  final double? followUp;
}

/// Grouped bars comparing the initial and the follow-up score of each value.
/// Hand-drawn (no chart package); values are printed above each bar so the
/// colours are never the only cue, and the legend sits below.
class ScoreComparisonChart extends StatelessWidget {
  const ScoreComparisonChart({
    super.key,
    required this.bars,
    this.height = 200,
  });

  final List<ScoreBar> bars;
  final double height;

  static const double _groupMinWidth = 48;
  static const double _groupMaxWidth = 96;
  static const double _axisWidth = 28;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;
    final status = context.statusColors;
    final labelStyle = context.textTheme.bodySmall!.copyWith(
      color: colors.muted,
    );
    final valueStyle = context.textTheme.bodySmall!.copyWith(
      color: colors.ink,
      fontWeight: FontWeight.w800,
    );
    final initialColor = colors.accent;
    final followUpColor = status.ok;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          label: [
            l10n.historyChartSemantics,
            ...bars.map((bar) => bar.semanticLabel),
          ].join('. '),
          excludeSemantics: true,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final plotWidth = math.max(
                constraints.maxWidth - _axisWidth,
                bars.length * _groupMinWidth,
              );
              final painter = _ScoreChartPainter(
                bars: bars,
                gridColor: colors.line,
                initialColor: initialColor,
                followUpColor: followUpColor,
                labelStyle: labelStyle,
                valueStyle: valueStyle,
                textDirection: Directionality.of(context),
              );
              final chart = CustomPaint(
                size: Size(plotWidth + _axisWidth, height),
                painter: painter,
              );
              return SizedBox(
                height: height,
                child: plotWidth + _axisWidth > constraints.maxWidth
                    ? SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: chart,
                      )
                    : chart,
              );
            },
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.xs,
          children: [
            _LegendEntry(color: initialColor, label: l10n.historyLegendInitial),
            _LegendEntry(
              color: followUpColor,
              label: l10n.historyLegendFollowUp,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(l10n.historyChartAxisHint, style: labelStyle),
      ],
    );
  }
}

class _LegendEntry extends StatelessWidget {
  const _LegendEntry({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: AppSpacing.xs + 2),
        Text(label, style: context.textTheme.bodyMedium),
      ],
    );
  }
}

class _ScoreChartPainter extends CustomPainter {
  _ScoreChartPainter({
    required this.bars,
    required this.gridColor,
    required this.initialColor,
    required this.followUpColor,
    required this.labelStyle,
    required this.valueStyle,
    required this.textDirection,
  });

  final List<ScoreBar> bars;
  final Color gridColor;
  final Color initialColor;
  final Color followUpColor;
  final TextStyle labelStyle;
  final TextStyle valueStyle;
  final TextDirection textDirection;

  static const double _maxScore = 10;
  static const double _top = 16;
  static const double _bottom = 22;

  @override
  void paint(Canvas canvas, Size size) {
    const axis = ScoreComparisonChart._axisWidth;
    final plotHeight = size.height - _top - _bottom;
    double yOf(double score) => _top + plotHeight * (1 - score / _maxScore);

    final grid = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    for (final tick in const [2.0, 4.0, 6.0, 8.0, 10.0]) {
      canvas.drawLine(
        Offset(axis, yOf(tick)),
        Offset(size.width, yOf(tick)),
        grid,
      );
      _text(
        canvas,
        tick.toInt().toString(),
        labelStyle,
        Offset(axis - 6, yOf(tick)),
        align: _Anchor.right,
      );
    }

    // Few values would spread across a wide card; keep groups readable.
    final groupWidth = math.min(
      (size.width - axis) / math.max(bars.length, 1),
      ScoreComparisonChart._groupMaxWidth,
    );
    final barWidth = math.min(18.0, groupWidth * 0.3);
    for (var i = 0; i < bars.length; i++) {
      final center = axis + groupWidth * (i + 0.5);
      _bar(
        canvas,
        bars[i].initial,
        center - barWidth - 1,
        barWidth,
        yOf,
        initialColor,
      );
      _bar(canvas, bars[i].followUp, center + 1, barWidth, yOf, followUpColor);
      _text(
        canvas,
        bars[i].label,
        labelStyle,
        Offset(center, size.height - _bottom / 2),
        align: _Anchor.center,
      );
    }
  }

  void _bar(
    Canvas canvas,
    double? score,
    double left,
    double width,
    double Function(double) yOf,
    Color color,
  ) {
    if (score == null) return;
    final top = yOf(score);
    final bottom = yOf(0);
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(left, top, left + width, bottom),
        topLeft: const Radius.circular(4),
        topRight: const Radius.circular(4),
      ),
      Paint()..color = color,
    );
    _text(
      canvas,
      score == score.roundToDouble()
          ? score.toInt().toString()
          : score.toStringAsFixed(1).replaceAll('.', ','),
      valueStyle,
      Offset(left + width / 2, top - 8),
      align: _Anchor.center,
    );
  }

  void _text(
    Canvas canvas,
    String text,
    TextStyle style,
    Offset anchor, {
    required _Anchor align,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: textDirection,
    )..layout();
    final dx = switch (align) {
      _Anchor.center => anchor.dx - painter.width / 2,
      _Anchor.right => anchor.dx - painter.width,
    };
    painter.paint(canvas, Offset(dx, anchor.dy - painter.height / 2));
  }

  @override
  bool shouldRepaint(_ScoreChartPainter old) =>
      old.bars != bars ||
      old.gridColor != gridColor ||
      old.initialColor != initialColor ||
      old.followUpColor != followUpColor;
}

enum _Anchor { center, right }
