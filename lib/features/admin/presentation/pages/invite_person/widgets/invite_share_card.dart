import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_toast.dart';
import '../../../../domain/models/invite_share.dart';
import '../../../admin_format.dart';
import '../../../widgets/section_card.dart';

/// The link, short code and QR of an invite, with copy and share actions.
class InviteShareCard extends StatelessWidget {
  const InviteShareCard({
    super.key,
    required this.invite,
    required this.onShare,
  });

  final InviteShare invite;

  /// Opens the platform share sheet with the localized message.
  final ValueChanged<String> onShare;

  String _message(BuildContext context) => context.l10n.adminInviteShareMessage(
    invite.personName,
    invite.code,
    invite.inviteUrl ?? '',
  );

  Future<void> _copy(BuildContext context, String text, String toast) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (context.mounted) {
      AppToast.show(context, toast, kind: AppToastKind.success);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final url = invite.inviteUrl;
    return SectionCard(
      title: l10n.adminShareInvite,
      child: Wrap(
        spacing: AppSpacing.xl,
        runSpacing: AppSpacing.lg,
        children: [
          Semantics(
            label: l10n.adminInviteQrLabel,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              color: Colors.white,
              child: QrImageView(
                data: url ?? invite.code,
                size: 140,
                backgroundColor: Colors.white,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.adminShortCode.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
                const SizedBox(height: AppSpacing.xs),
                Semantics(
                  label: invite.code.split('').join(' '),
                  child: Text(
                    invite.code,
                    style: context.textTheme.displaySmall!.copyWith(
                      letterSpacing: 8,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                if (url != null) ...[
                  const SizedBox(height: AppSpacing.sm),
                  SelectableText(url, style: context.textTheme.bodySmall),
                ],
                if (invite.expiresAt != null)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: Text(
                      l10n.adminInviteExpires(
                        AdminFormat.date(invite.expiresAt),
                      ),
                      style: context.textTheme.bodySmall,
                    ),
                  ),
                const SizedBox(height: AppSpacing.md),
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    AppButton(
                      label: l10n.actionShare,
                      icon: Icons.share_rounded,
                      size: AppButtonSize.small,
                      fullWidth: false,
                      onPressed: () => onShare(_message(context)),
                    ),
                    if (url != null)
                      AppButton(
                        label: l10n.adminCopyLink,
                        icon: Icons.link_rounded,
                        variant: AppButtonVariant.secondary,
                        size: AppButtonSize.small,
                        fullWidth: false,
                        onPressed: () =>
                            _copy(context, url, l10n.adminLinkCopied),
                      ),
                    AppButton(
                      label: l10n.adminCopyCode,
                      icon: Icons.copy_rounded,
                      variant: AppButtonVariant.secondary,
                      size: AppButtonSize.small,
                      fullWidth: false,
                      onPressed: () =>
                          _copy(context, invite.code, l10n.adminCodeCopied),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
