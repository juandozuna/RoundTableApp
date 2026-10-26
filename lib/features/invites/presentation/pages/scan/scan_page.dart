import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../auth/auth_routes.dart';
import '../../../../auth/presentation/widgets/auth_flow_layout.dart';
import '../../../../auth/presentation/widgets/auth_steps.dart';
import '../../../invites_routes.dart';
import '../../widgets/invite_problem_text.dart';
import '../../widgets/qr_scanner_view.dart';
import 'cubit/scan_cubit.dart';
import 'cubit/scan_state.dart';

/// Step 1/3 by QR. Phones scan with the camera; web and desktop, where
/// cameras are unreliable, paste the link or type the code instead.
class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  /// Camera scanning only on mobile apps (ADR 0015 / flutter-conventions).
  static bool get _usesCamera =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ScanCubit, ScanState>(
      listener: (context, state) {
        if (state is ScanVerified) {
          context.pushReplacement(
            InvitesRoutes.redeemFor(state.preview.code),
            extra: state.preview,
          );
        }
      },
      builder: (context, state) => AuthFlowLayout(
        title: l10n.invitesScanTitle,
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
              l10n.invitesScanHeadline,
              style: context.textTheme.displaySmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              _usesCamera
                  ? l10n.invitesScanSubtitle
                  : l10n.invitesPasteSubtitle,
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colors.muted,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            if (_usesCamera)
              _buildCamera(context, state)
            else
              _buildPaste(context),
            const SizedBox(height: AppSpacing.md),
            _buildStatus(context, state),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: l10n.invitesTypeCode,
              icon: Icons.pin_rounded,
              variant: AppButtonVariant.secondary,
              onPressed: () => context.pushReplacement(InvitesRoutes.redeem),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCamera(BuildContext context, ScanState state) {
    return QrScannerView(
      onScanned: context.read<ScanCubit>().submitText,
      onTypeCode: () => context.pushReplacement(InvitesRoutes.redeem),
    );
  }

  Widget _buildPaste(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppMessage(
          tone: StatusTone.info,
          icon: Icons.desktop_windows_rounded,
          title: l10n.invitesScanWebTitle,
          detail: l10n.invitesScanWebBody,
        ),
        const SizedBox(height: AppSpacing.md),
        AppButton(
          label: l10n.invitesPasteLink,
          icon: Icons.content_paste_rounded,
          onPressed: context.read<ScanCubit>().pasteFromClipboard,
        ),
      ],
    );
  }

  Widget _buildStatus(BuildContext context, ScanState state) {
    final l10n = context.l10n;
    return switch (state) {
      ScanChecking() => Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Text(
            l10n.invitesChecking,
            style: context.textTheme.labelLarge,
          ),
        ),
      ),
      ScanNotInvite() => AppMessage(
        tone: StatusTone.pending,
        icon: Icons.qr_code_2_rounded,
        title: l10n.invitesQrNotInviteTitle,
        detail: l10n.invitesQrNotInviteBody,
        action: TextButton(
          onPressed: context.read<ScanCubit>().resume,
          child: Text(l10n.actionRetry),
        ),
      ),
      ScanFailed(:final problem) => AppMessage(
        tone: StatusTone.error,
        title: problem.message(context),
        action: TextButton(
          onPressed: context.read<ScanCubit>().resume,
          child: Text(l10n.actionRetry),
        ),
      ),
      _ => const SizedBox.shrink(),
    };
  }
}
