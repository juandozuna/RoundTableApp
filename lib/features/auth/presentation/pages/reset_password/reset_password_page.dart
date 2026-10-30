import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/form_rules.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/form_fields/app_password_form_field.dart';
import '../../../auth_routes.dart';
import '../../widgets/auth_flow_layout.dart';
import '../../widgets/auth_result_view.dart';
import 'cubit/reset_password_cubit.dart';
import 'cubit/reset_password_state.dart';

/// "Nueva contraseña": opened by the emailed recovery link, which already
/// signed the person in (ADR 0018).
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  static const String _passwordField = 'password';
  static const String _confirmField = 'confirm';

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) => AuthFlowLayout(
        onBack: state.done || state.saving
            ? null
            : context.read<ResetPasswordCubit>().cancel,
        child: state.done ? _buildDone(context) : _buildForm(context, state),
      ),
    );
  }

  Widget _buildForm(BuildContext context, ResetPasswordState state) {
    final l10n = context.l10n;
    return FormBuilder(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Semantics(
            header: true,
            child: Text(
              l10n.authResetPageTitle,
              style: context.textTheme.displaySmall,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.authResetPageSubtitle,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colors.muted,
            ),
          ),
          if (state.notice != ResetPasswordNotice.none) ...[
            const SizedBox(height: AppSpacing.md),
            _buildNotice(context, state.notice),
          ],
          const SizedBox(height: AppSpacing.lg),
          AppPasswordFormField(
            name: _passwordField,
            label: l10n.authNewPasswordLabel,
            kind: AppFieldKind.newPassword,
            helper: l10n.authPasswordHelper,
            enabled: !state.saving,
            autofocus: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSpacing.md),
          AppPasswordFormField(
            name: _confirmField,
            label: l10n.authConfirmPasswordLabel,
            kind: AppFieldKind.confirmPassword,
            matchValue: () =>
                _formKey.currentState?.instantValue[_passwordField] as String?,
            enabled: !state.saving,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(context),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.authResetSave,
            icon: Icons.lock_reset_rounded,
            loading: state.saving,
            onPressed: state.saving ? null : () => _submit(context),
          ),
          const SizedBox(height: AppSpacing.xs),
          Center(
            child: AppTextButton(
              label: l10n.authResetCancel,
              onPressed: state.saving
                  ? null
                  : context.read<ResetPasswordCubit>().cancel,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDone(BuildContext context) {
    final l10n = context.l10n;
    return AuthResultView(
      tone: StatusTone.ok,
      icon: Icons.check_rounded,
      title: l10n.authResetDoneTitle,
      body: l10n.authResetDoneBody,
      actions: [
        AppButton(
          label: l10n.actionContinue,
          onPressed: () => context.go(AuthRoutes.appRoot),
        ),
      ],
    );
  }

  Widget _buildNotice(BuildContext context, ResetPasswordNotice notice) {
    final l10n = context.l10n;
    final (tone, icon, title, detail) = switch (notice) {
      ResetPasswordNotice.offline => (
        StatusTone.offline,
        Icons.cloud_off_rounded,
        l10n.authNoticeOfflineTitle,
        null,
      ),
      ResetPasswordNotice.weakPassword || ResetPasswordNotice.none => (
        StatusTone.error,
        Icons.error_rounded,
        l10n.authNoticeWeakPasswordTitle,
        l10n.authNoticeWeakPasswordDetail,
      ),
      ResetPasswordNotice.linkExpired => (
        StatusTone.late,
        Icons.link_off_rounded,
        l10n.authNoticeLinkExpiredTitle,
        l10n.authNoticeLinkExpiredDetail,
      ),
      ResetPasswordNotice.rateLimited => (
        StatusTone.late,
        Icons.hourglass_top_rounded,
        l10n.authNoticeRateLimitedTitle,
        l10n.authNoticeRateLimitedDetail,
      ),
      ResetPasswordNotice.failed => (
        StatusTone.error,
        Icons.error_rounded,
        l10n.authNoticeFailedTitle,
        l10n.authNoticeFailedDetail,
      ),
    };
    return AppMessage(tone: tone, icon: icon, title: title, detail: detail);
  }

  void _submit(BuildContext context) {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    context.read<ResetPasswordCubit>().save(
      form.value[_passwordField] as String,
    );
  }
}
