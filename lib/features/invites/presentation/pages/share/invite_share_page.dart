import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../auth/presentation/widgets/context_switcher.dart';
import '../../../domain/models/invite.dart';
import '../../../domain/models/invite_problem.dart';
import '../../../invites_routes.dart';
import '../../widgets/invite_labels.dart';
import '../../widgets/invite_problem_text.dart';
import '../../widgets/invite_status_pill.dart';
import 'cubit/share_cubit.dart';
import 'cubit/share_state.dart';

/// Share an invite: WhatsApp, link, code and QR.
class InviteSharePage extends StatelessWidget {
  const InviteSharePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<ShareCubit, ShareState>(
      listenWhen: (a, b) => a.feedback != b.feedback && b.feedback != null,
      listener: (context, state) {
        final text = switch (state.feedback!.kind) {
          ShareFeedbackKind.linkCopied => l10n.invitesCopiedLink,
          ShareFeedbackKind.codeCopied => l10n.invitesCopiedCode,
          ShareFeedbackKind.whatsappUnavailable =>
            l10n.invitesWhatsappUnavailable,
        };
        AppToast.show(
          context,
          text,
          kind: state.feedback!.kind == ShareFeedbackKind.whatsappUnavailable
              ? AppToastKind.error
              : AppToastKind.success,
        );
      },
      builder: (context, state) => AppScaffold(
        backFallbackLocation: InvitesRoutes.manager,
        actions: const [ContextSwitcher()],
        maxContentWidth: 1000,
        body: _buildBody(context, state),
      ),
    );
  }

  Widget _buildBody(BuildContext context, ShareState state) {
    final l10n = context.l10n;
    final invite = state.invite;
    if (state.loading) return const SkeletonList(count: 2, itemHeight: 140);
    if (invite == null) {
      return state.missing
          ? EmptyState(
              icon: Icons.mail_outline_rounded,
              title: l10n.invitesShareMissingTitle,
              actionLabel: l10n.invitesViewAll,
              onAction: () => context.go(InvitesRoutes.manager),
            )
          : ErrorState(
              message: (state.problem ?? InviteProblem.generic).message(
                context,
              ),
            );
    }
    final wide = context.layout.isTabletOrWider;
    final qrCard = _buildQrCard(context, invite);
    final actions = _buildActions(context, invite);
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.invitesShareKicker.toUpperCase(),
                    style: context.textStyles.kicker,
                  ),
                  Text(
                    l10n.invitesShareHeadline(invite.person.firstName),
                    style: context.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            InviteStatusPill(status: invite.status),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        if (wide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 5, child: qrCard),
              const SizedBox(width: AppSpacing.xl),
              Expanded(flex: 6, child: actions),
            ],
          )
        else ...[
          qrCard,
          const SizedBox(height: AppSpacing.lg),
          actions,
        ],
      ],
    );
  }

  String _message(BuildContext context, Invite invite) {
    final link = invite.shareLink;
    return context.l10n.invitesShareMessage(
      invite.person.firstName,
      invite.scopeName,
      link ?? invite.code,
      invite.code,
      MaterialLocalizations.of(
        context,
      ).formatMediumDate(invite.expiresAt.toLocal()),
    );
  }

  Widget _buildQrCard(BuildContext context, Invite invite) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        children: [
          _buildQrImage(
            context,
            data: invite.shareLink ?? invite.code,
            size: 168,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.invitesCodeKicker.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.xs),
          _buildCodeCells(context, code: invite.code),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${InviteLabels.role(context, invite.roleKind)} · ${invite.scopeName}',
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
          Text(
            l10n.invitesDetailExpires(
              MaterialLocalizations.of(
                context,
              ).formatMediumDate(invite.expiresAt.toLocal()),
            ),
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildActions(BuildContext context, Invite invite) {
    final l10n = context.l10n;
    final cubit = context.read<ShareCubit>();
    final link = invite.shareLink;
    final message = _message(context, invite);
    final canShare = invite.status.canShare;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            _tile(
              AppButton(
                label: l10n.invitesWhatsapp,
                icon: Icons.chat_rounded,
                variant: AppButtonVariant.secondary,
                onPressed: canShare
                    ? () => cubit.sendWhatsApp(
                        message,
                        phone: invite.person.phone,
                      )
                    : null,
              ),
            ),
            _tile(
              AppButton(
                label: l10n.actionShare,
                icon: Icons.ios_share_rounded,
                variant: AppButtonVariant.secondary,
                onPressed: canShare ? () => cubit.share(message) : null,
              ),
            ),
            if (link != null)
              _tile(
                AppButton(
                  label: l10n.invitesCopyLink,
                  icon: Icons.link_rounded,
                  variant: AppButtonVariant.secondary,
                  onPressed: canShare ? () => cubit.copyLink(link) : null,
                ),
              ),
            _tile(
              AppButton(
                label: l10n.invitesCopyCode,
                icon: Icons.copy_rounded,
                variant: AppButtonVariant.secondary,
                onPressed: canShare ? () => cubit.copyCode(invite.code) : null,
              ),
            ),
            _tile(
              AppButton(
                label: l10n.invitesShowBigQr,
                icon: Icons.qr_code_2_rounded,
                variant: AppButtonVariant.secondary,
                onPressed: canShare ? () => _showBigQr(context, invite) : null,
              ),
            ),
          ],
        ),
        if (link != null) ...[
          const SizedBox(height: AppSpacing.md),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.invitesLinkKicker.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
                const SizedBox(height: AppSpacing.xs),
                SelectableText(link, style: context.textTheme.titleSmall),
              ],
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.lg),
        AppButton(
          label: l10n.invitesInviteAnother,
          icon: Icons.add_rounded,
          onPressed: () => context.pushReplacement(InvitesRoutes.create),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: l10n.invitesViewAll,
          variant: AppButtonVariant.secondary,
          onPressed: () => context.go(InvitesRoutes.manager),
        ),
      ],
    );
  }

  Widget _tile(Widget child) => SizedBox(width: 220, child: child);

  Future<void> _showBigQr(BuildContext context, Invite invite) {
    final l10n = context.l10n;
    return AppDialogs.showSheet<void>(
      context,
      title: l10n.invitesBigQrTitle(invite.person.firstName),
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildQrImage(
            context,
            data: invite.shareLink ?? invite.code,
            size: 260,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            l10n.invitesBigQrHint,
            textAlign: TextAlign.center,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildQrImage(
    BuildContext context, {
    required String data,
    required double size,
  }) {
    return Semantics(
      image: true,
      label: context.l10n.invitesQrSemantics,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm + 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadii.md),
        ),
        child: QrImageView(
          data: data,
          size: size,
          backgroundColor: Colors.white,
          eyeStyle: const QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: Color(0xFF111111),
          ),
          dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: Color(0xFF111111),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeCells(BuildContext context, {required String code}) {
    final colors = context.colors;
    return Semantics(
      label: code.split('').join(' '),
      excludeSemantics: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final char in code.split(''))
            Container(
              width: 40,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.surfaceAlt,
                borderRadius: BorderRadius.circular(AppRadii.sm),
                border: Border.all(color: colors.border, width: 2),
              ),
              child: Text(char, style: context.textStyles.numberLarge),
            ),
        ],
      ),
    );
  }
}
