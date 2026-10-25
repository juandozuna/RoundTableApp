import 'dart:math' as math;
import 'dart:ui' show PathMetric;

import 'package:flutter/material.dart';

import '../theme/status_tone.dart';

/// Paints a rounded-rectangle or circular border in a [StatusLineStyle], so
/// status is readable without colour (dashed = offline, dotted = pending,
/// double = error).
class StatusBorderPainter extends CustomPainter {
  const StatusBorderPainter({
    required this.color,
    required this.style,
    this.width = 1.5,
    this.radius,
    this.circle = false,
  });

  final Color color;
  final StatusLineStyle style;
  final double width;

  /// Corner radius; defaults to fully rounded (pill).
  final double? radius;
  final bool circle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    final inset = width / 2;
    final rect = Rect.fromLTWH(
      inset,
      inset,
      size.width - width,
      size.height - width,
    );
    final path = _shape(rect);

    switch (style) {
      case StatusLineStyle.solid:
        canvas.drawPath(path, paint);
      case StatusLineStyle.dashed:
        _drawPattern(canvas, path, paint, dash: width * 3.5, gap: width * 2.5);
      case StatusLineStyle.dotted:
        _drawPattern(
          canvas,
          path,
          paint..strokeCap = StrokeCap.round,
          dash: 0.01,
          gap: width * 2.2,
        );
      case StatusLineStyle.double:
        // Two thin lines inside the stroke band, like CSS `border-style: double`.
        final line = math.max(1.0, width / 3);
        paint.strokeWidth = line;
        final outer = Rect.fromLTWH(
          line / 2,
          line / 2,
          size.width - line,
          size.height - line,
        );
        canvas.drawPath(_shape(outer), paint);
        canvas.drawPath(_shape(outer.deflate(width - line)), paint);
    }
  }

  Path _shape(Rect rect) {
    if (circle) return Path()..addOval(rect);
    final r = radius ?? rect.shortestSide / 2;
    return Path()..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(r)));
  }

  static void _drawPattern(
    Canvas canvas,
    Path path,
    Paint paint, {
    required double dash,
    required double gap,
  }) {
    for (final PathMetric metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final end = math.min(distance + dash, metric.length);
        canvas.drawPath(metric.extractPath(distance, end), paint);
        distance += dash + gap;
      }
    }
  }

  @override
  bool shouldRepaint(StatusBorderPainter old) =>
      old.color != color ||
      old.style != style ||
      old.width != width ||
      old.radius != radius ||
      old.circle != circle;
}
