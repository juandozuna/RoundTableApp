import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shared page transitions for `pageBuilder` routes.
abstract final class AppPageTransitions {
  static const Duration duration = Duration(milliseconds: 220);

  /// Cross-fade, used for shell tab switches.
  static CustomTransitionPage<T> fade<T>({
    required GoRouterState state,
    required Widget child,
  }) => CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, _, child) =>
        FadeTransition(opacity: animation, child: child),
  );

  /// Slide up, used for full-screen flows opened over the shell.
  static CustomTransitionPage<T> slideUp<T>({
    required GoRouterState state,
    required Widget child,
  }) => CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, _, child) => SlideTransition(
      position: Tween(
        begin: const Offset(0, 0.06),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOutCubic)),
      child: FadeTransition(opacity: animation, child: child),
    ),
  );
}
