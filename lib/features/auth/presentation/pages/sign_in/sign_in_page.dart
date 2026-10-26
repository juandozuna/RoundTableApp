import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_config.dart';
import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_chip.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../auth_routes.dart';
import '../../../domain/models/auth_provider.dart';
import '../../../domain/models/dev_users.dart';
import '../../widgets/auth_flow_layout.dart';
import '../../widgets/provider_button.dart';
import 'cubit/sign_in_cubit.dart';
import 'cubit/sign_in_state.dart';

/// "Puerta única": the one sign-in screen for everyone (ADR 0015).
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) => AuthFlowLayout(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            if (state.notice != SignInNotice.none) ...[
              const SizedBox(height: AppSpacing.md),
              _buildNotice(context, state.notice),
            ],
            const SizedBox(height: AppSpacing.lg),
            _buildProviders(context, state),
            _buildInviteEntry(context, state),
            const SizedBox(height: AppSpacing.lg),
            Text(
              context.l10n.authGateFine,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall,
            ),
            if (AppConfig.devAuthCompiledIn)
              _buildDevPanel(context, state: state),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            context.l10n.authGateTitle,
            style: context.textTheme.displaySmall,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          context.l10n.authGateSubtitle,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
      ],
    );
  }

  Widget _buildNotice(BuildContext context, SignInNotice notice) {
    final l10n = context.l10n;
    final (tone, icon, title, detail) = switch (notice) {
      SignInNotice.cancelled => (
        StatusTone.info,
        Icons.info_rounded,
        l10n.authNoticeCancelledTitle,
        l10n.authNoticeCancelledDetail,
      ),
      SignInNotice.offline => (
        StatusTone.offline,
        Icons.cloud_off_rounded,
        l10n.authNoticeOfflineTitle,
        l10n.authNoticeOfflineDetail,
      ),
      SignInNotice.invalidCredentials => (
        StatusTone.error,
        Icons.error_rounded,
        l10n.authNoticeCredentialsTitle,
        null,
      ),
      SignInNotice.notConfigured => (
        StatusTone.error,
        Icons.settings_suggest_rounded,
        l10n.authNoticeNotConfiguredTitle,
        l10n.authNoticeNotConfiguredDetail,
      ),
      SignInNotice.failed || SignInNotice.none => (
        StatusTone.error,
        Icons.error_rounded,
        l10n.authNoticeFailedTitle,
        l10n.authNoticeFailedDetail,
      ),
    };
    return AppMessage(tone: tone, icon: icon, title: title, detail: detail);
  }

  Widget _buildProviders(BuildContext context, SignInState state) {
    final cubit = context.read<SignInCubit>();
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final provider in AuthProvider.values)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm + 2),
            child: ProviderButton(
              provider: provider,
              label: l10n.authProviderContinue(
                ProviderButton.nameOf(context, provider),
              ),
              loading: state.signingInWith == provider,
              onPressed: state.isBusy ? null : () => cubit.signIn(provider),
            ),
          ),
        if (state.signingInWith != null) ...[
          Text(
            l10n.authSigningIn(
              ProviderButton.nameOf(context, state.signingInWith!),
            ),
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
          AppTextButton(label: l10n.actionCancel, onPressed: cubit.cancel),
        ],
      ],
    );
  }

  Widget _buildInviteEntry(BuildContext context, SignInState state) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Row(
            children: [
              const Expanded(child: Divider()),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: Text(
                  l10n.authInvitedDivider.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
              ),
              const Expanded(child: Divider()),
            ],
          ),
        ),
        AppButton(
          label: l10n.authHaveInviteCode,
          icon: Icons.pin_rounded,
          variant: AppButtonVariant.secondary,
          onPressed: state.isBusy
              ? null
              : () => context.go(AuthRoutes.inviteCode),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: l10n.authScanQr,
          icon: Icons.qr_code_scanner_rounded,
          variant: AppButtonVariant.secondary,
          onPressed: state.isBusy
              ? null
              : () => context.go(AuthRoutes.inviteScan),
        ),
      ],
    );
  }

  Widget _buildDevPanel(BuildContext context, {required SignInState state}) {
    final cubit = context.read<SignInCubit>();
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xl),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md + 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          border: Border.all(color: context.colors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.authDevTitle.toUpperCase(),
              style: context.textStyles.kicker,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(l10n.authDevHint, style: context.textTheme.bodySmall),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final user in DevUsers.accounts)
                  AppChip(
                    label: user.label,
                    selected: false,
                    onSelected: state.isBusy
                        ? null
                        : (_) => cubit.signInAsDevUser(
                            user.email,
                            DevUsers.password,
                          ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            AppButton(
              label: l10n.authDevCreate,
              icon: Icons.person_add_alt_1_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              loading: state.devBusy,
              onPressed: state.isBusy ? null : cubit.signInAsNewDevAccount,
            ),
          ],
        ),
      ),
    );
  }
}
