import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../auth/auth_routes.dart';
import '../../../../auth/domain/models/auth_failure.dart';
import '../../../../auth/domain/models/auth_provider.dart';
import '../../../../auth/presentation/widgets/auth_flow_layout.dart';
import '../../../../auth/presentation/widgets/auth_result_view.dart';
import '../../../../auth/presentation/widgets/auth_steps.dart';
import '../../../../auth/presentation/widgets/provider_button.dart';
import '../../../domain/models/invite_preview.dart';
import '../../../domain/models/invite_problem.dart';
import '../../../domain/models/redeem_profile.dart';
import '../../../invites_routes.dart';
import '../../widgets/invite_labels.dart';
import 'cubit/redeem_cubit.dart';
import 'cubit/redeem_state.dart';

/// `/invitacion/<code>`: welcome card → provider → profile → welcome.
class RedeemPage extends StatelessWidget {
  const RedeemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedeemCubit, RedeemState>(
      builder: (context, state) {
        final l10n = context.l10n;
        final banner = state.online
            ? null
            : OfflineBanner(detail: l10n.invitesOfflineJoin);
        return switch (state.step) {
          RedeemStep.loading => AuthFlowLayout(
            banner: banner,
            backFallbackLocation: InvitesRoutes.redeem,
            step: _steps(context, 2),
            child: _buildLoading(context),
          ),
          RedeemStep.preview => AuthFlowLayout(
            banner: banner,
            title: l10n.invitesPreviewBar,
            backFallbackLocation: InvitesRoutes.redeem,
            step: _steps(context, 2),
            child: _buildPreview(context, state),
          ),
          RedeemStep.profile || RedeemStep.submitting => AuthFlowLayout(
            banner: banner,
            title: l10n.invitesProfileBar,
            onBack: state.step == RedeemStep.submitting
                ? null
                : context.read<RedeemCubit>().backToPreview,
            backFallbackLocation: InvitesRoutes.redeem,
            step: _steps(context, 3),
            child: _ProfileForm(state: state),
          ),
          RedeemStep.welcome => AuthFlowLayout(
            banner: banner,
            child: _buildWelcome(context, state),
          ),
          RedeemStep.blocked => AuthFlowLayout(
            banner: banner,
            child: _buildBlocked(context, state),
          ),
        };
      },
    );
  }

  Widget _steps(BuildContext context, int current) {
    final l10n = context.l10n;
    return AuthSteps(
      current: current,
      labels: [
        l10n.invitesStepCode,
        l10n.invitesStepConfirm,
        l10n.invitesStepProfile,
      ],
    );
  }

  Widget _buildLoading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: AppSpacing.lg),
          Text(
            context.l10n.invitesChecking,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildPreview(BuildContext context, RedeemState state) {
    final l10n = context.l10n;
    final cubit = context.read<RedeemCubit>();
    final preview = state.preview!;
    final signedIn = state.isSignedIn;
    final provider = state.user?.provider;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.invitesPreviewHeadline,
          style: context.textTheme.displaySmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.invitesPreviewSubtitle,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        _InvitationCard(preview: preview),
        if (state.authNotice != null) ...[
          const SizedBox(height: AppSpacing.md),
          _buildAuthNotice(context, state.authNotice!),
        ],
        if (!state.online) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.offline,
            icon: Icons.cloud_off_rounded,
            title: l10n.invitesNeedInternetToJoin,
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        if (signedIn) ...[
          AppButton(
            label: l10n.invitesJoinAs(
              InviteLabels.role(context, preview.roleKind),
            ),
            onPressed: state.online ? cubit.continueWithAccount : null,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            provider == null
                ? (state.user?.email ?? '')
                : l10n.invitesSignedInWith(
                    ProviderButton.nameOf(context, provider),
                  ),
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
          AppTextButton(
            label: l10n.invitesUseAnotherAccount,
            fullWidth: true,
            onPressed: cubit.useAnotherAccount,
          ),
        ] else ...[
          Text(
            l10n.invitesConfirmWithAccount.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final option in AuthProvider.values)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm + 2),
              child: ProviderButton(
                provider: option,
                label: l10n.authProviderJoinWith(
                  ProviderButton.nameOf(context, option),
                ),
                loading: state.signingInWith == option,
                onPressed: state.signingInWith != null || !state.online
                    ? null
                    : () => cubit.signIn(option),
              ),
            ),
          if (state.signingInWith != null)
            AppTextButton(
              label: l10n.actionCancel,
              fullWidth: true,
              onPressed: cubit.cancelSignIn,
            ),
        ],
      ],
    );
  }

  Widget _buildAuthNotice(BuildContext context, AuthFailureKind kind) {
    final l10n = context.l10n;
    return switch (kind) {
      AuthFailureKind.cancelled => AppMessage(
        tone: StatusTone.info,
        title: l10n.invitesAuthCancelledTitle,
        detail: l10n.invitesAuthCancelledDetail,
      ),
      AuthFailureKind.offline => AppMessage(
        tone: StatusTone.offline,
        icon: Icons.cloud_off_rounded,
        title: l10n.authNoticeOfflineTitle,
        detail: l10n.authNoticeOfflineDetail,
      ),
      _ => AppMessage(
        tone: StatusTone.error,
        title: l10n.authNoticeFailedTitle,
        detail: l10n.authNoticeFailedDetail,
      ),
    };
  }

  Widget _buildWelcome(BuildContext context, RedeemState state) {
    final l10n = context.l10n;
    final result = state.result!;
    final name = result.person.firstName;
    final scope = state.preview?.scopeName ?? result.invite.scopeName;
    final role = InviteLabels.role(context, result.invite.roleKind);
    final provider = state.user?.provider;
    final contextLabel = result.joinedContext?.label ?? '$role · $scope';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthResultView(
          tone: StatusTone.ok,
          icon: Icons.check_rounded,
          title: l10n.invitesWelcomeTitle(name),
          body: l10n.invitesWelcomeBody(scope, role),
        ),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _check(
                context,
                provider == null
                    ? l10n.invitesWelcomeAccountLinkedGeneric
                    : l10n.invitesWelcomeAccountLinked(
                        ProviderButton.nameOf(context, provider),
                      ),
              ),
              _check(context, l10n.invitesWelcomeProfileConfirmed),
              _check(context, l10n.invitesWelcomeContext(contextLabel)),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        AppButton(
          label: result.invite.roundTableId == null
              ? l10n.invitesWelcomeEnter
              : l10n.invitesWelcomeEnterTable,
          onPressed: () => context.go(AuthRoutes.appRoot),
        ),
      ],
    );
  }

  Widget _check(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            size: AppSizes.iconMd,
            color: context.statusColors.ok,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(text, style: context.textTheme.labelLarge)),
        ],
      ),
    );
  }

  Widget _buildBlocked(BuildContext context, RedeemState state) {
    final l10n = context.l10n;
    final cubit = context.read<RedeemCubit>();
    final problem = state.problem ?? InviteProblem.generic;
    final tryAnother = AppButton(
      label: l10n.invitesTryAnotherCode,
      variant: AppButtonVariant.secondary,
      onPressed: () => context.go(InvitesRoutes.redeem),
    );
    final toGate = AppButton(
      label: l10n.invitesBackToGate,
      variant: AppButtonVariant.ghost,
      onPressed: () => context.go(AuthRoutes.signIn),
    );
    final signInOrHome = AppButton(
      label: state.isSignedIn ? l10n.actionGoHome : l10n.invitesSignIn,
      onPressed: () =>
          context.go(state.isSignedIn ? AuthRoutes.appRoot : AuthRoutes.signIn),
    );
    final anotherAccount = AppButton(
      label: l10n.invitesUseAnotherAccount,
      onPressed: cubit.useAnotherAccount,
    );
    final retry = AppButton(
      label: l10n.actionRetry,
      icon: Icons.refresh_rounded,
      onPressed: state.preview == null || state.problem == InviteProblem.offline
          ? cubit.retry
          : cubit.backToPreview,
    );

    return switch (problem) {
      InviteProblem.expired => AuthResultView(
        tone: StatusTone.pending,
        icon: Icons.schedule_rounded,
        title: l10n.invitesExpiredTitle,
        body: l10n.invitesExpiredBody,
        actions: [tryAnother, toGate],
      ),
      InviteProblem.alreadyUsed => AuthResultView(
        tone: StatusTone.info,
        icon: Icons.check_rounded,
        title: l10n.invitesUsedTitle,
        body: l10n.invitesUsedBody,
        actions: [signInOrHome, tryAnother],
      ),
      InviteProblem.revoked => AuthResultView(
        tone: StatusTone.error,
        icon: Icons.block_rounded,
        title: l10n.invitesRevokedTitle,
        body: l10n.invitesRevokedBody,
        actions: [tryAnother, toGate],
      ),
      InviteProblem.notFound => AuthResultView(
        tone: StatusTone.pending,
        icon: Icons.search_off_rounded,
        title: l10n.invitesNotFoundTitle,
        body: l10n.invitesNotFoundBody,
        actions: [tryAnother, toGate],
      ),
      InviteProblem.linkedElsewhere => AuthResultView(
        tone: StatusTone.error,
        icon: Icons.link_off_rounded,
        title: l10n.invitesLinkedTitle,
        body: l10n.invitesLinkedBody,
        actions: [anotherAccount, tryAnother],
      ),
      InviteProblem.identityLinkedElsewhere => AuthResultView(
        tone: StatusTone.info,
        icon: Icons.manage_accounts_rounded,
        title: l10n.invitesIdentityLinkedTitle,
        body: l10n.invitesIdentityLinkedBody,
        actions: [signInOrHome, anotherAccount],
      ),
      InviteProblem.personInactive ||
      InviteProblem.organizationInactive => AuthResultView(
        tone: StatusTone.error,
        icon: Icons.lock_outline_rounded,
        title: l10n.invitesUnavailableTitle,
        body: l10n.invitesProblemUnavailable,
        actions: [toGate],
      ),
      InviteProblem.offline => AuthResultView(
        tone: StatusTone.offline,
        icon: Icons.cloud_off_rounded,
        title: l10n.authNoticeOfflineTitle,
        body: l10n.authNoticeOfflineDetail,
        actions: [retry, toGate],
      ),
      _ => AuthResultView(
        tone: StatusTone.error,
        icon: Icons.error_outline_rounded,
        title: l10n.invitesGenericFailureTitle,
        body: l10n.errorGeneric,
        actions: [retry, toGate],
      ),
    };
  }
}

class _InvitationCard extends StatelessWidget {
  const _InvitationCard({required this.preview});

  final InvitePreview preview;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final inviter = preview.invitedByName;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (inviter != null)
            Row(
              children: [
                AppAvatar(name: inviter, size: 48),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.invitesInvitedBy.toUpperCase(),
                        style: context.textStyles.kicker,
                      ),
                      Text(inviter, style: context.textTheme.titleMedium),
                    ],
                  ),
                ),
              ],
            ),
          if (inviter != null) const SizedBox(height: AppSpacing.md),
          _row(
            context,
            l10n.invitesFieldOrganization,
            preview.organizationName,
          ),
          if (preview.roundTableName != null)
            _row(context, l10n.invitesFieldTable, preview.roundTableName!),
          _row(
            context,
            l10n.invitesFieldYourRole,
            null,
            trailing: StatusPill(
              tone: StatusTone.info,
              icon: Icons.person_rounded,
              label: InviteLabels.role(context, preview.roleKind),
            ),
          ),
          if (preview.personFirstName != null)
            _row(context, l10n.invitesFieldInvitee, preview.personFirstName!),
          if (preview.expiresAt != null)
            _row(
              context,
              l10n.invitesFieldExpires,
              MaterialLocalizations.of(
                context,
              ).formatMediumDate(preview.expiresAt!.toLocal()),
            ),
        ],
      ),
    );
  }

  Widget _row(
    BuildContext context,
    String label,
    String? value, {
    Widget? trailing,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label.toUpperCase(), style: context.textStyles.kicker),
          ),
          Expanded(
            child:
                trailing ??
                Text(value ?? '', style: context.textTheme.titleSmall),
          ),
        ],
      ),
    );
  }
}

class _ProfileForm extends StatefulWidget {
  const _ProfileForm({required this.state});

  final RedeemState state;

  @override
  State<_ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<_ProfileForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool get _submitting => widget.state.step == RedeemStep.submitting;

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    String? text(String key) {
      final value = (values[key] as String?)?.trim();
      return value == null || value.isEmpty ? null : value;
    }

    context.read<RedeemCubit>().submit(
      RedeemProfile(
        firstName: text('first_name'),
        lastName: text('last_name'),
        position: text('position'),
        phone: text('phone'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = widget.state;
    final profile = state.profile;
    final user = state.user;
    final provider = user?.provider;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.invitesProfileHeadline,
          style: context.textTheme.displaySmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.invitesProfileSubtitle,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard(
          child: Row(
            children: [
              Icon(Icons.link_rounded, color: context.statusColors.ok),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.invitesLinkedAccount.toUpperCase(),
                      style: context.textStyles.kicker,
                    ),
                    Text(
                      provider == null
                          ? (user?.email ?? '')
                          : ProviderButton.nameOf(context, provider),
                      style: context.textTheme.titleSmall,
                    ),
                    if (user?.email != null && provider != null)
                      Text(user!.email!, style: context.textTheme.bodySmall),
                  ],
                ),
              ),
              StatusPill(tone: StatusTone.ok, label: l10n.invitesLinkedPill),
            ],
          ),
        ),
        if (user?.hasHiddenEmail ?? false) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: StatusTone.info,
            icon: Icons.shield_outlined,
            title: l10n.invitesAppleHiddenTitle,
            detail: l10n.invitesAppleHiddenBody,
          ),
        ],
        if (state.problem != null) ...[
          const SizedBox(height: AppSpacing.md),
          AppMessage(
            tone: state.problem == InviteProblem.offline
                ? StatusTone.offline
                : StatusTone.error,
            title: state.problem == InviteProblem.offline
                ? l10n.invitesNeedInternetToJoin
                : l10n.errorGeneric,
          ),
        ],
        const SizedBox(height: AppSpacing.md),
        FormBuilder(
          key: _formKey,
          enabled: !_submitting,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppTextFormField(
                name: 'first_name',
                label: l10n.invitesFieldFirstName,
                kind: AppFieldKind.personName,
                required: true,
                initialValue: profile?.firstName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextFormField(
                name: 'last_name',
                label: l10n.invitesFieldLastName,
                kind: AppFieldKind.personName,
                required: true,
                initialValue: profile?.lastName,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextFormField(
                name: 'position',
                label: l10n.invitesFieldPositionOptional,
                initialValue: profile?.position,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextFormField(
                name: 'phone',
                label: l10n.invitesFieldPhoneOptional,
                kind: AppFieldKind.phone,
                initialValue: profile?.phone,
                helper: l10n.invitesPhoneUnverified,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _submit(),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          label: l10n.invitesConfirmAndEnter,
          loading: _submitting,
          onPressed: state.online ? _submit : null,
        ),
      ],
    );
  }
}
