import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import 'chart_painter.dart';
import 'chart_palette.dart';

typedef ChartPainterBuilder =
    ChartPainter Function(ChartPalette palette, int? highlighted);

/// Hosts a [ChartPainter]: sizes it, finds the mark under the pointer (hover
/// on desktop, tap on touch) and shows its tooltip.
class InteractiveChart extends StatefulWidget {
  const InteractiveChart({
    super.key,
    required this.height,
    required this.builder,
    required this.semanticLabel,
  });

  final double height;
  final ChartPainterBuilder builder;
  final String semanticLabel;

  @override
  State<InteractiveChart> createState() => _InteractiveChartState();
}

class _InteractiveChartState extends State<InteractiveChart> {
  int? _index;
  Offset? _position;

  void _update(Offset? position, Size size, ChartPalette palette) {
    if (position == null) {
      setState(() {
        _index = null;
        _position = null;
      });
      return;
    }
    final hits = widget.builder(palette, null).hitsFor(size);
    int? found;
    for (var i = 0; i < hits.length; i++) {
      if (hits[i].rect.inflate(2).contains(position)) {
        found = i;
        break;
      }
    }
    setState(() {
      _index = found;
      _position = found == null ? null : position;
    });
  }

  @override
  Widget build(BuildContext context) {
    final palette = ChartPalette.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, widget.height);
        final painter = widget.builder(palette, _index);
        final hits = painter.hitsFor(size);
        final tip = _index != null && _index! < hits.length
            ? hits[_index!].tooltip
            : null;
        return Semantics(
          label: widget.semanticLabel,
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: MouseRegion(
              onHover: (event) => _update(event.localPosition, size, palette),
              onExit: (_) => _update(null, size, palette),
              child: Listener(
                onPointerDown: (event) {
                  if (event.kind != PointerDeviceKind.mouse) {
                    _update(event.localPosition, size, palette);
                  }
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CustomPaint(size: size, painter: painter),
                    if (tip != null && _position != null)
                      Positioned(
                        left: (_position!.dx + 12).clamp(0, size.width - 140),
                        top: (_position!.dy - 36).clamp(0, size.height - 24),
                        child: IgnorePointer(
                          child: Material(
                            color: context.colors.ink,
                            borderRadius: BorderRadius.circular(AppRadii.sm),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.md,
                                vertical: AppSpacing.xs + 2,
                              ),
                              child: Text(
                                tip,
                                style: context.textTheme.labelMedium!.copyWith(
                                  color: context.colors.background,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
