import 'package:flutter/material.dart';

import 'chart_painter.dart';

class HorizontalBarDatum {
  const HorizontalBarDatum({
    required this.label,
    required this.value,
    required this.tooltip,
  });

  final String label;
  final double value;
  final String tooltip;
}

/// Ranked horizontal bars with the value at the end (late sync per table).
class HorizontalBarsPainter extends ChartPainter {
  HorizontalBarsPainter({
    required super.palette,
    required super.highlighted,
    required this.data,
    required this.leftPadding,
  });

  final List<HorizontalBarDatum> data;
  final double leftPadding;

  static const double _rowHeight = 30;
  static const double _right = 34;

  static double heightFor(int rows) => rows * _rowHeight + 6;

  double get _max => data.fold<double>(1, (m, d) => d.value > m ? d.value : m);

  Rect _bar(Size size, int i) {
    final width = (size.width - leftPadding - _right) * data[i].value / _max;
    return Rect.fromLTWH(
      leftPadding,
      i * _rowHeight + 4,
      width.clamp(2, size.width),
      22,
    );
  }

  @override
  List<ChartHit> hitsFor(Size size) => [
    for (var i = 0; i < data.length; i++)
      ChartHit(_bar(size, i), data[i].tooltip),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < data.length; i++) {
      final bar = _bar(size, i);
      paintText(
        canvas,
        data[i].label,
        Offset(leftPadding - 8, bar.center.dy),
        palette.strongLabelStyle,
        align: TextAlign.right,
        maxWidth: leftPadding - 8,
      );
      final rrect = RRect.fromRectAndRadius(bar, const Radius.circular(4));
      canvas.drawRRect(
        rrect,
        Paint()..color = highlighted == i ? palette.highlight : palette.accent,
      );
      if (highlighted == i) {
        canvas.drawRRect(
          rrect,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = palette.ink,
        );
      }
      paintText(
        canvas,
        data[i].value.round().toString(),
        Offset(bar.right + 6, bar.center.dy),
        palette.strongLabelStyle,
        maxWidth: _right,
      );
    }
  }
}
