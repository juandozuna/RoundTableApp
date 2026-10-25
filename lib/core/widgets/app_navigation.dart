import 'package:flutter/widgets.dart';

/// One navigation entry, already localized.
class AppNavItem {
  const AppNavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
}

/// Navigation rendered by [AppScaffold]: bottom bar on phones, rail on
/// tablets, extended sidebar on desktop.
class AppNavigation {
  const AppNavigation({
    required this.items,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<AppNavItem> items;
  final int? selectedIndex;
  final ValueChanged<int> onSelected;

  /// Navigation only appears with two or more destinations.
  bool get isVisible => items.length >= 2;
}

/// Provides the shell's [AppNavigation] to every `AppScaffold` below it.
class AppNavigationScope extends InheritedWidget {
  const AppNavigationScope({
    super.key,
    required this.navigation,
    required super.child,
  });

  final AppNavigation navigation;

  static AppNavigation? maybeOf(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<AppNavigationScope>()
      ?.navigation;

  @override
  bool updateShouldNotify(AppNavigationScope old) =>
      old.navigation.selectedIndex != navigation.selectedIndex ||
      old.navigation.items.length != navigation.items.length ||
      !_sameLabels(old.navigation.items, navigation.items);

  static bool _sameLabels(List<AppNavItem> a, List<AppNavItem> b) {
    for (var i = 0; i < a.length; i++) {
      if (a[i].label != b[i].label) return false;
    }
    return true;
  }
}
