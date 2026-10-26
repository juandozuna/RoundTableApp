import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/injection.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/network/api_error_messages.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/offline_banner.dart';
import '../../../../core/widgets/skeleton.dart';
import '../../admin_routes.dart';
import '../cubit/admin_access_cubit.dart';
import '../cubit/admin_access_state.dart';
import '../pages/command_palette/command_palette.dart';
import 'admin_denied_view.dart';

typedef AdminBodyBuilder =
    Widget Function(BuildContext context, AdminAccessState access);

/// Chrome shared by every administration, report and audit screen: resolves
/// the user's scope, shows the offline banner (these screens are online-only,
/// ADR 0003), the permission-denied state and the ⌘/Ctrl+K command palette.
class AdminPageFrame extends StatelessWidget {
  const AdminPageFrame({
    super.key,
    required this.title,
    required this.builder,
    this.backFallbackLocation,
    this.onReconnect,
    this.onRetry,
    this.actions = const [],
    this.showPalette = false,
    this.maxContentWidth,
    this.padBody = true,
    this.bottomBar,
  });

  final String title;
  final AdminBodyBuilder builder;
  final String? backFallbackLocation;

  /// Called when the connection comes back, so the page can refresh.
  final VoidCallback? onReconnect;

  /// Called by the banner's Reintentar.
  final VoidCallback? onRetry;
  final List<Widget> actions;
  final bool showPalette;
  final double? maxContentWidth;
  final bool padBody;
  final Widget? bottomBar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AdminAccessCubit>(),
      child: BlocConsumer<AdminAccessCubit, AdminAccessState>(
        listenWhen: (previous, current) => !previous.online && current.online,
        listener: (context, state) => onReconnect?.call(),
        builder: (context, access) {
          final scaffold = AppScaffold(
            title: title,
            backFallbackLocation: backFallbackLocation,
            maxContentWidth: maxContentWidth,
            padBody: padBody,
            bottomBar: bottomBar,
            actions: [
              ...actions,
              if (showPalette)
                AppIconButton(
                  icon: Icons.search_rounded,
                  tooltip: context.l10n.adminPaletteTooltip,
                  onPressed: () => CommandPalette.show(context),
                ),
            ],
            banner: access.online
                ? null
                : OfflineBanner(
                    detail: context.l10n.offlineDetailOnlineOnly,
                    onRetry: onRetry,
                  ),
            body: _buildBody(context, access),
          );
          if (!showPalette) return scaffold;
          return CallbackShortcuts(
            bindings: {
              const SingleActivator(
                LogicalKeyboardKey.keyK,
                control: true,
              ): () =>
                  CommandPalette.show(context),
              const SingleActivator(LogicalKeyboardKey.keyK, meta: true): () =>
                  CommandPalette.show(context),
            },
            child: Focus(autofocus: true, child: scaffold),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, AdminAccessState access) {
    return switch (access.status) {
      AdminAccessStatus.loading => ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: const [SkeletonList(count: 6, itemHeight: 56)],
      ),
      AdminAccessStatus.denied => AdminDeniedView(
        message: context.l10n.adminDeniedRoleMessage,
        homeLocation: AdminRoutes.appHome,
        actionLabel: context.l10n.adminDeniedHomeAction,
      ),
      AdminAccessStatus.failure => ErrorState(
        message: access.error?.userMessage(context.l10n),
        onRetry: context.read<AdminAccessCubit>().retry,
      ),
      AdminAccessStatus.ready => builder(context, access),
    };
  }
}
