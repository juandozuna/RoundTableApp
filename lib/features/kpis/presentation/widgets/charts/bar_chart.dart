import 'package:flutter/material.dart';

import 'chart_painter.dart';

class BarDatum {
  const BarDatum({
    required this.label,
    required this.value,
    required this.tooltip,
  });

  final String label;
  final double value;
  final String tooltip;
}

/// Vertical bars with a y axis (values completed per week).
class BarChartPainter extends ChartPainter {
  BarChartPainter({
    required super.palette,
    required super.highlighted,
    required this.data,
    this.yFormat,
  });

  final List<BarDatum> data;
  final String Function(double)? yFormat;

  static const double _left = 34;
  static const double _right = 4;
  static const double _top = 8;
  static const double _bottom = 24;

  double get _max => ChartPainter.niceMax(
    data.fold<double>(1, (m, d) => d.value > m ? d.value : m),
  );

  @override
  List<ChartHit> hitsFor(Size size) {
    if (data.isEmpty) return const [];
    final slot = (size.width - _left - _right) / data.length;
    final plotHeight = size.height - _top - _bottom;
    return [
      for (var i = 0; i < data.length; i++)
        ChartHit(
          Rect.fromLTWH(_left + slot * i, _top, slot, plotHeight),
          data[i].tooltip,
        ),
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    final plotHeight = size.height - _top - _bottom;
    final grid = Paint()
      ..color = palette.line
      ..strokeWidth = 1;
    for (var i = 0; i <= 4; i++) {
      final y = _top + plotHeight * (1 - i / 4);
      canvas.drawLine(Offset(_left, y), Offset(size.width - _right, y), grid);
      final value = _max * i / 4;
      paintText(
        canvas,
        yFormat?.call(value) ?? value.round().toString(),
        Offset(_left - 6, y),
        palette.labelStyle,
        align: TextAlign.right,
        maxWidth: _left,
      );
    }
    if (data.isEmpty) return;
    final slot = (size.width - _left - _right) / data.length;
    final step = (data.length / 8).ceil().clamp(1, data.length);
    for (var i = 0; i < data.length; i++) {
      final height = plotHeight * data[i].value / _max;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          _left + slot * i + slot * 0.14,
          _top + plotHeight - height.clamp(1, plotHeight),
          slot * 0.72,
          height.clamp(1, plotHeight),
        ),
        const Radius.circular(3),
      );
      final active = highlighted == i;
      canvas.drawRRect(
        rect,
        Paint()..color = active ? palette.highlight : palette.accent,
      );
      if (active) {
        canvas.drawRRect(
          rect,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = palette.ink,
        );
      }
      if (i % step == 0) {
        paintText(
          canvas,
          data[i].label,
          Offset(_left + slot * i + slot / 2, size.height - 8),
          palette.labelStyle,
          align: TextAlign.center,
          maxWidth: slot * step,
        );
      }
    }
  }
}
