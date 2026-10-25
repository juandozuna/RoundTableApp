import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../routing/navigation_x.dart';
import 'app_icon_button.dart';

/// Back arrow that pops, or goes to [fallbackLocation] when there is
/// nothing to pop (deep links, browser refresh).
class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, required this.fallbackLocation});

  final String fallbackLocation;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.arrow_back_rounded,
      tooltip: context.l10n.tooltipBack,
      onPressed: () => context.popOrGo(fallbackLocation),
    );
  }
}

/// Close (×) for full-screen flows, dialogs and sheets.
class AppCloseButton extends StatelessWidget {
  const AppCloseButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: Icons.close_rounded,
      tooltip: context.l10n.tooltipClose,
      onPressed: onPressed,
    );
  }
}
