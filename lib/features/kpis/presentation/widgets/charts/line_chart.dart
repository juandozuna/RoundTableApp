import 'package:flutter/material.dart';

import 'chart_painter.dart';

class LineDatum {
  const LineDatum({
    required this.label,
    required this.value,
    required this.tooltip,
  });

  final String label;

  /// Null when the week has no data: the line breaks there.
  final double? value;
  final String tooltip;
}

/// Percent line (0–100) with a dashed threshold. Points under the threshold
/// are hollow so the alert is not colour-only.
class LineChartPainter extends ChartPainter {
  LineChartPainter({
    required super.palette,
    required super.highlighted,
    required this.data,
    required this.threshold,
    required this.thresholdLabel,
  });

  final List<LineDatum> data;
  final double threshold;
  final String thresholdLabel;

  static const double _left = 38;
  static const double _right = 8;
  static const double _top = 10;
  static const double _bottom = 24;

  Offset _point(Size size, int index, double value) {
    final plotWidth = size.width - _left - _right;
    final x = data.length <= 1
        ? _left + plotWidth / 2
        : _left + plotWidth * index / (data.length - 1);
    final plotHeight = size.height - _top - _bottom;
    return Offset(x, _top + plotHeight * (1 - value / 100));
  }

  @override
  List<ChartHit> hitsFor(Size size) => [
    for (var i = 0; i < data.length; i++)
      if (data[i].value != null)
        ChartHit(
          Rect.fromCenter(
            center: _point(size, i, data[i].value!),
            width: 18,
            height: 18,
          ),
          data[i].tooltip,
        ),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final plotHeight = size.height - _top - _bottom;
    final grid = Paint()
      ..color = palette.line
      ..strokeWidth = 1;
    for (var i = 0; i <= 4; i++) {
      final y = _top + plotHeight * (1 - i / 4);
      canvas.drawLine(Offset(_left, y), Offset(size.width - _right, y), grid);
      paintText(
        canvas,
        '${25 * i}%',
        Offset(_left - 6, y),
        palette.labelStyle,
        align: TextAlign.right,
        maxWidth: _left,
      );
    }
    final thresholdY = _top + plotHeight * (1 - threshold / 100);
    final dashed = Paint()
      ..color = palette.pending
      ..strokeWidth = 2;
    for (var x = _left; x < size.width - _right; x += 10) {
      canvas.drawLine(
        Offset(x, thresholdY),
        Offset((x + 6).clamp(0, size.width - _right), thresholdY),
        dashed,
      );
    }
    paintText(
      canvas,
      thresholdLabel,
      Offset(size.width - _right, thresholdY + 10),
      palette.labelStyle.copyWith(color: palette.pending),
      align: TextAlign.right,
      maxWidth: 160,
    );
    final stroke = Paint()
      ..color = palette.accent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
    Path? path;
    for (var i = 0; i < data.length; i++) {
      final value = data[i].value;
      if (value == null) {
        if (path != null) canvas.drawPath(path, stroke);
        path = null;
        continue;
      }
      final p = _point(size, i, value);
      if (path == null) {
        path = Path()..moveTo(p.dx, p.dy);
      } else {
        path.lineTo(p.dx, p.dy);
      }
    }
    if (path != null) canvas.drawPath(path, stroke);
    final step = (data.length / 8).ceil().clamp(1, data.length);
    var hitIndex = 0;
    for (var i = 0; i < data.length; i++) {
      final value = data[i].value;
      if (i % step == 0) {
        paintText(
          canvas,
          data[i].label,
          Offset(_point(size, i, 0).dx, size.height - 8),
          palette.labelStyle,
          align: TextAlign.center,
          maxWidth: 60,
        );
      }
      if (value == null) continue;
      final p = _point(size, i, value);
      final low = value < threshold;
      final active = highlighted == hitIndex;
      hitIndex++;
      canvas.drawCircle(
        p,
        active ? 7 : (data.length > 14 ? 3.5 : 5),
        Paint()..color = low ? palette.background : palette.accent,
      );
      canvas.drawCircle(
        p,
        active ? 7 : (data.length > 14 ? 3.5 : 5),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5
          ..color = active ? palette.ink : palette.accent,
      );
    }
  }
}
