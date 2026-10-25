import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

extension NavigationX on BuildContext {
  /// Pops when there is a previous page; otherwise goes to [fallback], so
  /// every destination has a way out (AGENTS.md §15).
  void popOrGo(String fallback) {
    if (canPop()) {
      pop();
    } else {
      go(fallback);
    }
  }
}
