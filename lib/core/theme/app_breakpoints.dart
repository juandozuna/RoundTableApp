import 'package:flutter/widgets.dart';

/// Layout classes: phone < 600, tablet 600–1024, desktop > 1024.
enum AppLayout {
  phone,
  tablet,
  desktop;

  static AppLayout forWidth(double width) {
    if (width < AppBreakpoints.tablet) return AppLayout.phone;
    if (width <= AppBreakpoints.desktop) return AppLayout.tablet;
    return AppLayout.desktop;
  }

  static AppLayout of(BuildContext context) =>
      forWidth(MediaQuery.sizeOf(context).width);

  bool get isPhone => this == AppLayout.phone;

  bool get isTabletOrWider => this != AppLayout.phone;

  bool get isDesktop => this == AppLayout.desktop;
}

/// Single source of the breakpoint values, shared with responsive_framework.
abstract final class AppBreakpoints {
  static const double tablet = 600;
  static const double desktop = 1024;

  static const String phoneName = 'PHONE';
  static const String tabletName = 'TABLET';
  static const String desktopName = 'DESKTOP';

  /// Design frame for flutter_screenutil (iPhone 14/15 portrait).
  static const Size designSize = Size(390, 844);
}
