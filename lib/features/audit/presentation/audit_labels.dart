import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_x.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../domain/models/audit_category.dart';
import '../domain/models/audit_event.dart';

/// Spanish names for audit events, categories and entities.
abstract final class AuditLabels {
  static String category(AppLocalizations l10n, AuditCategory category) =>
      switch (category) {
        AuditCategory.created => l10n.auditCategoryCreated,
        AuditCategory.removed => l10n.auditCategoryRemoved,
        AuditCategory.reassigned => l10n.auditCategoryReassigned,
        AuditCategory.session => l10n.auditCategorySession,
        AuditCategory.role => l10n.auditCategoryRole,
        AuditCategory.sensitive => l10n.auditCategorySensitive,
        AuditCategory.changed => l10n.auditCategoryChanged,
      };

  static IconData categoryIcon(AuditCategory? category) => switch (category) {
    AuditCategory.created => Icons.add_circle_rounded,
    AuditCategory.removed => Icons.block_rounded,
    AuditCategory.reassigned => Icons.swap_horiz_rounded,
    AuditCategory.session => Icons.event_available_rounded,
    AuditCategory.role => Icons.shield_rounded,
    AuditCategory.sensitive => Icons.visibility_rounded,
    AuditCategory.changed => Icons.edit_rounded,
    null => Icons.circle_outlined,
  };

  /// What happened, e.g. "Mesa creada".
  static String event(AppLocalizations l10n, String eventType) =>
      switch (eventType) {
        'organization.created' => l10n.auditEventOrganizationCreated,
        'organization.updated' => l10n.auditEventOrganizationUpdated,
        'organization.status_changed' => l10n.auditEventOrganizationStatus,
        'location.created' => l10n.auditEventLocationCreated,
        'location.updated' => l10n.auditEventLocationUpdated,
        'table.created' => l10n.auditEventTableCreated,
        'table.updated' => l10n.auditEventTableUpdated,
        'table.facilitator_changed' => l10n.auditEventFacilitatorChanged,
        'member.added' => l10n.auditEventMemberAdded,
        'member.moved' => l10n.auditEventMemberMoved,
        'member.deactivated' => l10n.auditEventMemberDeactivated,
        'invite.created' => l10n.auditEventInviteCreated,
        'invite.revoked' => l10n.auditEventInviteRevoked,
        'invite.renewed' => l10n.auditEventInviteRenewed,
        'invite.accepted' => l10n.auditEventInviteAccepted,
        'person.updated' => l10n.auditEventPersonUpdated,
        'person.deactivated' => l10n.auditEventPersonDeactivated,
        'role.granted' => l10n.auditEventRoleGranted,
        'role.revoked' => l10n.auditEventRoleRevoked,
        'session.opened' => l10n.auditEventSessionOpened,
        'session.closed' => l10n.auditEventSessionClosed,
        'session.cancelled' => l10n.auditEventSessionCancelled,
        'answers.revealed' => l10n.auditEventAnswersRevealed,
        _ => eventType,
      };

  static String entity(AppLocalizations l10n, String? entityType) =>
      switch (entityType) {
        'organization' => l10n.auditEntityOrganization,
        'location' => l10n.auditEntityLocation,
        'round_table' => l10n.auditEntityTable,
        'table_member' => l10n.auditEntityMember,
        'person' => l10n.auditEntityPerson,
        'invite' => l10n.auditEntityInvite,
        'session' => l10n.auditEntitySession,
        'role_assignment' => l10n.auditEntityRole,
        _ => entityType ?? '',
      };

  /// Object line: entity kind plus its name or code when the payload has one.
  static String subject(AppLocalizations l10n, AuditEvent event) {
    final payload = event.payload;
    final name = payload['name'] ?? payload['code'];
    final kind = entity(l10n, event.entityType);
    return name == null ? kind : '$kind $name';
  }

  static String _state(AppLocalizations l10n, String raw) => switch (raw) {
    'scheduled' => l10n.auditStateScheduled,
    'open' => l10n.auditStateOpen,
    'closed' => l10n.auditStateClosed,
    'cancelled' => l10n.auditStateCancelled,
    _ => raw,
  };

  static String _roleKind(AppLocalizations l10n, String raw) => switch (raw) {
    'coordinator' => l10n.roleCoordinator,
    'facilitator' => l10n.roleFacilitator,
    'member' => l10n.roleMember,
    'platform_admin' => l10n.roleAdministrator,
    _ => raw,
  };

  /// Extra detail from the payload, e.g. "abierta ← programada".
  static String detail(AppLocalizations l10n, AuditEvent event) {
    final payload = event.payload;
    final parts = <String>[];
    final from = payload['from'];
    final to = payload['to'];
    if (from != null && to != null) {
      parts.add('${_state(l10n, '$from')} → ${_state(l10n, '$to')}');
    }
    final role = payload['role_kind'];
    if (role != null) parts.add(_roleKind(l10n, '$role'));
    return parts.join(' · ');
  }

  static String matchText(BuildContext context, AuditEvent entry) {
    final l10n = context.l10n;
    return '${entry.actorName ?? ''} ${event(l10n, entry.eventType)} '
        '${subject(l10n, entry)} ${detail(l10n, entry)} '
        '${entry.organizationName ?? ''}';
  }
}
