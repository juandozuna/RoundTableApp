import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_breakpoints.dart';
import '../theme/app_spacing.dart';
import 'app_back_button.dart';
import 'app_navigation.dart';

/// Page chrome for every screen.
///
/// - Renders the shell navigation found in [AppNavigationScope] responsively:
///   bottom bar (phone), rail (tablet), extended sidebar (desktop).
/// - Shows a back button when the page can pop or [backFallbackLocation] is
///   set, so every destination has a way out.
/// - [banner] sits above the body (e.g. `OfflineBanner`); [bottomBar] is the
///   action dock.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.titleWidget,
    this.actions = const [],
    this.leading,
    this.backFallbackLocation,
    this.banner,
    this.bottomBar,
    this.floatingActionButton,
    this.maxContentWidth,
    this.showAppBar = true,
    this.padBody = true,
  });

  final Widget body;
  final String? title;
  final Widget? titleWidget;
  final List<Widget> actions;
  final Widget? leading;

  /// Where the back button goes when there is nothing to pop.
  final String? backFallbackLocation;
  final Widget? banner;
  final Widget? bottomBar;
  final Widget? floatingActionButton;

  /// Constrains and centres the body (forms, reading content).
  final double? maxContentWidth;
  final bool showAppBar;

  /// Adds the layout's horizontal page padding around [body].
  final bool padBody;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final navigation = AppNavigationScope.maybeOf(context);
    final showNavigation = navigation != null && navigation.isVisible;
    final content = _buildContent(layout);

    return Scaffold(
      appBar: showAppBar ? _buildAppBar(context) : null,
      floatingActionButton: floatingActionButton,
      body: showNavigation && layout.isTabletOrWider
          ? Row(
              children: [
                _buildRail(navigation, extended: layout.isDesktop),
                VerticalDivider(width: 1, color: context.colors.line),
                Expanded(child: content),
              ],
            )
          : content,
      bottomNavigationBar: _buildBottom(
        navigation: showNavigation && layout.isPhone ? navigation : null,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading ?? _buildBackButton(context),
      title: titleWidget ?? (title == null ? null : Text(title!)),
      actions: [
        ...actions,
        const SizedBox(width: AppSpacing.xs),
      ],
    );
  }

  Widget? _buildBackButton(BuildContext context) {
    final canPop = GoRouter.maybeOf(context)?.canPop() ?? false;
    final fallback = backFallbackLocation;
    if (!canPop && fallback == null) return null;
    return AppBackButton(fallbackLocation: fallback ?? '/');
  }

  Widget _buildContent(AppLayout layout) {
    final horizontal = switch (layout) {
      AppLayout.phone => AppSpacing.pagePhone,
      AppLayout.tablet => AppSpacing.pageTablet,
      AppLayout.desktop => AppSpacing.pageDesktop,
    };
    Widget content = padBody
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontal),
            child: body,
          )
        : body;
    final maxWidth = maxContentWidth;
    if (maxWidth != null) {
      content = Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: content,
        ),
      );
    }
    return SafeArea(
      top: !showAppBar,
      bottom: bottomBar == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ?banner,
          Expanded(child: content),
        ],
      ),
    );
  }

  Widget _buildRail(AppNavigation navigation, {required bool extended}) {
    return NavigationRail(
      extended: extended,
      minExtendedWidth: 220,
      labelType: extended
          ? NavigationRailLabelType.none
          : NavigationRailLabelType.all,
      selectedIndex: navigation.selectedIndex,
      onDestinationSelected: navigation.onSelected,
      destinations: [
        for (final item in navigation.items)
          NavigationRailDestination(
            icon: Icon(item.icon),
            selectedIcon: Icon(item.selectedIcon),
            label: Text(item.label),
          ),
      ],
    );
  }

  Widget? _buildBottom({AppNavigation? navigation}) {
    final dock = bottomBar;
    if (navigation == null) {
      return dock == null ? null : SafeArea(top: false, child: dock);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ?dock,
        NavigationBar(
          selectedIndex: navigation.selectedIndex ?? 0,
          onDestinationSelected: navigation.onSelected,
          destinations: [
            for (final item in navigation.items)
              NavigationDestination(
                icon: Icon(item.icon),
                selectedIcon: Icon(item.selectedIcon),
                label: item.label,
              ),
          ],
        ),
      ],
    );
  }
}
