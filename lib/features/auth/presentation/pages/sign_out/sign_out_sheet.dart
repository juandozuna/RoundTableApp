import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/config/injection.dart';
import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_message.dart';
import 'cubit/sign_out_cubit.dart';
import 'cubit/sign_out_state.dart';

/// Opens the sign-out sheet. When this phone holds changes that were never
/// uploaded it explains the options before leaving (ADR 0004, ADR 0009).
Future<void> showSignOutSheet(BuildContext context) {
  return AppDialogs.showSheet<void>(
    context,
    title: context.l10n.authSignOutTitle,
    builder: (_) => BlocProvider(
      create: (_) => getIt<SignOutCubit>()..load(),
      child: const SignOutSheetBody(),
    ),
  );
}

class SignOutSheetBody extends StatelessWidget {
  const SignOutSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutDone) Navigator.of(context).maybePop();
      },
      builder: (context, state) => switch (state) {
        SignOutChecking() ||
        SignOutSyncing() ||
        SignOutSigningOut() ||
        SignOutDone() => _buildBusy(context, state),
        final SignOutConfirm confirm => _buildConfirm(context, confirm),
      },
    );
  }

  Widget _buildBusy(BuildContext context, SignOutState state) {
    final l10n = context.l10n;
    final label = state is SignOutSyncing
        ? l10n.authSignOutSyncing
        : l10n.loading;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: AppSpacing.md),
          Text(label, style: context.textTheme.labelLarge),
        ],
      ),
    );
  }

  Widget _buildConfirm(BuildContext context, SignOutConfirm confirm) {
    final l10n = context.l10n;
    final cubit = context.read<SignOutCubit>();
    final hasPending = confirm.pendingCount > 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (confirm.problem != null) ...[
          AppMessage(
            tone: StatusTone.error,
            title: switch (confirm.problem!) {
              SignOutProblem.syncTimeout => l10n.authSignOutSyncTimeout,
              SignOutProblem.failed => l10n.authSignOutFailed,
            },
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        if (hasPending) ...[
          AppMessage(
            tone: StatusTone.pending,
            icon: Icons.sync_problem_rounded,
            title: l10n.authSignOutUnsyncedTitle,
            detail: l10n.authSignOutUnsyncedBody(confirm.pendingCount),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.authSignOutSync,
            icon: Icons.sync_rounded,
            onPressed: confirm.online ? cubit.syncThenSignOut : null,
          ),
          if (!confirm.online)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xs),
              child: Text(
                l10n.authSignOutOfflineHint,
                style: context.textTheme.bodySmall,
              ),
            ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.authSignOutKeep,
            variant: AppButtonVariant.secondary,
            onPressed: cubit.signOut,
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(
              l10n.authSignOutKeepHint,
              style: context.textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.authSignOutErase(confirm.pendingCount),
            variant: AppButtonVariant.danger,
            onPressed: () => _confirmErase(context, confirm.pendingCount),
          ),
        ] else ...[
          Text(l10n.authSignOutBody, style: context.textTheme.bodyMedium),
          const SizedBox(height: AppSpacing.lg),
          AppButton(label: l10n.authSignOut, onPressed: cubit.signOut),
        ],
        const SizedBox(height: AppSpacing.xs),
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.ghost,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  Future<void> _confirmErase(BuildContext context, int pendingCount) async {
    final cubit = context.read<SignOutCubit>();
    final confirmed = await AppDialogs.confirm(
      context,
      title: context.l10n.authSignOutEraseConfirmTitle,
      message: context.l10n.authSignOutEraseConfirmBody(pendingCount),
      confirmLabel: context.l10n.authSignOutEraseConfirmAction,
      destructive: true,
    );
    if (confirmed) await cubit.signOutAndErase();
  }
}
