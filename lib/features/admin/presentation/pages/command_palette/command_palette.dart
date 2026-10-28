import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/config/injection.dart';
import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../l10n/gen/app_localizations.dart';
import '../../../../audit/audit_routes.dart';
import '../../../../kpis/kpis_routes.dart';
import '../../../admin_routes.dart';
import '../../../domain/explorer/explorer_engine.dart';
import '../../../domain/models/explorer_query.dart';
import '../../cubit/admin_access_cubit.dart';
import 'cubit/command_palette_cubit.dart';
import 'cubit/command_palette_state.dart';

/// ⌘/Ctrl+K: run an action or jump to an organization, table or view.
class CommandPalette extends StatefulWidget {
  const CommandPalette({
    super.key,
    required this.router,
    required this.isAdministrator,
  });

  /// Captured before the dialog opens: the page may be gone by the time an
  /// item runs.
  final GoRouter router;

  final bool isAdministrator;

  /// Opens the palette above the current page.
  static Future<void> show(BuildContext context) {
    final scope = context.read<AdminAccessCubit>().state.scope;
    final router = GoRouter.of(context);
    return showDialog<void>(
      context: context,
      builder: (dialogContext) => BlocProvider(
        create: (_) => getIt<CommandPaletteCubit>()..load(),
        child: CommandPalette(
          router: router,
          isAdministrator: scope?.isAdministrator ?? false,
        ),
      ),
    );
  }

  @override
  State<CommandPalette> createState() => _CommandPaletteState();
}

class _PaletteItem {
  const _PaletteItem({
    required this.group,
    required this.label,
    required this.icon,
    required this.run,
    this.hint,
    this.enabled = true,
  });

  final String group;
  final String label;
  final IconData icon;
  final String? hint;
  final bool enabled;
  final VoidCallback run;
}

class _CommandPaletteState extends State<CommandPalette> {
  final TextEditingController _controller = TextEditingController();
  int _highlight = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<_PaletteItem> _items(BuildContext context, CommandPaletteState state) {
    final l10n = context.l10n;
    final admin = widget.isAdministrator;
    void go(String location) {
      Navigator.of(context).pop();
      widget.router.go(location);
    }

    void push(String location) {
      Navigator.of(context).pop();
      widget.router.push(location);
    }

    final items = <_PaletteItem>[
      _PaletteItem(
        group: l10n.adminPaletteActions,
        label: l10n.adminCreateTable,
        icon: Icons.add_rounded,
        run: () => push(AdminRoutes.tableNewPath()),
      ),
      _PaletteItem(
        group: l10n.adminPaletteActions,
        label: l10n.adminCreateOrganization,
        icon: Icons.apartment_rounded,
        hint: admin ? null : l10n.adminAdministratorOnly,
        enabled: admin,
        run: () => push(AdminRoutes.organizationNew),
      ),
      _PaletteItem(
        group: l10n.adminPaletteActions,
        label: l10n.adminInviteCoordinator,
        icon: Icons.person_add_alt_1_rounded,
        hint: admin ? null : l10n.adminAdministratorOnly,
        enabled: admin,
        run: () => push(AdminRoutes.invitePath(role: 'coordinator')),
      ),
      _PaletteItem(
        group: l10n.adminPaletteActions,
        label: l10n.adminInviteFacilitator,
        icon: Icons.person_add_alt_1_rounded,
        run: () => push(AdminRoutes.invitePath(role: 'facilitator')),
      ),
      _PaletteItem(
        group: l10n.adminPaletteActions,
        label: l10n.adminInviteMember,
        icon: Icons.person_add_alt_1_rounded,
        run: () => push(AdminRoutes.invitePath(role: 'member')),
      ),
      for (final view in const [
        ExplorerView.delayed,
        ExplorerView.lowAttendance,
        ExplorerView.fewPeople,
        ExplorerView.syncedLate,
      ])
        _PaletteItem(
          group: l10n.adminPaletteSavedViews,
          label: l10n.adminPaletteOpenView(_viewName(l10n, view)),
          icon: Icons.star_rounded,
          run: () => go(AdminRoutes.explorerPath(viewId: view.id)),
        ),
      for (final view in state.savedViews)
        _PaletteItem(
          group: l10n.adminPaletteSavedViews,
          label: l10n.adminPaletteOpenView(view.name),
          icon: Icons.star_rounded,
          run: () => go(AdminRoutes.explorerPath(viewId: view.id)),
        ),
      _PaletteItem(
        group: l10n.adminPaletteGoTo,
        label: l10n.adminExplorerTitle,
        icon: Icons.grid_view_rounded,
        run: () => go(AdminRoutes.explorer),
      ),
      _PaletteItem(
        group: l10n.adminPaletteGoTo,
        label: l10n.kpiReportsTitle,
        icon: Icons.bar_chart_rounded,
        run: () => go(KpisRoutes.reports),
      ),
      _PaletteItem(
        group: l10n.adminPaletteGoTo,
        label: l10n.auditTitle,
        icon: Icons.list_alt_rounded,
        run: () => go(AuditRoutes.audit),
      ),
      for (final org in state.organizations)
        _PaletteItem(
          group: l10n.adminPaletteGoTo,
          label: l10n.adminPaletteGoToOrganization(org.name),
          icon: Icons.apartment_rounded,
          hint: org.countryName,
          run: () => push(AdminRoutes.organizationPath(org.id)),
        ),
    ];
    final query = ExplorerEngine.fold(_controller.text).trim();
    if (query.isNotEmpty) {
      for (final table in state.tables) {
        items.add(
          _PaletteItem(
            group: l10n.adminPaletteTables,
            label: l10n.adminPaletteGoToTable('${table.code} · ${table.name}'),
            icon: Icons.table_restaurant_rounded,
            hint: table.organizationName,
            run: () => push(AdminRoutes.tablePath(table.id)),
          ),
        );
      }
    }
    if (query.isEmpty) return items;
    final words = query.split(RegExp(r'\s+'));
    return items.where((item) {
      final haystack = ExplorerEngine.fold(
        '${item.label} ${item.group} ${item.hint ?? ''}',
      );
      return words.every(haystack.contains);
    }).toList();
  }

  String _viewName(AppLocalizations l10n, ExplorerView view) => switch (view) {
    ExplorerView.delayed => l10n.adminViewDelayed,
    ExplorerView.lowAttendance => l10n.adminViewLowAttendance,
    ExplorerView.fewPeople => l10n.adminViewFewPeople,
    _ => l10n.adminViewSyncedLate,
  };

  void _run(List<_PaletteItem> items) {
    if (items.isEmpty) return;
    final item = items[_highlight.clamp(0, items.length - 1)];
    if (item.enabled) item.run();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<CommandPaletteCubit, CommandPaletteState>(
      builder: (context, state) {
        final items = _items(context, state);
        final highlight = items.isEmpty
            ? 0
            : _highlight.clamp(0, items.length - 1);
        return Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 72),
            child: Dialog(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: CallbackShortcuts(
                  bindings: {
                    const SingleActivator(LogicalKeyboardKey.arrowDown): () =>
                        setState(() => _highlight = highlight + 1),
                    const SingleActivator(LogicalKeyboardKey.arrowUp): () =>
                        setState(() => _highlight = highlight - 1),
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: AppTextFormField(
                          name: 'query',
                          kind: AppFieldKind.search,
                          controller: _controller,
                          autofocus: true,
                          hint: l10n.adminPaletteHint,
                          prefixIcon: Icons.search_rounded,
                          onChanged: (_) => setState(() => _highlight = 0),
                          onSubmitted: (_) => _run(items),
                        ),
                      ),
                      Flexible(
                        child: items.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(AppSpacing.xl),
                                child: Text(
                                  l10n.adminPaletteNoResults(_controller.text),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : _buildList(context, items, highlight),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(AppSpacing.md),
                        child: Text(
                          l10n.adminPaletteFooter,
                          style: context.textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildList(
    BuildContext context,
    List<_PaletteItem> items,
    int highlight,
  ) {
    String? lastGroup;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        final header = item.group != lastGroup;
        lastGroup = item.group;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (header)
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.sm,
                  AppSpacing.lg,
                  0,
                ),
                child: Text(
                  item.group.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
              ),
            ListTile(
              dense: true,
              selected: index == highlight,
              selectedTileColor: context.colors.surfaceAlt,
              enabled: item.enabled,
              leading: Icon(item.icon),
              title: Text(item.label),
              trailing: item.hint == null
                  ? null
                  : Text(item.hint!, style: context.textTheme.bodySmall),
              onTap: item.run,
            ),
          ],
        );
      },
    );
  }
}
