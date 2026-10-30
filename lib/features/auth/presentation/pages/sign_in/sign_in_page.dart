import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/app_config.dart';
import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/form_rules.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_chip.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/form_fields/app_password_form_field.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../auth_routes.dart';
import '../../../domain/models/dev_users.dart';
import '../../widgets/auth_flow_layout.dart';
import '../../widgets/provider_button.dart';
import 'cubit/sign_in_cubit.dart';
import 'cubit/sign_in_state.dart';

/// "Puerta única": the one sign-in screen for everyone (ADR 0015). Offers
/// the methods the build enables (ADR 0018): email + password and/or the
/// social providers.
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  static const String _emailField = 'email';
  static const String _passwordField = 'password';
  static const String _confirmField = 'confirm';

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) => AuthFlowLayout(
        onBack: state.mode == SignInMode.signIn || state.isBusy
            ? null
            : () => context.read<SignInCubit>().showMode(SignInMode.signIn),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context, state),
            if (state.notice != SignInNotice.none) ...[
              const SizedBox(height: AppSpacing.md),
              _buildNotice(context, state.notice),
            ],
            const SizedBox(height: AppSpacing.lg),
            if (state.emailEnabled) _buildEmailForm(context, state),
            if (state.emailEnabled && state.providers.isNotEmpty)
              _buildProvidersDivider(context),
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

  Widget _buildHeader(BuildContext context, SignInState state) {
    final l10n = context.l10n;
    final (title, subtitle) = switch (state.mode) {
      SignInMode.createAccount when state.emailEnabled => (
        l10n.authCreateTitle,
        l10n.authCreateSubtitle,
      ),
      SignInMode.resetPassword when state.emailEnabled => (
        l10n.authResetTitle,
        l10n.authResetSubtitle,
      ),
      _ => (
        l10n.authGateTitle,
        state.emailEnabled ? l10n.authGateSubtitleEmail : l10n.authGateSubtitle,
      ),
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(title, style: context.textTheme.displaySmall),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          subtitle,
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
      SignInNotice.emailAlreadyRegistered => (
        StatusTone.error,
        Icons.error_rounded,
        l10n.authNoticeEmailTakenTitle,
        l10n.authNoticeEmailTakenDetail,
      ),
      SignInNotice.weakPassword => (
        StatusTone.error,
        Icons.error_rounded,
        l10n.authNoticeWeakPasswordTitle,
        l10n.authNoticeWeakPasswordDetail,
      ),
      SignInNotice.rateLimited => (
        StatusTone.late,
        Icons.hourglass_top_rounded,
        l10n.authNoticeRateLimitedTitle,
        l10n.authNoticeRateLimitedDetail,
      ),
      SignInNotice.emailNotConfirmed => (
        StatusTone.late,
        Icons.mark_email_unread_rounded,
        l10n.authNoticeEmailNotConfirmedTitle,
        l10n.authNoticeEmailNotConfirmedDetail,
      ),
      SignInNotice.linkExpired => (
        StatusTone.late,
        Icons.link_off_rounded,
        l10n.authNoticeLinkExpiredTitle,
        l10n.authNoticeLinkExpiredDetail,
      ),
      SignInNotice.confirmEmailSent => (
        StatusTone.ok,
        Icons.mark_email_read_rounded,
        l10n.authNoticeConfirmEmailSentTitle,
        l10n.authNoticeConfirmEmailSentDetail,
      ),
      SignInNotice.resetEmailSent => (
        StatusTone.ok,
        Icons.mark_email_read_rounded,
        l10n.authNoticeResetSentTitle,
        l10n.authNoticeResetSentDetail,
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

  Widget _buildEmailForm(BuildContext context, SignInState state) {
    final l10n = context.l10n;
    final mode = state.mode;
    final (actionLabel, actionIcon) = switch (mode) {
      SignInMode.signIn => (l10n.authSignInAction, Icons.login_rounded),
      SignInMode.createAccount => (
        l10n.authCreateAction,
        Icons.person_add_alt_1_rounded,
      ),
      SignInMode.resetPassword => (l10n.authResetAction, Icons.send_rounded),
    };
    final busy = state.isBusy;
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextFormField(
            name: _emailField,
            label: l10n.authEmailLabel,
            kind: AppFieldKind.email,
            required: true,
            enabled: !busy,
            prefixIcon: Icons.mail_outline_rounded,
            textInputAction: mode == SignInMode.resetPassword
                ? TextInputAction.done
                : TextInputAction.next,
            onSubmitted: mode == SignInMode.resetPassword
                ? (_) => _submit(context, mode)
                : null,
          ),
          if (mode != SignInMode.resetPassword) ...[
            const SizedBox(height: AppSpacing.md),
            AppPasswordFormField(
              name: _passwordField,
              label: mode == SignInMode.createAccount
                  ? l10n.authNewPasswordLabel
                  : l10n.authPasswordLabel,
              kind: mode == SignInMode.createAccount
                  ? AppFieldKind.newPassword
                  : AppFieldKind.currentPassword,
              helper: mode == SignInMode.createAccount
                  ? l10n.authPasswordHelper
                  : null,
              enabled: !busy,
              textInputAction: mode == SignInMode.createAccount
                  ? TextInputAction.next
                  : TextInputAction.done,
              onSubmitted: mode == SignInMode.createAccount
                  ? null
                  : (_) => _submit(context, mode),
            ),
          ],
          if (mode == SignInMode.createAccount) ...[
            const SizedBox(height: AppSpacing.md),
            AppPasswordFormField(
              name: _confirmField,
              label: l10n.authConfirmPasswordLabel,
              kind: AppFieldKind.confirmPassword,
              matchValue: () =>
                  _formKey.currentState?.instantValue[_passwordField]
                      as String?,
              enabled: !busy,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _submit(context, mode),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: actionLabel,
            icon: actionIcon,
            loading: state.emailBusy,
            onPressed: busy ? null : () => _submit(context, mode),
          ),
          const SizedBox(height: AppSpacing.xs),
          ..._buildModeLinks(context, state),
        ],
      ),
    );
  }

  List<Widget> _buildModeLinks(BuildContext context, SignInState state) {
    final l10n = context.l10n;
    final cubit = context.read<SignInCubit>();
    final busy = state.isBusy;
    Widget link(String label, SignInMode target) => Center(
      child: AppTextButton(
        label: label,
        onPressed: busy ? null : () => cubit.showMode(target),
      ),
    );
    return switch (state.mode) {
      SignInMode.signIn => [
        link(l10n.authForgotPassword, SignInMode.resetPassword),
        link(l10n.authFirstTime, SignInMode.createAccount),
      ],
      SignInMode.createAccount => [
        link(l10n.authHaveAccount, SignInMode.signIn),
      ],
      SignInMode.resetPassword => [
        link(l10n.authBackToSignIn, SignInMode.signIn),
      ],
    };
  }

  void _submit(BuildContext context, SignInMode mode) {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final cubit = context.read<SignInCubit>();
    final values = form.value;
    final email = values[_emailField] as String;
    final password = (values[_passwordField] as String?) ?? '';
    switch (mode) {
      case SignInMode.signIn:
        cubit.signInWithEmail(email, password);
      case SignInMode.createAccount:
        cubit.createAccount(email, password);
      case SignInMode.resetPassword:
        cubit.requestPasswordReset(email, returnPath: AuthRoutes.resetPassword);
    }
  }

  Widget _buildProvidersDivider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Row(
        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Text(
              context.l10n.authOrProviders.toUpperCase(),
              style: context.textStyles.kicker,
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _buildProviders(BuildContext context, SignInState state) {
    if (state.providers.isEmpty) return const SizedBox.shrink();
    final cubit = context.read<SignInCubit>();
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final provider in state.providers)
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
