/// Spacing scale (logical pixels).
abstract final class AppSpacing {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;

  /// Horizontal page padding per layout.
  static const double pagePhone = 14;
  static const double pageTablet = 24;
  static const double pageDesktop = 32;

  /// Readable max width for forms and single-column content.
  static const double contentMaxWidth = 720;
}

/// Corner radii.
abstract final class AppRadii {
  static const double sm = 12;
  static const double md = 14;
  static const double lg = 16;
  static const double xl = 20;
  static const double sheet = 26;
  static const double pill = 999;
}

/// Interaction sizes for non-technical users (RNF-11..15).
abstract final class AppSizes {
  /// Minimum touch target.
  static const double minTarget = 44;

  /// Default control height (inputs, secondary buttons).
  static const double control = 48;

  /// Primary action height.
  static const double primaryAction = 56;

  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;
}
