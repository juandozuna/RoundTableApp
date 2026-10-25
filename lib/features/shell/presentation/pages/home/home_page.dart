import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/sync_pill.dart';
import '../../../shell_routes.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.showGalleryLink});

  final bool showGalleryLink;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => AppScaffold(
        title: context.l10n.homeTitle,
        maxContentWidth: AppSpacing.contentMaxWidth,
        banner: state.online
            ? null
            : OfflineBanner(detail: context.l10n.offlineDetailSavedLocally),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: [
            _buildWelcome(context),
            const SizedBox(height: AppSpacing.lg),
            _buildSync(context, state.sync),
            if (showGalleryLink) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: context.l10n.homeOpenGallery,
                icon: Icons.widgets_rounded,
                variant: AppButtonVariant.secondary,
                onPressed: () => context.push(ShellRoutes.componentGallery),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildWelcome(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.homeWelcome, style: context.textTheme.displaySmall),
        const SizedBox(height: AppSpacing.sm),
        Text(
          context.l10n.homeFoundationReady,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colors.muted,
          ),
        ),
      ],
    );
  }

  Widget _buildSync(BuildContext context, SyncSnapshot sync) {
    final l10n = context.l10n;
    if (sync.connection == SyncConnection.unavailable &&
        sync.pendingCount == 0) {
      return Text(l10n.syncUnavailable, style: context.textTheme.bodySmall);
    }
    return SyncPill(
      state: sync.aggregateState,
      detail: sync.hasStalePending
          ? l10n.syncStaleWarning
          : l10n.syncPendingCount(sync.pendingCount),
    );
  }
}
