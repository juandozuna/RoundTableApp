import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../kpis/kpis_routes.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/explorer_query.dart';
import '../../cubit/admin_access_state.dart';
import '../../widgets/admin_page_frame.dart';
import '../../widgets/explorer_labels.dart';
import 'cubit/explorer_cubit.dart';
import 'cubit/explorer_state.dart';
import 'widgets/explorer_filter_bar.dart';
import 'widgets/explorer_filters_panel.dart';
import 'widgets/explorer_organizations_grid.dart';
import 'widgets/explorer_people_grid.dart';
import 'widgets/explorer_tables_grid.dart';
import 'widgets/explorer_toolbar.dart';
import 'widgets/explorer_view_chips.dart';
import 'widgets/selection_kpi_panel.dart';

/// Home of the administration: the "Explorador de mesas" (ADR 0015).
class ExplorerPage extends StatelessWidget {
  const ExplorerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExplorerCubit>();
    return AdminPageFrame(
      title: context.l10n.adminAppBarTitle,
      showPalette: true,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      padBody: false,
      builder: (context, access) => BlocConsumer<ExplorerCubit, ExplorerState>(
        listenWhen: (previous, current) =>
            current.error != null && previous.error != current.error,
        listener: (context, state) => AppToast.show(
          context,
          state.error!.userMessage(context.l10n),
          kind: AppToastKind.error,
        ),
        builder: (context, state) => _buildContent(context, state, access),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ExplorerState state,
    AdminAccessState access,
  ) {
    final cubit = context.read<ExplorerCubit>();
    if (state.status == ExplorerStatus.loading) {
      return const Padding(
        padding: EdgeInsets.all(AppSpacing.lg),
        child: SkeletonList(count: 7, itemHeight: 48),
      );
    }
    if (state.status == ExplorerStatus.failure) {
      return ErrorState(
        message: state.error?.userMessage(context.l10n),
        onRetry: cubit.load,
      );
    }
    final scope = access.scope!;
    final desktop = context.layout.isDesktop;
    final main = _buildMain(context, state, access);
    final panel = SelectionKpiPanel(
      state: state,
      online: access.online,
      onOpenReports: () => _openReports(context, cubit),
      onExport: () => _export(context, state, cubit),
      onClear: cubit.clearSelection,
      onRemove: cubit.toggleSelected,
    );
    if (desktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: main),
          Container(
            width: 320,
            decoration: BoxDecoration(
              border: Border(left: BorderSide(color: context.colors.line)),
            ),
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [panel],
            ),
          ),
        ],
      );
    }
    return Stack(
      children: [
        main,
        if (state.hasSelection)
          Positioned(
            left: AppSpacing.md,
            right: AppSpacing.md,
            bottom: AppSpacing.md,
            child: _buildSelectionBar(
              context,
              state,
              panel,
              scope.isAdministrator,
            ),
          ),
      ],
    );
  }

  Widget _buildMain(
    BuildContext context,
    ExplorerState state,
    AdminAccessState access,
  ) {
    final cubit = context.read<ExplorerCubit>();
    final l10n = context.l10n;
    final scope = access.scope!;
    final horizontal = context.layout.isPhone
        ? AppSpacing.pagePhone
        : AppSpacing.pageTablet;
    return RefreshIndicator(
      onRefresh: cubit.refresh,
      child: ListView(
        padding: EdgeInsets.fromLTRB(
          horizontal,
          AppSpacing.md,
          horizontal,
          state.hasSelection ? 96 : AppSpacing.xl,
        ),
        children: [
          ExplorerToolbar(
            entity: state.entity,
            isAdministrator: scope.isAdministrator,
            online: access.online,
            counts: {
              ExplorerEntity.tables: state.data.tables.length,
              ExplorerEntity.organizations: state.data.organizations.length,
              ExplorerEntity.people: state.data.people.length,
            },
            compact: state.compact,
            onEntity: cubit.selectEntity,
            onToggleDensity: cubit.toggleDensity,
            organizationId: scope.organizationId,
          ),
          const SizedBox(height: AppSpacing.md),
          ExplorerViewChips(
            entity: state.entity,
            activeViewId: state.query.viewId,
            counts: state.viewCounts,
            savedViews: state.savedViews,
            onSelect: cubit.selectView,
            onSave: () => _saveView(context, cubit),
            onDelete: (view) async {
              final confirmed = await AppDialogs.confirm(
                context,
                title: l10n.adminDeleteViewTitle,
                message: l10n.adminDeleteViewMessage(view.name),
                confirmLabel: l10n.actionDelete,
                destructive: true,
              );
              if (confirmed) await cubit.deleteView(view.id);
            },
            canSave: state.query.hasRefinements,
          ),
          const SizedBox(height: AppSpacing.sm),
          ExplorerFilterBar(
            state: state,
            organizationLock: scope.isAdministrator
                ? null
                : scope.organizationName,
            onSearch: cubit.search,
            onOpenFilters: () => ExplorerFiltersPanel.show(context, cubit),
            onRemoveFilter: (key) => cubit.setFilter(key, null),
            onClear: cubit.clearFilters,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildGrid(context, state, access),
          const SizedBox(height: AppSpacing.sm),
          _buildFooter(context, state, access.online),
        ],
      ),
    );
  }

  Widget _buildGrid(
    BuildContext context,
    ExplorerState state,
    AdminAccessState access,
  ) {
    final cubit = context.read<ExplorerCubit>();
    final l10n = context.l10n;
    if (state.visibleCount == 0) {
      final noData = state.totalCount == 0;
      return EmptyState(
        icon: noData ? Icons.grid_view_rounded : Icons.search_off_rounded,
        title: noData
            ? l10n.adminEmptyTitle(
                ExplorerLabels.entity(context, state.entity).toLowerCase(),
              )
            : l10n.adminNoResultsTitle,
        message: noData ? l10n.adminEmptyMessage : l10n.adminNoResultsMessage,
        actionLabel: noData ? null : l10n.adminClearFiltersAndView,
        onAction: cubit.clearFilters,
      );
    }
    void toggle(String id, bool selected) => cubit.toggleSelected(id);
    switch (state.entity) {
      case ExplorerEntity.tables:
        return ExplorerTablesGrid(
          state: state,
          onOpen: (t) => context.push(AdminRoutes.tablePath(t.id)),
          onToggle: toggle,
          onSelectAll: cubit.selectAllVisible,
          onSort: cubit.sortBy,
        );
      case ExplorerEntity.organizations:
        return ExplorerOrganizationsGrid(
          state: state,
          onOpen: (o) => context.push(AdminRoutes.organizationPath(o.id)),
          onToggle: toggle,
          onSelectAll: cubit.selectAllVisible,
          onSort: cubit.sortBy,
        );
      case ExplorerEntity.people:
        return ExplorerPeopleGrid(
          state: state,
          organizationNames: {
            for (final o in state.data.organizations) o.id: o.organization.name,
          },
          onOpen: (p) => context.push(AdminRoutes.personPath(p.id)),
          onToggle: toggle,
          onSelectAll: cubit.selectAllVisible,
          onSort: cubit.sortBy,
        );
    }
  }

  Widget _buildFooter(BuildContext context, ExplorerState state, bool online) {
    final l10n = context.l10n;
    final loaded = state.data.loadedAt;
    final stamp = !online
        ? l10n.adminDataSavedReadOnly
        : state.refreshing
        ? l10n.loading
        : l10n.adminDataUpdated(loaded == null ? '' : _time(loaded));
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: AppSpacing.md,
      children: [
        Text(
          l10n.adminRowsOfTotal(
            state.visibleCount,
            state.totalCount,
            state.selection.length,
          ),
          style: context.textTheme.bodySmall,
        ),
        Text(stamp, style: context.textTheme.bodySmall),
      ],
    );
  }

  String _time(DateTime value) {
    final local = value.toLocal();
    return '${local.hour.toString().padLeft(2, '0')}:'
        '${local.minute.toString().padLeft(2, '0')}';
  }

  Widget _buildSelectionBar(
    BuildContext context,
    ExplorerState state,
    Widget panel,
    bool isAdministrator,
  ) {
    final l10n = context.l10n;
    return Material(
      color: context.colors.ink,
      borderRadius: BorderRadius.circular(AppRadii.lg),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.xs,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                l10n.adminSelectedCount(state.selection.length),
                style: context.textTheme.labelLarge!.copyWith(
                  color: context.colors.background,
                ),
              ),
            ),
            AppButton(
              label: l10n.adminSeeKpis,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: () => AppDialogs.showSheet<void>(
                context,
                title: l10n.adminSelectionKpis,
                builder: (_) => SingleChildScrollView(child: panel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveView(BuildContext context, ExplorerCubit cubit) async {
    final l10n = context.l10n;
    final name = await showDialog<String>(
      context: context,
      builder: (_) => const _SaveViewDialog(),
    );
    if (name == null || name.trim().isEmpty || !context.mounted) return;
    await cubit.saveCurrentView(name);
    if (context.mounted) {
      AppToast.show(
        context,
        l10n.adminViewSaved(name.trim()),
        kind: AppToastKind.success,
      );
    }
  }

  void _openReports(BuildContext context, ExplorerCubit cubit) {
    final scope = cubit.reportScope();
    context.go(
      KpisRoutes.reportsPath(
        country: scope.country,
        organizationId: scope.organizationId,
        tableId: scope.tableId,
      ),
    );
  }

  Future<void> _export(
    BuildContext context,
    ExplorerState state,
    ExplorerCubit cubit,
  ) async {
    final l10n = context.l10n;
    final headers = switch (state.entity) {
      ExplorerEntity.tables => [
        l10n.adminColCode,
        l10n.adminColName,
        l10n.adminColOrganization,
        l10n.adminColLocation,
        l10n.adminColFacilitator,
        l10n.adminColSeats,
        l10n.adminColStatus,
        l10n.adminColAttendance,
        l10n.adminColValues,
        l10n.adminColImprovement,
        l10n.adminColLate,
      ],
      ExplorerEntity.organizations => [
        l10n.adminColOrganization,
        l10n.adminColKind,
        l10n.adminColCountry,
        l10n.adminColStatus,
        l10n.adminColTables,
        l10n.adminColPeople,
        l10n.adminColAttendance,
        l10n.adminColImprovement,
      ],
      ExplorerEntity.people => [
        l10n.adminColPerson,
        l10n.adminColRole,
        l10n.adminFieldEmail,
        l10n.adminFieldPhone,
        l10n.adminColTable,
        l10n.adminColStatus,
      ],
    };
    try {
      await cubit.exportCsv(headers);
    } on Object {
      if (context.mounted) {
        AppToast.show(
          context,
          l10n.adminExportFailed,
          kind: AppToastKind.error,
        );
      }
    }
  }
}

class _SaveViewDialog extends StatefulWidget {
  const _SaveViewDialog();

  @override
  State<_SaveViewDialog> createState() => _SaveViewDialogState();
}

class _SaveViewDialogState extends State<_SaveViewDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.adminSaveViewTitle),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(labelText: l10n.adminSaveViewName),
        onSubmitted: (value) => Navigator.of(context).pop(value),
      ),
      actions: [
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          label: l10n.actionSave,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(_controller.text),
        ),
      ],
    );
  }
}
