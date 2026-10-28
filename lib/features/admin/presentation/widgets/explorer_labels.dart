import 'package:flutter/widgets.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/models/health_status.dart';
import '../../domain/explorer/explorer_engine.dart';
import '../../domain/models/explorer_query.dart';
import '../../domain/models/organization_status.dart';
import '../../domain/models/person_status.dart';
import 'admin_status_pills.dart';

/// Localized names of Explorador concepts (views, filters, people kinds).
abstract final class ExplorerLabels {
  static String entity(BuildContext context, ExplorerEntity entity) =>
      switch (entity) {
        ExplorerEntity.tables => context.l10n.adminEntityTables,
        ExplorerEntity.organizations => context.l10n.adminEntityOrganizations,
        ExplorerEntity.people => context.l10n.adminEntityPeople,
      };

  static String view(BuildContext context, ExplorerView view) {
    final l10n = context.l10n;
    return switch (view) {
      ExplorerView.all => l10n.adminViewAll,
      ExplorerView.delayed => l10n.adminViewDelayed,
      ExplorerView.lowAttendance => l10n.adminViewLowAttendance,
      ExplorerView.fewPeople => l10n.adminViewFewPeople,
      ExplorerView.syncedLate => l10n.adminViewSyncedLate,
      ExplorerView.paused => l10n.adminViewPaused,
      ExplorerView.withoutTables => l10n.adminViewWithoutTables,
      ExplorerView.withoutCoordinator => l10n.adminViewWithoutCoordinator,
      ExplorerView.coordinators => l10n.adminViewCoordinators,
      ExplorerView.facilitators => l10n.adminViewFacilitators,
      ExplorerView.members => l10n.adminViewMembers,
      ExplorerView.pendingInvites => l10n.adminViewPendingInvites,
      ExplorerView.inactive => l10n.adminViewInactive,
    };
  }

  static String filter(BuildContext context, String key) {
    final l10n = context.l10n;
    return switch (key) {
      ExplorerFilterKeys.country => l10n.adminFilterCountry,
      ExplorerFilterKeys.organization => l10n.adminFilterOrganization,
      ExplorerFilterKeys.location => l10n.adminFilterLocation,
      ExplorerFilterKeys.facilitator => l10n.adminFilterFacilitator,
      ExplorerFilterKeys.role => l10n.adminFilterRole,
      _ => l10n.adminFilterStatus,
    };
  }

  /// Label of a filter value; ids of countries, organizations, locations and
  /// facilitators are resolved by the caller from [ExplorerFilterOption]s.
  static String statusValue(
    BuildContext context,
    ExplorerEntity entity,
    String value,
  ) {
    final l10n = context.l10n;
    switch (entity) {
      case ExplorerEntity.tables:
        return switch (HealthStatus.tryParse(value)) {
          HealthStatus.active => l10n.adminHealthActive,
          HealthStatus.delayed => l10n.adminHealthDelayed,
          HealthStatus.inactive => l10n.adminHealthInactive,
          HealthStatus.completed => l10n.adminHealthCompleted,
          null => value,
        };
      case ExplorerEntity.organizations:
        final status = OrganizationStatus.tryParse(value);
        return status == null
            ? value
            : OrganizationStatusPill.labelFor(context, status);
      case ExplorerEntity.people:
        final status = PersonStatus.tryParse(value);
        return status == null
            ? value
            : PersonStatusPill.labelFor(context, status);
    }
  }

  static String personKind(BuildContext context, PersonKind kind) {
    final l10n = context.l10n;
    return switch (kind) {
      PersonKind.administrator => l10n.roleAdministrator,
      PersonKind.coordinator => l10n.roleCoordinator,
      PersonKind.facilitator => l10n.roleFacilitator,
      PersonKind.member => l10n.roleMember,
      PersonKind.unassigned => l10n.adminPersonKindUnassigned,
    };
  }

  static String organizationKind(BuildContext context, String kind) {
    final l10n = context.l10n;
    return switch (kind) {
      'foundation' => l10n.adminOrgKindFoundation,
      'school' => l10n.adminOrgKindSchool,
      'company' => l10n.adminOrgKindCompany,
      'church' => l10n.adminOrgKindChurch,
      'community' => l10n.adminOrgKindCommunity,
      _ => l10n.adminOrgKindOther,
    };
  }

  static const List<String> organizationKinds = [
    'foundation',
    'school',
    'company',
    'church',
    'community',
    'other',
  ];

  /// Label of a filter option value for [key].
  static String optionLabel(
    BuildContext context,
    ExplorerEntity entity,
    String key,
    ExplorerFilterOption option,
  ) {
    return switch (key) {
      ExplorerFilterKeys.status => statusValue(context, entity, option.value),
      ExplorerFilterKeys.role => personKind(
        context,
        PersonKind.values.firstWhere(
          (k) => k.name == option.value,
          orElse: () => PersonKind.unassigned,
        ),
      ),
      _ => option.label,
    };
  }
}
