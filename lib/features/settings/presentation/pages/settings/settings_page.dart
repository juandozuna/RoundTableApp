import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/role_chip.dart';
import '../../../../../core/widgets/sync_pill.dart';
import '../../../../home/home_routes.dart';
import '../../../../notifications/notifications_routes.dart';
import '../../../../shell/presentation/widgets/context_chip_slot.dart';
import '../../../settings_routes.dart';
import 'cubit/settings_cubit.dart';
import 'cubit/settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listenWhen: (previous, current) =>
          previous.signOutStatus != current.signOutStatus,
      listener: _onSignOutChanged,
      builder: (context, state) => AppScaffold(
        title: context.l10n.settingsTitle,
        actions: const [ContextChipSlot()],
        maxContentWidth: AppSpacing.contentMaxWidth,
        banner: state.online
            ? null
            : OfflineBanner(detail: context.l10n.settingsOfflineDetail),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: [
            _buildProfile(context, state),
            const SizedBox(height: AppSpacing.lg),
            _buildLinks(context),
            const SizedBox(height: AppSpacing.lg),
            _buildSync(context, state),
            const SizedBox(height: AppSpacing.lg),
            _buildAbout(context, state),
            const SizedBox(height: AppSpacing.xl),
            _buildSignOut(context, state),
          ],
        ),
      ),
    );
  }

  void _onSignOutChanged(BuildContext context, SettingsState state) {
    switch (state.signOutStatus) {
      case SignOutStatus.done:
        context.go(HomeRoutes.home);
      case SignOutStatus.failed:
        AppToast.show(
          context,
          context.l10n.settingsSignOutFailed,
          kind: AppToastKind.error,
        );
      case SignOutStatus.idle || SignOutStatus.inProgress:
        break;
    }
  }

  Widget _buildProfile(BuildContext context, SettingsState state) {
    final l10n = context.l10n;
    final profile = state.profile;
    final sessionContext = state.context;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppAvatar(name: profile?.fullName ?? '?', size: 56),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile?.fullName ?? l10n.settingsProfileUnavailable,
                      style: context.textTheme.titleLarge,
                    ),
                    if (sessionContext != null) ...[
                      const SizedBox(height: AppSpacing.xs),
                      RoleChip(role: sessionContext.role),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (profile != null) ...[
            const SizedBox(height: AppSpacing.md),
            _buildContactRow(
              context,
              Icons.mail_outline_rounded,
              profile.email,
            ),
            _buildContactRow(context, Icons.phone_outlined, profile.phone),
          ],
          const SizedBox(height: AppSpacing.md),
          AppButton(
            label: l10n.settingsEditProfile,
            icon: Icons.edit_rounded,
            variant: AppButtonVariant.secondary,
            onPressed: state.online && profile != null
                ? () => context.push(SettingsRoutes.profile)
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildContactRow(BuildContext context, IconData icon, String? value) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        children: [
          Icon(icon, size: AppSizes.iconMd, color: context.colors.muted),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(value, style: context.textTheme.bodyMedium)),
        ],
      ),
    );
  }

  Widget _buildLinks(BuildContext context) {
    return AppCard(
      onTap: () => context.push(NotificationsRoutes.preferences),
      child: Row(
        children: [
          Icon(Icons.notifications_rounded, color: context.colors.accent),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(
              context.l10n.settingsNotifications,
              style: context.textTheme.titleMedium,
            ),
          ),
          const Icon(Icons.chevron_right_rounded),
        ],
      ),
    );
  }

  Widget _buildSync(BuildContext context, SettingsState state) {
    final l10n = context.l10n;
    final sync = state.sync;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.settingsSyncKicker.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          SyncPill(
            state: sync.aggregateState,
            detail: sync.hasStalePending
                ? l10n.syncStaleWarning
                : l10n.syncPendingCount(sync.pendingCount),
          ),
        ],
      ),
    );
  }

  Widget _buildAbout(BuildContext context, SettingsState state) {
    final l10n = context.l10n;
    final info = state.appInfo;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.settingsAboutKicker.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.appTitle, style: context.textTheme.titleMedium),
          if (info != null)
            Text(
              l10n.settingsVersion(info.version, info.buildNumber),
              style: context.textTheme.bodySmall,
            ),
        ],
      ),
    );
  }

  Widget _buildSignOut(BuildContext context, SettingsState state) {
    final l10n = context.l10n;
    final inProgress = state.signOutStatus == SignOutStatus.inProgress;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.sync.pendingCount > 0) ...[
          AppMessage(
            tone: StatusTone.pending,
            title: l10n.settingsSignOutPendingTitle,
            detail: l10n.settingsSignOutPendingDetail(state.sync.pendingCount),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        AppButton(
          label: l10n.settingsSignOut,
          icon: Icons.logout_rounded,
          variant: AppButtonVariant.danger,
          loading: inProgress,
          onPressed: () => _confirmSignOut(context, state),
        ),
      ],
    );
  }

  Future<void> _confirmSignOut(
    BuildContext context,
    SettingsState state,
  ) async {
    final l10n = context.l10n;
    final cubit = context.read<SettingsCubit>();
    final confirmed = await AppDialogs.confirm(
      context,
      title: l10n.settingsSignOutConfirmTitle,
      message: state.sync.pendingCount > 0
          ? l10n.settingsSignOutConfirmPending
          : l10n.settingsSignOutConfirmMessage,
      confirmLabel: l10n.settingsSignOut,
      destructive: true,
    );
    if (confirmed) await cubit.signOut();
  }
}
