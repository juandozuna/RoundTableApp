import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions/build_context_x.dart';
import 'app_scaffold.dart';
import 'empty_state.dart';

/// Fallback destination for unknown locations, with a way home.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key, required this.homeLocation});

  final String homeLocation;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppScaffold(
      backFallbackLocation: homeLocation,
      body: EmptyState(
        icon: Icons.explore_off_rounded,
        title: l10n.notFoundTitle,
        message: l10n.notFoundMessage,
        actionLabel: l10n.actionGoHome,
        onAction: () => context.go(homeLocation),
      ),
    );
  }
}
