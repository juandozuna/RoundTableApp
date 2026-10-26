import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_switch_tile.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../settings/settings_routes.dart';
import '../../../domain/models/notification_permission.dart';
import '../../../domain/models/notification_settings.dart';
import 'cubit/notification_preferences_cubit.dart';
import 'cubit/notification_preferences_state.dart';

class NotificationPreferencesPage extends StatelessWidget {
  const NotificationPreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.l10n.notificationsTitle,
      backFallbackLocation: SettingsRoutes.settings,
      maxContentWidth: AppSpacing.contentMaxWidth,
      body:
          BlocBuilder<
            NotificationPreferencesCubit,
            NotificationPreferencesState
          >(
            builder: (context, state) => switch (state) {
              NotificationPreferencesLoading() => const Padding(
                padding: EdgeInsets.only(top: AppSpacing.lg),
                child: SkeletonList(count: 3),
              ),
              NotificationPreferencesFailure() => ErrorState(
                message: context.l10n.errorGeneric,
                onRetry: context.read<NotificationPreferencesCubit>().load,
              ),
              NotificationPreferencesReady(:final settings) => _buildSettings(
                context,
                settings,
              ),
            },
          ),
    );
  }

  Widget _buildSettings(BuildContext context, NotificationSettings settings) {
    final l10n = context.l10n;
    final cubit = context.read<NotificationPreferencesCubit>();
    final preferences = settings.preferences;
    final pushAvailable =
        settings.permission != NotificationPermission.unsupported;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Text(l10n.notificationsIntro, style: context.textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.lg),
        _buildPermission(context, settings.permission),
        AppCard(
          child: Column(
            children: [
              AppSwitchTile(
                title: l10n.notificationsPushTitle,
                subtitle: l10n.notificationsPushSubtitle,
                value: preferences.pushEnabled && pushAvailable,
                onChanged: pushAvailable ? cubit.setPushEnabled : null,
              ),
              AppSwitchTile(
                title: l10n.notificationsForegroundTitle,
                subtitle: l10n.notificationsForegroundSubtitle,
                value: preferences.foregroundAlerts,
                onChanged: cubit.setForegroundAlerts,
              ),
              AppSwitchTile(
                title: l10n.notificationsUnsyncedSwitchTitle,
                subtitle: l10n.notificationsUnsyncedSwitchSubtitle,
                value: preferences.unsyncedAlert,
                onChanged: cubit.setUnsyncedAlert,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPermission(
    BuildContext context,
    NotificationPermission permission,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<NotificationPreferencesCubit>();
    final message = switch (permission) {
      NotificationPermission.granted => null,
      NotificationPermission.unsupported => AppMessage(
        tone: StatusTone.info,
        title: l10n.notificationsUnsupportedTitle,
        detail: l10n.notificationsUnsupportedDetail,
      ),
      NotificationPermission.denied => AppMessage(
        tone: StatusTone.error,
        title: l10n.notificationsDeniedTitle,
        detail: l10n.notificationsDeniedDetail,
      ),
      NotificationPermission.notDetermined => AppMessage(
        tone: StatusTone.pending,
        title: l10n.notificationsAskTitle,
        detail: l10n.notificationsAskDetail,
        action: AppButton(
          label: l10n.notificationsAllow,
          icon: Icons.notifications_active_rounded,
          fullWidth: false,
          onPressed: cubit.allowNotifications,
        ),
      ),
    };
    if (message == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: message,
    );
  }
}
