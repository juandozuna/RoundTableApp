import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/status_tone.dart';
import '../../domain/models/invite_role_kind.dart';
import '../../domain/models/invite_status.dart';

/// Localized names, tones and icons of invite roles and statuses.
abstract final class InviteLabels {
  static String role(BuildContext context, InviteRoleKind kind) {
    final l10n = context.l10n;
    return switch (kind) {
      InviteRoleKind.coordinator => l10n.roleCoordinator,
      InviteRoleKind.facilitator => l10n.roleFacilitator,
      InviteRoleKind.member => l10n.roleMember,
    };
  }

  static String roleDescription(BuildContext context, InviteRoleKind kind) {
    final l10n = context.l10n;
    return switch (kind) {
      InviteRoleKind.coordinator => l10n.invitesRoleCoordinatorDesc,
      InviteRoleKind.facilitator => l10n.invitesRoleFacilitatorDesc,
      InviteRoleKind.member => l10n.invitesRoleMemberDesc,
    };
  }

  static String status(BuildContext context, InviteStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      InviteStatus.pending => l10n.invitesStatusPending,
      InviteStatus.accepted => l10n.invitesStatusAccepted,
      InviteStatus.expired => l10n.invitesStatusExpired,
      InviteStatus.revoked => l10n.invitesStatusRevoked,
    };
  }

  /// pendiente dotted, aceptada solid, vencida dashed, revocada double
  /// (ADR 0015); never colour alone.
  static StatusTone tone(InviteStatus status) => switch (status) {
    InviteStatus.pending => StatusTone.pending,
    InviteStatus.accepted => StatusTone.ok,
    InviteStatus.expired => StatusTone.offline,
    InviteStatus.revoked => StatusTone.error,
  };

  static IconData statusIcon(InviteStatus status) => switch (status) {
    InviteStatus.pending => Icons.schedule_rounded,
    InviteStatus.accepted => Icons.check_circle_rounded,
    InviteStatus.expired => Icons.warning_amber_rounded,
    InviteStatus.revoked => Icons.block_rounded,
  };
}
