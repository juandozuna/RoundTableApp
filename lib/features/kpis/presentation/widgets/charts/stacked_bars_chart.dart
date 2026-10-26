import 'package:flutter/material.dart';

import 'chart_painter.dart';

class StackedDatum {
  const StackedDatum({
    required this.label,
    required this.active,
    required this.delayed,
    required this.inactive,
    required this.activeTooltip,
    required this.delayedTooltip,
    required this.inactiveTooltip,
  });

  final String label;
  final int active;
  final int delayed;
  final int inactive;
  final String activeTooltip;
  final String delayedTooltip;
  final String inactiveTooltip;
}

/// Horizontal stacked bars: active (solid), delayed (diagonal stripes) and
/// inactive (dots), so state is readable without colour.
class StackedBarsPainter extends ChartPainter {
  StackedBarsPainter({
    required super.palette,
    required super.highlighted,
    required this.data,
    required this.leftPadding,
  });

  final List<StackedDatum> data;
  final double leftPadding;

  static const double _rowHeight = 34;
  static const double _right = 10;

  static double heightFor(int rows) => rows * _rowHeight + 10;

  double _scale(Size size) {
    final max = data.fold<int>(1, (m, d) {
      final total = d.active + d.delayed + d.inactive;
      return total > m ? total : m;
    });
    return (size.width - leftPadding - _right) / max;
  }

  List<({Rect rect, int kind, String tip, int count, int row})> _segments(
    Size size,
  ) {
    final scale = _scale(size);
    final out = <({Rect rect, int kind, String tip, int count, int row})>[];
    for (var i = 0; i < data.length; i++) {
      var x = leftPadding;
      final y = i * _rowHeight + 6;
      final d = data[i];
      for (final (kind, count, tip) in [
        (0, d.active, d.activeTooltip),
        (1, d.delayed, d.delayedTooltip),
        (2, d.inactive, d.inactiveTooltip),
      ]) {
        if (count == 0) continue;
        out.add((
          rect: Rect.fromLTWH(x, y, count * scale - 1, 24),
          kind: kind,
          tip: tip,
          count: count,
          row: i,
        ));
        x += count * scale;
      }
    }
    return out;
  }

  @override
  List<ChartHit> hitsFor(Size size) => [
    for (final s in _segments(size)) ChartHit(s.rect, s.tip),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < data.length; i++) {
      paintText(
        canvas,
        data[i].label,
        Offset(leftPadding - 8, i * _rowHeight + 18),
        palette.strongLabelStyle,
        align: TextAlign.right,
        maxWidth: leftPadding - 8,
      );
    }
    var index = 0;
    for (final segment in _segments(size)) {
      final rrect = RRect.fromRectAndRadius(
        segment.rect,
        const Radius.circular(4),
      );
      final color = switch (segment.kind) {
        0 => palette.ok,
        1 => palette.pending,
        _ => palette.offline,
      };
      canvas.save();
      canvas.clipRRect(rrect);
      canvas.drawRect(segment.rect, Paint()..color = palette.background);
      switch (segment.kind) {
        case 0:
          canvas.drawRect(segment.rect, Paint()..color = color);
        case 1:
          final stripe = Paint()
            ..color = color
            ..strokeWidth = 3;
          for (
            var x = segment.rect.left - segment.rect.height;
            x < segment.rect.right;
            x += 8
          ) {
            canvas.drawLine(
              Offset(x, segment.rect.bottom),
              Offset(x + segment.rect.height, segment.rect.top),
              stripe,
            );
          }
        default:
          final dot = Paint()..color = color;
          for (var x = segment.rect.left + 3; x < segment.rect.right; x += 6) {
            for (
              var y = segment.rect.top + 3;
              y < segment.rect.bottom;
              y += 6
            ) {
              canvas.drawCircle(Offset(x, y), 1.5, dot);
            }
          }
      }
      canvas.restore();
      canvas.drawRRect(
        rrect,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = highlighted == index ? 2.5 : 1.5
          ..color = highlighted == index ? palette.ink : color,
      );
      paintText(
        canvas,
        '${segment.count}',
        segment.rect.center,
        palette.strongLabelStyle,
        align: TextAlign.center,
        maxWidth: segment.rect.width,
      );
      index++;
    }
  }
}
