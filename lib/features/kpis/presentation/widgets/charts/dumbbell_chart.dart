import 'package:flutter/material.dart';

import 'chart_painter.dart';

class DumbbellDatum {
  const DumbbellDatum({
    required this.label,
    required this.initial,
    required this.followUp,
    required this.initialTooltip,
    required this.followUpTooltip,
    required this.deltaLabel,
  });

  final String label;
  final double? initial;
  final double? followUp;
  final String initialTooltip;
  final String followUpTooltip;
  final String deltaLabel;
}

/// Initial → follow-up average per row on a 1–10 axis. The 5 is drawn
/// crossed out because it can never be chosen.
class DumbbellChartPainter extends ChartPainter {
  DumbbellChartPainter({
    required super.palette,
    required super.highlighted,
    required this.data,
    required this.leftPadding,
  });

  final List<DumbbellDatum> data;
  final double leftPadding;

  static const double _rowHeight = 36;
  static const double _right = 48;

  static double heightFor(int rows) => rows * _rowHeight + 34;

  double _x(Size size, double value) =>
      leftPadding + (size.width - leftPadding - _right) * (value - 1) / 9;

  double _y(int row) => row * _rowHeight + 20;

  @override
  List<ChartHit> hitsFor(Size size) => [
    for (var i = 0; i < data.length; i++) ...[
      if (data[i].initial != null)
        ChartHit(
          Rect.fromCenter(
            center: Offset(_x(size, data[i].initial!), _y(i)),
            width: 20,
            height: 20,
          ),
          data[i].initialTooltip,
        ),
      if (data[i].followUp != null)
        ChartHit(
          Rect.fromCenter(
            center: Offset(_x(size, data[i].followUp!), _y(i)),
            width: 20,
            height: 20,
          ),
          data[i].followUpTooltip,
        ),
    ],
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final bottom = size.height - 26;
    for (var v = 1; v <= 10; v++) {
      final x = _x(size, v.toDouble());
      final five = v == 5;
      canvas.drawLine(
        Offset(x, 4),
        Offset(x, bottom),
        Paint()
          ..color = five ? palette.offline : palette.line
          ..strokeWidth = five ? 2 : 1,
      );
      paintText(
        canvas,
        '$v',
        Offset(x, size.height - 8),
        five ? palette.strongLabelStyle : palette.labelStyle,
        align: TextAlign.center,
        maxWidth: 30,
      );
      if (five) {
        // The 5 can never be chosen: cross it out.
        final cross = Paint()
          ..color = palette.offline
          ..strokeWidth = 2;
        final c = Offset(x, size.height - 8);
        canvas.drawLine(
          c + const Offset(-6, -7),
          c + const Offset(6, 7),
          cross,
        );
        canvas.drawLine(
          c + const Offset(-6, 7),
          c + const Offset(6, -7),
          cross,
        );
      }
    }
    var hitIndex = 0;
    for (var i = 0; i < data.length; i++) {
      final row = data[i];
      final y = _y(i);
      paintText(
        canvas,
        row.label,
        Offset(leftPadding - 8, y),
        palette.strongLabelStyle,
        align: TextAlign.right,
        maxWidth: leftPadding - 8,
      );
      final initial = row.initial;
      final followUp = row.followUp;
      if (initial != null && followUp != null) {
        canvas.drawLine(
          Offset(_x(size, initial), y),
          Offset(_x(size, followUp), y),
          Paint()
            ..color = palette.accent
            ..strokeWidth = 4
            ..strokeCap = StrokeCap.round,
        );
      }
      if (initial != null) {
        final active = highlighted == hitIndex;
        hitIndex++;
        final c = Offset(_x(size, initial), y);
        canvas.drawCircle(c, 7, Paint()..color = palette.background);
        canvas.drawCircle(
          c,
          7,
          Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = active ? palette.ink : palette.accent,
        );
      }
      if (followUp != null) {
        final active = highlighted == hitIndex;
        hitIndex++;
        final c = Offset(_x(size, followUp), y);
        canvas.drawCircle(c, 7, Paint()..color = palette.accent);
        if (active) {
          canvas.drawCircle(
            c,
            7,
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2.5
              ..color = palette.ink,
          );
        }
      }
      paintText(
        canvas,
        row.deltaLabel,
        Offset(size.width - _right + 6, y),
        palette.strongLabelStyle,
        maxWidth: _right,
      );
    }
  }
}
