import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/network/api_exception.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../auth_routes.dart';
import '../../../domain/models/access_state.dart';
import '../../cubit/access_cubit.dart';
import '../../cubit/access_cubit_state.dart';
import '../../widgets/auth_flow_layout.dart';
import '../../widgets/auth_result_view.dart';
import '../sign_out/sign_out_sheet.dart';

/// Where a signed-in identity waits while its account loads, and where it
/// lands when it cannot enter yet: no role, deactivated, never invited,
/// or the account could not be loaded (offline first sign-in).
class AccessPage extends StatelessWidget {
  const AccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccessCubit, AccessCubitState>(
      builder: (context, state) => AuthFlowLayout(
        child: switch (state.access.status) {
          AccessStatus.noRole => _buildNoRole(context),
          AccessStatus.deactivated => _buildDeactivated(context, state),
          AccessStatus.unknownAccount => _buildUnknown(context),
          AccessStatus.failed => _buildFailed(context, state),
          _ => _buildResolving(context),
        },
      ),
    );
  }

  Widget _buildResolving(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxxl),
      child: Column(
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: AppSpacing.lg),
          Text(
            context.l10n.authAccessResolving,
            style: context.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildFailed(BuildContext context, AccessCubitState state) {
    final l10n = context.l10n;
    final offline =
        state.access.failure?.kind == ApiErrorKind.network ||
        state.access.failure?.kind == ApiErrorKind.timeout;
    return AuthResultView(
      tone: offline ? StatusTone.offline : StatusTone.error,
      icon: offline ? Icons.cloud_off_rounded : Icons.error_outline_rounded,
      title: offline ? l10n.authAccessOfflineTitle : l10n.authAccessFailedTitle,
      body: offline ? l10n.authAccessOfflineBody : l10n.errorServer,
      actions: [
        AppButton(
          label: l10n.actionRetry,
          icon: Icons.refresh_rounded,
          loading: state.refreshing,
          onPressed: context.read<AccessCubit>().refresh,
        ),
        _signOutButton(context),
      ],
    );
  }

  Widget _buildNoRole(BuildContext context) {
    final l10n = context.l10n;
    return AuthResultView(
      tone: StatusTone.info,
      icon: Icons.person_outline_rounded,
      title: l10n.authNoRoleTitle,
      body: l10n.authNoRoleBody,
      actions: [
        AppButton(
          label: l10n.authHaveInviteCode,
          onPressed: () => context.go(AuthRoutes.inviteCode),
        ),
        _refreshButton(context),
        _signOutButton(context),
      ],
    );
  }

  Widget _buildDeactivated(BuildContext context, AccessCubitState state) {
    final l10n = context.l10n;
    return AuthResultView(
      tone: StatusTone.error,
      icon: Icons.lock_outline_rounded,
      title: l10n.authDeactivatedTitle,
      body: l10n.authDeactivatedBody,
      actions: [_refreshButton(context), _signOutButton(context)],
    );
  }

  Widget _buildUnknown(BuildContext context) {
    final l10n = context.l10n;
    return AuthResultView(
      tone: StatusTone.pending,
      icon: Icons.mail_outline_rounded,
      title: l10n.authUnknownTitle,
      body: l10n.authUnknownBody,
      actions: [
        AppButton(
          label: l10n.authHaveInviteCode,
          onPressed: () => context.go(AuthRoutes.inviteCode),
        ),
        AppButton(
          label: l10n.authScanQr,
          variant: AppButtonVariant.secondary,
          onPressed: () => context.go(AuthRoutes.inviteScan),
        ),
        _signOutButton(context),
      ],
    );
  }

  Widget _refreshButton(BuildContext context) {
    return AppButton(
      label: context.l10n.authRefresh,
      icon: Icons.refresh_rounded,
      variant: AppButtonVariant.secondary,
      loading: context.watch<AccessCubit>().state.refreshing,
      onPressed: context.read<AccessCubit>().refresh,
    );
  }

  Widget _signOutButton(BuildContext context) {
    return AppButton(
      label: context.l10n.authSignOut,
      icon: Icons.logout_rounded,
      variant: AppButtonVariant.ghost,
      onPressed: () => showSignOutSheet(context),
    );
  }
}
