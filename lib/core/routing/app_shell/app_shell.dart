import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/build_context_x.dart';
import '../../widgets/app_navigation.dart';
import '../feature_router.dart';
import 'cubit/app_shell_cubit.dart';
import 'cubit/app_shell_state.dart';

/// Wraps shell routes with the role-filtered navigation. Pages inside keep
/// using `AppScaffold`, which renders the navigation it finds here.
class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.destinations,
    required this.location,
    required this.child,
  });

  final List<ShellDestination> destinations;
  final String location;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppShellCubit, AppShellState>(
      builder: (context, state) {
        final visible = destinations
            .where((destination) => destination.isVisibleFor(state.role))
            .toList();
        return AppNavigationScope(
          navigation: AppNavigation(
            items: [
              for (final destination in visible)
                AppNavItem(
                  icon: destination.icon,
                  selectedIcon: destination.selectedIcon,
                  label: destination.label(context.l10n),
                ),
            ],
            selectedIndex: _selectedIndex(visible),
            onSelected: (index) => context.go(visible[index].location),
          ),
          child: child,
        );
      },
    );
  }

  int? _selectedIndex(List<ShellDestination> visible) {
    var best = -1;
    var bestLength = -1;
    for (var i = 0; i < visible.length; i++) {
      final target = visible[i].location;
      final matches = target == '/'
          ? location == '/'
          : location == target || location.startsWith('$target/');
      if (matches && target.length > bestLength) {
        best = i;
        bestLength = target.length;
      }
    }
    return best < 0 ? null : best;
  }
}
