import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../auth/auth_routes.dart';
import '../../../../auth/presentation/widgets/auth_flow_layout.dart';
import '../../../../auth/presentation/widgets/auth_steps.dart';
import '../../../domain/models/invite_problem.dart';
import '../../../invites_routes.dart';
import '../../widgets/invite_code_form_field.dart';
import '../../widgets/invite_problem_text.dart';
import 'cubit/code_entry_cubit.dart';
import 'cubit/code_entry_state.dart';

/// Step 1/3: type the 6-character code.
class CodeEntryPage extends StatefulWidget {
  const CodeEntryPage({super.key});

  @override
  State<CodeEntryPage> createState() => _CodeEntryPageState();
}

class _CodeEntryPageState extends State<CodeEntryPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  void _check(String code) {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    context.read<CodeEntryCubit>().submit(code);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<CodeEntryCubit, CodeEntryState>(
      listener: (context, state) {
        final preview = state.verified;
        if (preview != null) {
          context.read<CodeEntryCubit>().reset();
          context.push(InvitesRoutes.redeemFor(preview.code), extra: preview);
        } else if (state.isUnusableInvite) {
          context.read<CodeEntryCubit>().reset();
          context.push(InvitesRoutes.redeemFor(state.code!));
        }
      },
      builder: (context, state) {
        final checking = state.status == CodeEntryStatus.checking;
        return AuthFlowLayout(
          title: l10n.invitesCodeTitle,
          backFallbackLocation: AuthRoutes.signIn,
          step: AuthSteps(
            current: 1,
            labels: [
              l10n.invitesStepCode,
              l10n.invitesStepConfirm,
              l10n.invitesStepProfile,
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.invitesCodeHeadline,
                style: context.textTheme.displaySmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.invitesCodeSubtitle,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.muted,
                ),
              ),
              const SizedBox(height: AppSpacing.lg + 2),
              FormBuilder(
                key: _formKey,
                child: InviteCodeFormField(
                  name: 'code',
                  enabled: !state.isLocked && !checking,
                  hasError: state.status == CodeEntryStatus.failed,
                  onChanged: context.read<CodeEntryCubit>().edited,
                  onComplete: _check,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              _buildFeedback(context, state),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: l10n.actionContinue,
                loading: checking,
                onPressed: state.isLocked
                    ? null
                    : () {
                        final value =
                            _formKey.currentState?.instantValue['code']
                                as String?;
                        if (value != null && value.length == 6) {
                          _check(value);
                        } else {
                          _formKey.currentState?.saveAndValidate();
                        }
                      },
              ),
              const SizedBox(height: AppSpacing.sm),
              AppButton(
                label: l10n.invitesPreferQr,
                icon: Icons.qr_code_scanner_rounded,
                variant: AppButtonVariant.secondary,
                onPressed: () => context.pushReplacement(InvitesRoutes.scan),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeedback(BuildContext context, CodeEntryState state) {
    final l10n = context.l10n;
    if (state.isLocked) {
      return AppMessage(
        tone: StatusTone.error,
        icon: Icons.lock_clock_rounded,
        title: l10n.invitesCodeLockedTitle,
        detail: l10n.invitesCodeLocked,
      );
    }
    final problem = state.problem;
    if (problem == null) {
      return Text(
        l10n.invitesCodeHint,
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall,
      );
    }
    final detail = problem == InviteProblem.notFound
        ? l10n.invitesCodeNotFoundAttempts(state.remainingAttempts)
        : problem.message(context);
    // Expired/revoked/used codes are real invites: explain on a full screen.
    return AppMessage(
      tone: problem == InviteProblem.offline
          ? StatusTone.offline
          : StatusTone.error,
      title: detail,
    );
  }
}
