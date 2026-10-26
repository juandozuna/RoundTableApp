import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../audit/audit_routes.dart';
import '../../../../audit/presentation/audit_labels.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/admin_person.dart';
import '../../../domain/models/organization_detail.dart';
import '../../../domain/models/organization_status.dart';
import '../../../domain/models/person_status.dart';
import '../../admin_error_messages.dart';
import '../../admin_format.dart';
import '../../cubit/admin_access_state.dart';
import '../../widgets/admin_denied_view.dart';
import '../../widgets/admin_page_frame.dart';
import '../../widgets/admin_status_pills.dart';
import '../../widgets/confirm_by_typing_dialog.dart';
import '../../widgets/explorer_labels.dart';
import '../../widgets/kpi_tile.dart';
import '../../widgets/section_card.dart';
import 'cubit/organization_detail_cubit.dart';
import 'cubit/organization_detail_state.dart';

/// One organization: coordinators, locations, tables, contact and activity.
class OrganizationDetailPage extends StatelessWidget {
  const OrganizationDetailPage({super.key, required this.organizationId});

  final String organizationId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrganizationDetailCubit>();
    return AdminPageFrame(
      title: context.l10n.adminOrganizationTitle,
      backFallbackLocation: AdminRoutes.explorer,
      maxContentWidth: 1180,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      builder: (context, access) {
        final scope = access.scope!;
        if (!scope.canAccessOrganization(organizationId)) {
          return _buildDenied(context, scope.organizationId);
        }
        return BlocConsumer<OrganizationDetailCubit, OrganizationDetailState>(
          listenWhen: (a, b) =>
              (b.changedTo != null && a.changedTo != b.changedTo) ||
              (b.actionError != null && a.actionError != b.actionError),
          listener: _onNotice,
          builder: (context, state) => _buildState(context, state, access),
        );
      },
    );
  }

  /// Opens a form and reloads the page when it closes.
  Future<void> _push(BuildContext context, String location) async {
    final cubit = context.read<OrganizationDetailCubit>();
    await context.push(location);
    await cubit.refresh();
  }

  Widget _buildDenied(BuildContext context, String? ownOrganizationId) {
    final l10n = context.l10n;
    return AdminDeniedView(
      title: l10n.adminDeniedOrganizationTitle,
      message: l10n.adminDeniedOrganizationMessage,
      homeLocation: ownOrganizationId == null
          ? AdminRoutes.explorer
          : AdminRoutes.organizationPath(ownOrganizationId),
      actionLabel: l10n.adminGoToMyOrganization,
    );
  }

  void _onNotice(BuildContext context, OrganizationDetailState state) {
    final l10n = context.l10n;
    final error = state.actionError;
    if (error != null) {
      AppToast.show(
        context,
        error.adminMessage(l10n),
        kind: AppToastKind.error,
      );
      return;
    }
    final name = state.detail?.organization.name ?? '';
    final message = switch (state.changedTo) {
      OrganizationStatus.paused => l10n.adminToastOrganizationPaused(name),
      OrganizationStatus.active => l10n.adminToastOrganizationResumed(name),
      OrganizationStatus.inactive => l10n.adminToastOrganizationDeactivated(
        name,
      ),
      null => null,
    };
    if (message != null) {
      AppToast.show(context, message, kind: AppToastKind.success);
    }
  }

  Widget _buildState(
    BuildContext context,
    OrganizationDetailState state,
    AdminAccessState access,
  ) {
    final detail = state.detail;
    switch (state.status) {
      case OrganizationDetailStatus.loading:
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: const [SkeletonList(count: 5, itemHeight: 96)],
        );
      case OrganizationDetailStatus.failure:
        final error = state.error;
        if (error != null && error.kind.name == 'notFound') {
          return _buildDenied(context, access.scope?.organizationId);
        }
        return ErrorState(
          message: error?.adminMessage(context.l10n),
          onRetry: () =>
              context.read<OrganizationDetailCubit>().load(organizationId),
        );
      case OrganizationDetailStatus.ready:
        return _buildDetail(context, detail!, state, access);
    }
  }

  Widget _buildDetail(
    BuildContext context,
    OrganizationDetail detail,
    OrganizationDetailState state,
    AdminAccessState access,
  ) {
    final org = detail.organization;
    final isAdmin = access.scope!.isAdministrator;
    final canWrite = access.online && org.status == OrganizationStatus.active;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        _buildHeader(context, detail, state, isAdmin, access.online),
        const SizedBox(height: AppSpacing.md),
        _buildStatusBanner(context, org.status),
        if (detail.tables.isNotEmpty) ...[
          _buildKpis(context, detail),
          const SizedBox(height: AppSpacing.md),
        ],
        LayoutBuilder(
          builder: (context, constraints) {
            final coordination = _buildCoordination(
              context,
              detail,
              isAdmin,
              access.online,
            );
            final locations = _buildLocations(context, detail, canWrite);
            if (constraints.maxWidth < 760) {
              return Column(children: [coordination, locations]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: coordination),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: locations),
              ],
            );
          },
        ),
        _buildTables(context, detail, canWrite),
        LayoutBuilder(
          builder: (context, constraints) {
            final contact = _buildContact(context, detail);
            final activity = _buildActivity(context, detail);
            if (constraints.maxWidth < 760) {
              return Column(children: [contact, activity]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: contact),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: activity),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context,
    OrganizationDetail detail,
    OrganizationDetailState state,
    bool isAdmin,
    bool online,
  ) {
    final l10n = context.l10n;
    final org = detail.organization;
    final cubit = context.read<OrganizationDetailCubit>();
    final enabled = online && !state.working;
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AppAvatar(name: org.name, size: 52),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${ExplorerLabels.organizationKind(context, org.kind)} · ${org.countryName}${org.region == null ? '' : ' · ${org.region}'}'
                  .toUpperCase(),
              style: context.textStyles.kicker,
            ),
            Text(org.name, style: context.textTheme.headlineMedium),
          ],
        ),
        OrganizationStatusPill(status: org.status),
        if (isAdmin) ...[
          AppButton(
            label: l10n.actionEdit,
            icon: Icons.edit_rounded,
            variant: AppButtonVariant.secondary,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: enabled
                ? () => _push(context, AdminRoutes.organizationEditPath(org.id))
                : null,
          ),
          if (org.status == OrganizationStatus.active)
            AppButton(
              label: l10n.adminPause,
              icon: Icons.pause_circle_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: enabled
                  ? () => _pause(context, cubit, org.name)
                  : null,
            ),
          if (org.status == OrganizationStatus.paused)
            AppButton(
              label: l10n.adminResume,
              icon: Icons.play_circle_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: enabled
                  ? () => _resume(context, cubit, org.name)
                  : null,
            ),
          if (org.status != OrganizationStatus.inactive)
            AppButton(
              label: l10n.adminDeactivate,
              icon: Icons.block_rounded,
              variant: AppButtonVariant.danger,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: enabled
                  ? () => _deactivate(context, cubit, org.name)
                  : null,
            ),
        ],
      ],
    );
  }

  Future<void> _pause(
    BuildContext context,
    OrganizationDetailCubit cubit,
    String name,
  ) async {
    final l10n = context.l10n;
    final ok = await AppDialogs.confirm(
      context,
      title: l10n.adminPauseTitle(name),
      message: l10n.adminPauseMessage,
      confirmLabel: l10n.adminPauseConfirm,
    );
    if (ok) await cubit.changeStatus(OrganizationStatus.paused);
  }

  Future<void> _resume(
    BuildContext context,
    OrganizationDetailCubit cubit,
    String name,
  ) async {
    final l10n = context.l10n;
    final ok = await AppDialogs.confirm(
      context,
      title: l10n.adminResumeTitle(name),
      message: l10n.adminResumeMessage,
      confirmLabel: l10n.adminResume,
    );
    if (ok) await cubit.changeStatus(OrganizationStatus.active);
  }

  Future<void> _deactivate(
    BuildContext context,
    OrganizationDetailCubit cubit,
    String name,
  ) async {
    final l10n = context.l10n;
    final ok = await ConfirmByTypingDialog.show(
      context,
      name: name,
      title: l10n.adminDeactivateTitle(name),
      warningTitle: l10n.adminDeactivateWarningTitle,
      warningDetail: l10n.adminDeactivateWarningDetail,
      confirmLabel: l10n.adminDeactivateConfirm,
    );
    if (ok) await cubit.changeStatus(OrganizationStatus.inactive);
  }

  Widget _buildStatusBanner(BuildContext context, OrganizationStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      OrganizationStatus.paused => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.md),
        child: AppMessage(
          tone: StatusTone.pending,
          title: l10n.adminOrgPausedBannerTitle,
          detail: l10n.adminOrgPausedBannerDetail,
          icon: Icons.pause_circle_rounded,
        ),
      ),
      OrganizationStatus.inactive => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.md),
        child: AppMessage(
          tone: StatusTone.error,
          title: l10n.adminOrgInactiveBannerTitle,
          detail: l10n.adminOrgInactiveBannerDetail,
          icon: Icons.block_rounded,
        ),
      ),
      OrganizationStatus.active => const SizedBox.shrink(),
    };
  }

  Widget _buildKpis(BuildContext context, OrganizationDetail detail) {
    final l10n = context.l10n;
    final rollup = detail.rollup;
    final people = detail.tables.fold<int>(0, (sum, t) => sum + t.activePeople);
    final tiles = [
      KpiTile(
        label: l10n.adminColTables,
        value: '${rollup?.tablesTotal ?? detail.tables.length}',
        detail: l10n.adminTablesStatusBreakdown(
          rollup?.tablesActive ?? 0,
          rollup?.tablesDelayed ?? 0,
          rollup?.tablesInactive ?? 0,
        ),
      ),
      KpiTile(
        label: l10n.kpiValuesCompleted,
        value: '${rollup?.valuesCompleted ?? 0}',
      ),
      KpiTile(
        label: l10n.kpiEstimatedImprovement,
        value: AdminFormat.improvement(rollup?.improvementAvg),
        unit: l10n.kpiPointsUnit,
      ),
      KpiTile(
        label: l10n.kpiAttendance,
        value: AdminFormat.percent(rollup?.attendancePct),
        detail: l10n.adminPeopleCount(people),
      ),
      KpiTile(
        label: l10n.kpiSyncedLate,
        value: '${rollup?.syncedLateRows ?? 0}',
      ),
    ];
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [for (final tile in tiles) SizedBox(width: 200, child: tile)],
    );
  }

  Widget _buildCoordination(
    BuildContext context,
    OrganizationDetail detail,
    bool isAdmin,
    bool online,
  ) {
    final l10n = context.l10n;
    final coordinators = detail.people
        .where((p) => p.isCoordinator && p.status != PersonStatus.inactive)
        .toList();
    final org = detail.organization;
    return SectionCard(
      title: l10n.adminCoordination,
      trailing: isAdmin
          ? AppButton(
              label: l10n.adminInviteCoordinator,
              icon: Icons.person_add_alt_1_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: online && org.status != OrganizationStatus.inactive
                  ? () => _push(
                      context,
                      AdminRoutes.invitePath(
                        role: 'coordinator',
                        organizationId: org.id,
                      ),
                    )
                  : null,
            )
          : null,
      child: coordinators.isEmpty
          ? AppMessage(
              tone: StatusTone.pending,
              title: l10n.adminNoCoordinatorTitle,
              detail: l10n.adminNoCoordinatorDetail,
              icon: Icons.warning_amber_rounded,
            )
          : Column(
              children: [
                for (final person in coordinators)
                  _buildPersonRow(context, person),
              ],
            ),
    );
  }

  Widget _buildPersonRow(BuildContext context, AdminPerson person) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppAvatar(name: person.fullName, size: 40),
      title: Text(person.fullName),
      subtitle: Text(person.email ?? AdminFormat.missing),
      trailing: PersonStatusPill(status: person.status),
      onTap: () => context.push(AdminRoutes.personPath(person.id)),
    );
  }

  Widget _buildLocations(
    BuildContext context,
    OrganizationDetail detail,
    bool canWrite,
  ) {
    final l10n = context.l10n;
    final org = detail.organization;
    return SectionCard(
      title: l10n.adminLocations,
      trailing: AppButton(
        label: l10n.adminNewLocation,
        icon: Icons.add_rounded,
        variant: AppButtonVariant.secondary,
        size: AppButtonSize.small,
        fullWidth: false,
        onPressed: canWrite
            ? () => _push(context, AdminRoutes.locationNewPath(org.id))
            : null,
      ),
      child: detail.locations.isEmpty
          ? Text(l10n.adminNoLocations)
          : Column(
              children: [
                for (final location in detail.locations)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.place_rounded),
                    title: Text(location.name),
                    subtitle: Text(
                      l10n.adminTablesCount(
                        detail.tables
                            .where((t) => t.locationId == location.id)
                            .length,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                    onTap: () => _push(
                      context,
                      AdminRoutes.locationEditPath(org.id, location.id),
                    ),
                  ),
              ],
            ),
    );
  }

  Widget _buildTables(
    BuildContext context,
    OrganizationDetail detail,
    bool canWrite,
  ) {
    final l10n = context.l10n;
    final org = detail.organization;
    final hasCoordinator = detail.people.any(
      (p) => p.isCoordinator && p.status == PersonStatus.active,
    );
    return SectionCard(
      title: l10n.adminEntityTables,
      trailing: AppButton(
        label: l10n.adminCreateTable,
        icon: Icons.add_rounded,
        size: AppButtonSize.small,
        fullWidth: false,
        onPressed: canWrite
            ? () => _push(
                context,
                AdminRoutes.tableNewPath(organizationId: org.id),
              )
            : null,
      ),
      child: detail.tables.isEmpty
          ? EmptyState(
              icon: Icons.table_restaurant_rounded,
              title: l10n.adminOrgNoTablesTitle,
              message: hasCoordinator
                  ? l10n.adminOrgNoTablesMessage
                  : l10n.adminOrgNoTablesNeedsCoordinator,
              actionLabel: hasCoordinator
                  ? l10n.adminCreateFirstTable
                  : l10n.adminInviteFirstCoordinator,
              onAction: !canWrite
                  ? null
                  : () => hasCoordinator
                        ? _push(
                            context,
                            AdminRoutes.tableNewPath(organizationId: org.id),
                          )
                        : _push(
                            context,
                            AdminRoutes.invitePath(
                              role: 'coordinator',
                              organizationId: org.id,
                            ),
                          ),
            )
          : Column(
              children: [
                for (final table in detail.tables)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('${table.code} · ${table.name}'),
                    subtitle: Text(
                      '${table.locationName ?? AdminFormat.missing} · '
                      '${AdminFormat.schedule(l10n, table.weekday, table.startTimeShort)} · '
                      '${table.facilitatorName ?? l10n.adminNoFacilitator}',
                    ),
                    trailing: TableStatusPill(status: table.status),
                    onTap: () => context.push(AdminRoutes.tablePath(table.id)),
                  ),
              ],
            ),
    );
  }

  Widget _buildContact(BuildContext context, OrganizationDetail detail) {
    final l10n = context.l10n;
    final org = detail.organization;
    Widget row(String label, String? value) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label.toUpperCase(), style: context.textStyles.kicker),
          ),
          Expanded(child: Text(value ?? AdminFormat.missing)),
        ],
      ),
    );
    return SectionCard(
      title: l10n.adminMainData,
      child: Column(
        children: [
          row(l10n.adminFieldContactName, org.contactName),
          row(l10n.adminFieldEmail, org.contactEmail),
          row(l10n.adminFieldPhone, org.contactPhone),
          row(l10n.adminColCountry, org.countryName),
          row(l10n.adminFieldRegion, org.region),
        ],
      ),
    );
  }

  Widget _buildActivity(BuildContext context, OrganizationDetail detail) {
    final l10n = context.l10n;
    return SectionCard(
      title: l10n.adminRecentActivity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (detail.recentActivity.isEmpty)
            Text(l10n.adminNoActivity)
          else
            for (final event in detail.recentActivity)
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(AuditLabels.event(l10n, event.eventType)),
                subtitle: Text(
                  '${event.actorName ?? AdminFormat.missing} · ${AdminFormat.dateTime(event.createdAt)}',
                ),
              ),
          TextButton(
            onPressed: () => context.go(
              AuditRoutes.auditPath(organizationId: detail.organization.id),
            ),
            child: Text(l10n.adminSeeInAudit),
          ),
        ],
      ),
    );
  }
}
