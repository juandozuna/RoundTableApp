import 'dart:math' as math;

import 'package:flutter/painting.dart';

/// WCAG 2.x contrast helpers.
abstract final class Contrast {
  /// Minimum ratio for body text (AA).
  static const double text = 4.5;

  /// Minimum ratio for large text and UI component boundaries (AA).
  static const double nonText = 3;

  static double ratio(Color a, Color b) {
    final la = _luminance(a);
    final lb = _luminance(b);
    final lighter = math.max(la, lb);
    final darker = math.min(la, lb);
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Composites a translucent [foreground] over an opaque [background].
  static Color over(Color foreground, Color background) =>
      Color.alphaBlend(foreground, background);

  static double _luminance(Color color) {
    double channel(double c) => c <= 0.03928
        ? c / 12.92
        : math.pow((c + 0.055) / 1.055, 2.4).toDouble();
    return 0.2126 * channel(color.r) +
        0.7152 * channel(color.g) +
        0.0722 * channel(color.b);
  }
}
