import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/models/health_status.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/seat_pips.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../kpis/kpis_routes.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/admin_person.dart';
import '../../../domain/models/membership_role.dart';
import '../../../domain/models/person_status.dart';
import '../../../domain/models/round_table_status.dart';
import '../../../domain/models/table_detail.dart';
import '../../../domain/models/table_membership.dart';
import '../../admin_error_messages.dart';
import '../../admin_format.dart';
import '../../cubit/admin_access_state.dart';
import '../../widgets/admin_denied_view.dart';
import '../../widgets/admin_page_frame.dart';
import '../../widgets/admin_status_pills.dart';
import '../../widgets/kpi_tile.dart';
import '../../widgets/section_card.dart';
import 'cubit/table_detail_cubit.dart';
import 'cubit/table_detail_state.dart';
import 'widgets/add_existing_member_dialog.dart';
import 'widgets/change_facilitator_dialog.dart';
import 'widgets/move_member_dialog.dart';

/// One table: schedule, facilitator with history, members and their KPIs.
class TableDetailPage extends StatelessWidget {
  const TableDetailPage({super.key, required this.tableId});

  final String tableId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TableDetailCubit>();
    return AdminPageFrame(
      title: context.l10n.adminTableTitle,
      backFallbackLocation: AdminRoutes.explorer,
      maxContentWidth: 1180,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      builder: (context, access) =>
          BlocConsumer<TableDetailCubit, TableDetailState>(
            listenWhen: (a, b) =>
                (b.notice != null && a.notice != b.notice) ||
                (b.actionError != null && a.actionError != b.actionError),
            listener: _onNotice,
            builder: (context, state) => _buildState(context, state, access),
          ),
    );
  }

  void _onNotice(BuildContext context, TableDetailState state) {
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
    final name = state.noticeName ?? '';
    final message = switch (state.notice) {
      TableNotice.facilitatorChanged => l10n.adminToastFacilitatorChanged,
      TableNotice.memberAdded => l10n.adminToastMemberAdded(name),
      TableNotice.memberMoved => l10n.adminToastMemberMoved(name),
      TableNotice.memberDeactivated => l10n.adminToastMemberDeactivated(name),
      null => null,
    };
    if (message != null) {
      AppToast.show(context, message, kind: AppToastKind.success);
    }
  }

  Widget _buildState(
    BuildContext context,
    TableDetailState state,
    AdminAccessState access,
  ) {
    final l10n = context.l10n;
    switch (state.status) {
      case TableDetailStatus.loading:
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: const [SkeletonList(count: 5, itemHeight: 96)],
        );
      case TableDetailStatus.failure:
        final denied =
            state.error?.kind.name == 'notFound' ||
            state.error?.kind.name == 'forbidden';
        if (denied) {
          return AdminDeniedView(
            title: l10n.adminDeniedTableTitle,
            message: l10n.adminDeniedTableMessage,
            homeLocation: AdminRoutes.explorer,
          );
        }
        return ErrorState(
          message: state.error?.adminMessage(l10n),
          onRetry: () => context.read<TableDetailCubit>().load(tableId),
        );
      case TableDetailStatus.ready:
        return _buildDetail(context, state, access);
    }
  }

  Widget _buildDetail(
    BuildContext context,
    TableDetailState state,
    AdminAccessState access,
  ) {
    final detail = state.detail!;
    final table = detail.table;
    final writable =
        access.online &&
        !state.working &&
        table.status != RoundTableStatus.closed;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        _buildHeader(context, detail, writable),
        const SizedBox(height: AppSpacing.md),
        ..._buildAlerts(context, detail),
        _buildKpis(context, detail),
        LayoutBuilder(
          builder: (context, constraints) {
            final schedule = _buildSchedule(context, detail);
            final facilitator = _buildFacilitator(context, detail, writable);
            if (constraints.maxWidth < 760) {
              return Column(children: [schedule, facilitator]);
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: schedule),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: facilitator),
              ],
            );
          },
        ),
        _buildMembers(context, detail, writable),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, TableDetail detail, bool writable) {
    final l10n = context.l10n;
    final table = detail.table;
    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${table.organizationName} · ${table.locationName ?? AdminFormat.missing}'
                  .toUpperCase(),
              style: context.textStyles.kicker,
            ),
            Text(
              '${table.code} · ${table.name}',
              style: context.textTheme.headlineMedium,
            ),
          ],
        ),
        detail.kpi != null
            ? HealthPill(health: detail.kpi!.health)
            : TableStatusPill(status: table.status),
        AppButton(
          label: l10n.adminEditSchedule,
          icon: Icons.edit_rounded,
          variant: AppButtonVariant.secondary,
          size: AppButtonSize.small,
          fullWidth: false,
          onPressed: writable
              ? () => _push(context, AdminRoutes.tableEditPath(table.id))
              : null,
        ),
        _buildAddMemberMenu(context, detail, writable),
      ],
    );
  }

  Widget _buildAddMemberMenu(
    BuildContext context,
    TableDetail detail,
    bool writable,
  ) {
    final l10n = context.l10n;
    final table = detail.table;
    final canAdd = writable && !table.isFull;
    return MenuAnchor(
      menuChildren: [
        MenuItemButton(
          leadingIcon: const Icon(Icons.person_add_alt_1_rounded),
          onPressed: canAdd
              ? () => _push(
                  context,
                  AdminRoutes.invitePath(
                    role: 'member',
                    organizationId: table.organizationId,
                    tableId: table.id,
                  ),
                )
              : null,
          child: Text(l10n.adminInviteNewPerson),
        ),
        MenuItemButton(
          leadingIcon: const Icon(Icons.group_add_rounded),
          onPressed: canAdd ? () => _addExisting(context, detail) : null,
          child: Text(l10n.adminAddExistingMember),
        ),
      ],
      builder: (context, controller, _) => AppButton(
        label: l10n.adminAddMember,
        icon: Icons.person_add_alt_1_rounded,
        size: AppButtonSize.small,
        fullWidth: false,
        onPressed: writable
            ? () {
                if (table.isFull) {
                  AppToast.show(
                    context,
                    l10n.adminErrorTableFull,
                    kind: AppToastKind.error,
                  );
                } else {
                  controller.isOpen ? controller.close() : controller.open();
                }
              }
            : null,
      ),
    );
  }

  Future<void> _push(BuildContext context, String location) async {
    final cubit = context.read<TableDetailCubit>();
    await context.push(location);
    await cubit.refresh();
  }

  Future<void> _addExisting(BuildContext context, TableDetail detail) async {
    final cubit = context.read<TableDetailCubit>();
    final inTable = detail.activeMembers.map((m) => m.personId).toSet();
    final candidates = detail.organizationPeople
        .where(
          (p) =>
              !inTable.contains(p.id) &&
              !p.isStaff &&
              p.status != PersonStatus.inactive &&
              !p.isCoordinator &&
              p.tables.isEmpty,
        )
        .toList();
    final person = await AddExistingMemberDialog.show(context, candidates);
    if (person != null) {
      await cubit.addExistingMember(
        personId: person.id,
        personName: person.fullName,
      );
    }
  }

  List<Widget> _buildAlerts(BuildContext context, TableDetail detail) {
    final l10n = context.l10n;
    final table = detail.table;
    final alerts = <Widget>[
      if (!table.hasFacilitator)
        AppMessage(
          tone: StatusTone.error,
          title: l10n.adminTableWithoutFacilitator,
          detail: l10n.adminTableWithoutFacilitatorDetail,
          icon: Icons.warning_amber_rounded,
        ),
      if (detail.kpi?.health == HealthStatus.delayed)
        AppMessage(
          tone: StatusTone.late,
          title: l10n.adminTableDelayedTitle,
          detail: l10n.adminTableDelayedDetail(
            AdminFormat.date(detail.kpi!.lastSessionAt),
          ),
          icon: Icons.schedule_rounded,
        ),
      if (table.activePeople < 3)
        AppMessage(
          tone: StatusTone.pending,
          title: l10n.adminTableNeedsPeople(3 - table.activePeople),
          detail: l10n.adminTableNeedsPeopleDetail,
          icon: Icons.groups_rounded,
        ),
      if (table.isFull)
        AppMessage(
          tone: StatusTone.info,
          title: l10n.adminTableFullTitle,
          detail: l10n.adminTableFullDetail,
        ),
    ];
    return [
      for (final alert in alerts)
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: alert,
        ),
    ];
  }

  Widget _buildKpis(BuildContext context, TableDetail detail) {
    final l10n = context.l10n;
    final kpi = detail.kpi;
    if (kpi == null ||
        (kpi.lastSessionAt == null && kpi.valuesCompleted == 0)) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.md),
        child: AppMessage(
          tone: StatusTone.info,
          title: l10n.adminNewTableTitle,
          detail: l10n.adminNewTableDetail,
        ),
      );
    }
    final tiles = [
      KpiTile(
        label: l10n.kpiValuesCompleted,
        value: '${kpi.valuesCompleted}',
        unit: '/48',
      ),
      KpiTile(
        label: l10n.kpiEstimatedImprovement,
        value: AdminFormat.improvement(kpi.improvementAvg),
        unit: l10n.kpiPointsUnit,
      ),
      KpiTile(
        label: l10n.kpiAttendance,
        value: AdminFormat.percent(kpi.attendancePct),
      ),
      KpiTile(label: l10n.kpiSyncedLate, value: '${kpi.syncedLateRows}'),
      KpiTile(
        label: l10n.adminLastSession,
        value: AdminFormat.shortDate(kpi.lastSessionAt),
        detail: kpi.currentValueLabel,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: [for (final t in tiles) SizedBox(width: 200, child: t)],
      ),
    );
  }

  Widget _buildSchedule(BuildContext context, TableDetail detail) {
    final l10n = context.l10n;
    final table = detail.table;
    Widget row(String label, String value) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(label.toUpperCase(), style: context.textStyles.kicker),
          ),
          Expanded(child: Text(value, style: context.textTheme.titleSmall)),
        ],
      ),
    );
    return SectionCard(
      title: l10n.adminSchedule,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          row(l10n.adminFieldWeekday, AdminFormat.weekday(l10n, table.weekday)),
          row(l10n.adminFieldTime, table.startTimeShort),
          row(l10n.adminFieldTimezone, table.timezone),
          row(
            l10n.adminFieldDuration,
            l10n.adminMinutes(table.durationMinutes),
          ),
          Row(
            children: [
              const Icon(Icons.lock_rounded, size: 14),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Text(
                  l10n.adminScheduleCentral,
                  style: context.textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFacilitator(
    BuildContext context,
    TableDetail detail,
    bool writable,
  ) {
    final l10n = context.l10n;
    final table = detail.table;
    final events = _historyEvents(context, detail);
    return SectionCard(
      title: l10n.adminFacilitatorAndHistory,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: table.facilitatorName == null
                ? null
                : AppAvatar(name: table.facilitatorName!, size: 40),
            title: Text(table.facilitatorName ?? l10n.adminNoFacilitator),
            subtitle: Text(l10n.adminCurrentFacilitator),
            trailing: AppButton(
              label: table.hasFacilitator ? l10n.adminChange : l10n.adminAssign,
              icon: Icons.swap_horiz_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: writable
                  ? () => _changeFacilitator(context, detail)
                  : null,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (events.isEmpty)
            Text(l10n.adminNoHistory, style: context.textTheme.bodySmall)
          else
            for (final event in events)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 6,
                        right: AppSpacing.sm,
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 8,
                        color: context.colors.accent,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(event.text, style: context.textTheme.titleSmall),
                          Text(event.date, style: context.textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }

  List<({String text, String date})> _historyEvents(
    BuildContext context,
    TableDetail detail,
  ) {
    final l10n = context.l10n;
    final past = detail.pastMembers.where((m) => m.leftAt != null).toList()
      ..sort((a, b) => b.leftAt!.compareTo(a.leftAt!));
    return [
      for (final m in past)
        (
          text: l10n.adminHistoryLeft(m.fullName, _leftReason(context, m)),
          date: AdminFormat.date(m.leftAt),
        ),
    ];
  }

  String _leftReason(BuildContext context, TableMembership membership) {
    final l10n = context.l10n;
    return switch (membership.leftReason) {
      'moved' => l10n.adminLeftMoved,
      'deactivated' => l10n.adminLeftDeactivated,
      'facilitator_changed' => l10n.adminLeftFacilitatorChanged,
      'invite_revoked' => l10n.adminLeftInviteRevoked,
      _ => l10n.adminLeftOther,
    };
  }

  Future<void> _changeFacilitator(
    BuildContext context,
    TableDetail detail,
  ) async {
    final cubit = context.read<TableDetailCubit>();
    final choice = await ChangeFacilitatorDialog.show(context, detail);
    if (choice == null) return;
    await cubit.changeFacilitator(
      personId: choice.person.id,
      personName: choice.person.fullName,
      keepPreviousAsMember: choice.keepPrevious,
    );
  }

  Widget _buildMembers(
    BuildContext context,
    TableDetail detail,
    bool writable,
  ) {
    final l10n = context.l10n;
    final table = detail.table;
    final members = detail.activeMembers
      ..sort((a, b) {
        if (a.role != b.role) {
          return a.role == MembershipRole.facilitator ? -1 : 1;
        }
        return a.fullName.compareTo(b.fullName);
      });
    return SectionCard(
      title: l10n.adminMembers,
      trailing: SeatPips(taken: table.activePeople, capacity: table.maxPeople),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (members.isEmpty)
            EmptyState(
              icon: Icons.groups_rounded,
              title: l10n.adminNoMembersTitle,
              message: l10n.adminNoMembersMessage,
            )
          else
            for (final member in members)
              _buildMemberRow(context, detail, member, writable),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.adminMembersHint, style: context.textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildMemberRow(
    BuildContext context,
    TableDetail detail,
    TableMembership member,
    bool writable,
  ) {
    final l10n = context.l10n;
    final table = detail.table;
    final isFacilitator = member.role == MembershipRole.facilitator;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppAvatar(name: member.fullName, size: 40),
      title: Wrap(
        spacing: AppSpacing.sm,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(member.fullName),
          if (isFacilitator)
            StatusPill(
              tone: StatusTone.info,
              label: l10n.roleFacilitator,
              icon: Icons.star_rounded,
            ),
        ],
      ),
      subtitle: Text(_memberSubtitle(context, detail, member)),
      trailing: Wrap(
        spacing: AppSpacing.xs,
        children: [
          IconButton(
            tooltip: l10n.adminSeeAnswersOf(member.fullName),
            icon: const Icon(Icons.visibility_rounded),
            onPressed: () => context.push(
              KpisRoutes.memberDetailPath(
                tableId: table.id,
                personId: member.personId,
              ),
            ),
          ),
          if (isFacilitator)
            IconButton(
              tooltip: l10n.adminChangeFacilitator,
              icon: const Icon(Icons.swap_horiz_rounded),
              onPressed: writable
                  ? () => _changeFacilitator(context, detail)
                  : null,
            )
          else ...[
            IconButton(
              tooltip: l10n.adminMoveTitle(member.fullName),
              icon: const Icon(Icons.drive_file_move_rounded),
              onPressed: writable ? () => _move(context, detail, member) : null,
            ),
            IconButton(
              tooltip: l10n.adminDeactivateMemberTitle(member.fullName),
              icon: const Icon(Icons.person_off_rounded),
              onPressed: writable
                  ? () => _deactivate(context, detail, member)
                  : null,
            ),
          ],
        ],
      ),
    );
  }

  String _memberSubtitle(
    BuildContext context,
    TableDetail detail,
    TableMembership member,
  ) {
    final l10n = context.l10n;
    AdminPerson? person;
    for (final p in detail.organizationPeople) {
      if (p.id == member.personId) person = p;
    }
    final since = l10n.adminMemberSince(AdminFormat.date(member.joinedAt));
    final position = person?.position;
    return position == null || position.isEmpty ? since : '$position · $since';
  }

  Future<void> _move(
    BuildContext context,
    TableDetail detail,
    TableMembership member,
  ) async {
    final cubit = context.read<TableDetailCubit>();
    final target = await MoveMemberDialog.show(
      context,
      personName: member.fullName,
      from: detail.table,
      targets: detail.organizationTables,
    );
    if (target != null) {
      await cubit.moveMember(
        tableMemberId: member.id,
        toTableId: target,
        personName: member.fullName,
      );
    }
  }

  Future<void> _deactivate(
    BuildContext context,
    TableDetail detail,
    TableMembership member,
  ) async {
    final l10n = context.l10n;
    final cubit = context.read<TableDetailCubit>();
    final remaining = detail.table.activePeople - 1;
    final ok = await AppDialogs.confirm(
      context,
      title: l10n.adminDeactivateMemberTitle(member.fullName),
      message: remaining < 3
          ? '${l10n.adminDeactivateMemberMessage(detail.table.code)}\n\n${l10n.adminDeactivateMemberBelowMinimum(remaining)}'
          : l10n.adminDeactivateMemberMessage(detail.table.code),
      confirmLabel: l10n.adminDeactivate,
      destructive: true,
    );
    if (ok) {
      await cubit.deactivateMember(
        tableMemberId: member.id,
        personName: member.fullName,
      );
    }
  }
}
