import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'chart_palette.dart';

/// A pressable/hoverable area of a chart with the text its tooltip shows.
class ChartHit {
  const ChartHit(this.rect, this.tooltip);

  final Rect rect;
  final String tooltip;
}

/// Base of the hand-rolled chart painters: draws itself and reports where its
/// marks are so [InteractiveChart] can show tooltips.
abstract class ChartPainter extends CustomPainter {
  ChartPainter({required this.palette, this.highlighted});

  final ChartPalette palette;

  /// Index into [hitsFor] of the mark under the pointer.
  final int? highlighted;

  List<ChartHit> hitsFor(Size size);

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) =>
      oldDelegate.highlighted != highlighted || oldDelegate.palette != palette;

  /// Draws [text]; [align] positions it relative to [at].
  void paintText(
    Canvas canvas,
    String text,
    Offset at,
    TextStyle style, {
    TextAlign align = TextAlign.left,
    double maxWidth = 120,
  }) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textAlign: align,
      textDirection: TextDirection.ltr,
      maxLines: 1,
      ellipsis: '…',
    )..layout(maxWidth: maxWidth);
    final dx = switch (align) {
      TextAlign.right || TextAlign.end => at.dx - painter.width,
      TextAlign.center => at.dx - painter.width / 2,
      _ => at.dx,
    };
    painter.paint(canvas, Offset(dx, at.dy - painter.height / 2));
  }

  /// Rounds [value] up to a tidy axis maximum (1, 2, 2.5, 5, 10 × 10ⁿ).
  static double niceMax(double value) {
    if (value <= 0) return 1;
    final magnitude = math.pow(10, (math.log(value) / math.ln10).floor());
    for (final step in const [1, 2, 2.5, 5, 10]) {
      if (value <= step * magnitude) return step * magnitude.toDouble();
    }
    return 10 * magnitude.toDouble();
  }
}
