import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../extensions/string_x.dart';
import '../theme/app_palette.dart';
import '../theme/status_tone.dart';
import 'status_border.dart';

/// Initials avatar with a stable colour per name and an optional status
/// ring (seat status on the live table).
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    required this.name,
    this.size = 40,
    this.ringTone,
    this.semanticLabel,
  });

  final String name;
  final double size;

  /// Draws a ring in the tone's colour and line style.
  final StatusTone? ringTone;

  /// Overrides the spoken label (defaults to [name]).
  final String? semanticLabel;

  static Color colorFor(String name) =>
      AppPalette.avatarColors[name.stableHash % AppPalette.avatarColors.length];

  @override
  Widget build(BuildContext context) {
    final tone = ringTone;
    final ringWidth = size * 0.065;
    final inner = tone == null ? size : size - ringWidth * 3;
    final face = Container(
      width: inner,
      height: inner,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: colorFor(name), shape: BoxShape.circle),
      child: Text(
        name.initials,
        style: context.textTheme.labelLarge!.copyWith(
          color: Colors.white,
          // Initials scale with the avatar diameter; no fixed token fits.
          fontSize: inner * 0.36,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
      ),
    );

    return Semantics(
      label: semanticLabel ?? name,
      image: true,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: size,
        child: tone == null
            ? face
            : CustomPaint(
                painter: StatusBorderPainter(
                  color: context.statusColors.of(tone),
                  style: tone.lineStyle,
                  width: ringWidth,
                  circle: true,
                ),
                child: Center(child: face),
              ),
      ),
    );
  }
}
