import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/models/attendance_status.dart';
import '../../../../../core/models/sync_state.dart';
import '../../../../../core/models/user_role.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../home/home_routes.dart';

/// Dev-only catalogue of every shared widget, in light and dark, for design
/// review. Demo state is ephemeral widget state; no business logic here.
class ComponentGalleryPage extends StatefulWidget {
  const ComponentGalleryPage({
    super.key,
    this.initialDark = false,
    this.initialLight = false,
  });

  final bool initialDark;
  final bool initialLight;

  @override
  State<ComponentGalleryPage> createState() => _ComponentGalleryPageState();
}

class _ComponentGalleryPageState extends State<ComponentGalleryPage> {
  static const List<String> _demoPeople = [
    'Marta Quiroz',
    'Camila Rojas',
    'Joaquín Mena',
    'Rodrigo Paz',
    'Ana Lucía Soto',
  ];

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool? _dark;
  int? _score = 7;
  bool _filterLate = true;
  bool _filterLowAttendance = false;
  int _sortColumn = 0;
  bool _sortAscending = true;
  final Set<String> _selectedRows = {'Camila Rojas'};

  bool _isDark(BuildContext context) =>
      _dark ??
      (widget.initialDark
          ? true
          : widget.initialLight
          ? false
          : MediaQuery.platformBrightnessOf(context) == Brightness.dark);

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);
    return Theme(
      data: dark ? AppTheme.dark : AppTheme.light,
      child: Builder(
        builder: (context) => AppScaffold(
          title: context.l10n.galleryTitle,
          backFallbackLocation: HomeRoutes.home,
          actions: [_buildThemeToggle(context, dark)],
          body: ListView(
            padding: const EdgeInsets.only(bottom: AppSpacing.xxxl),
            children: [
              _buildButtons(context),
              _buildStatus(context),
              _buildAvatars(context),
              _buildFeedback(context),
              _buildScore(context),
              _buildForms(context),
              _buildStates(context),
              _buildTable(context),
              _buildDialogs(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeToggle(BuildContext context, bool dark) {
    final l10n = context.l10n;
    return Wrap(
      spacing: AppSpacing.xs,
      children: [
        AppChip(
          label: l10n.galleryThemeLight,
          icon: Icons.light_mode_rounded,
          selected: !dark,
          onSelected: (_) => setState(() => _dark = false),
        ),
        AppChip(
          label: l10n.galleryThemeDark,
          icon: Icons.dark_mode_rounded,
          selected: dark,
          onSelected: (_) => setState(() => _dark = true),
        ),
      ],
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title.toUpperCase(), style: context.textStyles.kicker),
          const SizedBox(height: AppSpacing.md),
          ...children,
        ],
      ),
    );
  }

  Widget _wrap(List<Widget> children) => Wrap(
    spacing: AppSpacing.sm,
    runSpacing: AppSpacing.sm,
    crossAxisAlignment: WrapCrossAlignment.center,
    children: children,
  );

  Widget _buildButtons(BuildContext context) {
    final l10n = context.l10n;
    return _buildSection(context, l10n.gallerySectionButtons, [
      AppButton(
        label: l10n.actionContinue,
        icon: Icons.play_arrow_rounded,
        onPressed: () {},
      ),
      const SizedBox(height: AppSpacing.sm),
      AppButton(
        label: l10n.galleryOfflineAction,
        icon: Icons.cloud_off_rounded,
        variant: AppButtonVariant.offline,
        onPressed: () {},
      ),
      const SizedBox(height: AppSpacing.sm),
      AppButton(label: l10n.actionSave, onPressed: null),
      const SizedBox(height: AppSpacing.md),
      _wrap([
        AppButton(
          label: l10n.galleryPrimary,
          size: AppButtonSize.small,
          fullWidth: false,
          onPressed: () {},
        ),
        AppButton(
          label: l10n.gallerySecondary,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () {},
        ),
        AppButton(
          label: l10n.galleryDanger,
          icon: Icons.delete_rounded,
          variant: AppButtonVariant.danger,
          fullWidth: false,
          onPressed: () {},
        ),
        AppButton(
          label: l10n.actionEdit,
          variant: AppButtonVariant.ghost,
          fullWidth: false,
          onPressed: () {},
        ),
        AppButton(
          label: l10n.actionSave,
          variant: AppButtonVariant.secondary,
          loading: true,
          fullWidth: false,
          onPressed: () {},
        ),
        AppTextButton(label: l10n.actionRetry, onPressed: () {}),
        AppIconButton(
          icon: Icons.share_rounded,
          tooltip: l10n.actionShare,
          onPressed: () {},
        ),
        AppIconButton(
          icon: Icons.add_rounded,
          tooltip: l10n.tooltipIncrease,
          variant: AppIconButtonVariant.filled,
          size: AppSizes.primaryAction,
          onPressed: () {},
        ),
      ]),
    ]);
  }

  Widget _buildStatus(BuildContext context) {
    final l10n = context.l10n;
    return _buildSection(context, l10n.gallerySectionStatus, [
      _wrap([
        StatusPill(tone: StatusTone.ok, label: l10n.attendancePresent),
        StatusPill(tone: StatusTone.pending, label: l10n.syncPending),
        StatusPill(tone: StatusTone.syncing, label: l10n.syncSyncing),
        StatusPill(tone: StatusTone.late, label: l10n.syncSyncedLate),
        StatusPill(tone: StatusTone.offline, label: l10n.connectivityOffline),
        StatusPill(tone: StatusTone.error, label: l10n.attendanceAbsent),
        StatusPill(tone: StatusTone.info, label: l10n.connectivityOnline),
        StatusPill(tone: StatusTone.neutral, label: l10n.healthUnknown),
      ]),
      const SizedBox(height: AppSpacing.md),
      for (final state in SyncState.values) ...[
        SyncPill(state: state, detail: l10n.syncPendingCount(state.index)),
        const SizedBox(height: AppSpacing.sm),
      ],
      _wrap([
        for (final state in SyncState.values) SyncPill.compact(state: state),
      ]),
      const SizedBox(height: AppSpacing.md),
      _wrap(const [
        SeatPips(taken: 5),
        SeatPips(taken: 9),
        SeatPips(taken: 10),
      ]),
    ]);
  }

  Widget _buildAvatars(BuildContext context) {
    final l10n = context.l10n;
    const tones = [
      null,
      StatusTone.ok,
      StatusTone.pending,
      StatusTone.offline,
      StatusTone.late,
    ];
    return _buildSection(context, l10n.gallerySectionAvatars, [
      _wrap([
        for (var i = 0; i < _demoPeople.length; i++)
          AppAvatar(name: _demoPeople[i], size: 60, ringTone: tones[i]),
      ]),
      const SizedBox(height: AppSpacing.md),
      _wrap([for (final role in UserRole.values) RoleChip(role: role)]),
      const SizedBox(height: AppSpacing.md),
      _wrap([
        ContextChip(
          role: UserRole.coordinator,
          contextName: 'Fundación Luz',
          onTap: () {},
        ),
        const ContextChip(
          role: UserRole.member,
          contextName: 'Mesa Esperanza 03',
        ),
      ]),
      const SizedBox(height: AppSpacing.md),
      _wrap([
        AppChip(
          label: l10n.syncSyncedLate,
          count: 3,
          selected: _filterLate,
          onSelected: (value) => setState(() => _filterLate = value),
        ),
        AppChip(
          label: l10n.attendanceAbsent,
          icon: Icons.person_off_rounded,
          count: 12,
          selected: _filterLowAttendance,
          onSelected: (value) => setState(() => _filterLowAttendance = value),
        ),
      ]),
    ]);
  }

  Widget _buildFeedback(BuildContext context) {
    final l10n = context.l10n;
    return _buildSection(context, l10n.gallerySectionFeedback, [
      OfflineBanner(detail: l10n.offlineDetailOnlineOnly, onRetry: () {}),
      const SizedBox(height: AppSpacing.md),
      AppMessage(tone: StatusTone.info, title: l10n.galleryInfoMessage),
      const SizedBox(height: AppSpacing.sm),
      AppMessage(
        tone: StatusTone.pending,
        title: l10n.galleryWarningMessage,
        detail: l10n.syncStaleWarning,
      ),
      const SizedBox(height: AppSpacing.sm),
      AppMessage(tone: StatusTone.error, title: l10n.galleryErrorMessage),
      const SizedBox(height: AppSpacing.md),
      _wrap([
        AppButton(
          label: l10n.galleryShowToast,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => AppToast.show(
            context,
            l10n.toastSaved,
            kind: AppToastKind.success,
          ),
        ),
        AppButton(
          label: l10n.errorGeneric,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => AppToast.show(
            context,
            l10n.errorNetwork,
            kind: AppToastKind.error,
          ),
        ),
      ]),
    ]);
  }

  Widget _buildScore(BuildContext context) {
    return _buildSection(context, context.l10n.gallerySectionScore, [
      ScoreGrid(
        value: _score,
        onChanged: (score) => setState(() => _score = score),
      ),
    ]);
  }

  Widget _buildForms(BuildContext context) {
    final l10n = context.l10n;
    return _buildSection(context, l10n.gallerySectionForms, [
      FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppSpacing.md,
          children: [
            AppTextFormField(
              name: 'name',
              label: l10n.galleryFieldName,
              kind: AppFieldKind.personName,
              required: true,
            ),
            AppTextFormField(
              name: 'email',
              label: l10n.galleryFieldEmail,
              kind: AppFieldKind.email,
            ),
            AppTextFormField(
              name: 'phone',
              label: l10n.galleryFieldPhone,
              kind: AppFieldKind.phone,
              hint: '+52 55 1234 5678',
            ),
            AppTextFormField(
              name: 'invite',
              label: l10n.galleryFieldInvite,
              kind: AppFieldKind.inviteCode,
            ),
            AppDropdownFormField<String>(
              name: 'country',
              label: l10n.galleryFieldCountry,
              required: true,
              items: const [
                AppDropdownItem(value: 'MX', label: 'México'),
                AppDropdownItem(value: 'CO', label: 'Colombia'),
                AppDropdownItem(value: 'PE', label: 'Perú'),
              ],
            ),
            AppCounterFormField(
              name: 'seats',
              label: l10n.galleryFieldSeats,
              min: 2,
              max: 9,
              initialValue: 6,
            ),
            AppScoreFormField(name: 'score', label: l10n.scoreLabel),
            AppCheckboxFormField(
              name: 'consent',
              label: l10n.galleryFieldConsent,
              mustBeChecked: true,
            ),
            AppButton(
              label: l10n.actionSave,
              size: AppButtonSize.medium,
              onPressed: () => _formKey.currentState?.saveAndValidate(),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _buildStates(BuildContext context) {
    final l10n = context.l10n;
    return _buildSection(context, l10n.gallerySectionStates, [
      const SkeletonList(count: 2),
      AppCard(
        child: EmptyState(actionLabel: l10n.actionContinue, onAction: () {}),
      ),
      const SizedBox(height: AppSpacing.sm),
      AppCard(
        child: ErrorState(message: l10n.errorNetwork, onRetry: () {}),
      ),
    ]);
  }

  Widget _buildTable(BuildContext context) {
    final l10n = context.l10n;
    final rows = [..._demoPeople]
      ..sort((a, b) => _sortAscending ? a.compareTo(b) : b.compareTo(a));
    return _buildSection(context, l10n.gallerySectionTable, [
      AppDataTable<String>(
        rows: rows,
        sortColumnIndex: _sortColumn,
        sortAscending: _sortAscending,
        onSort: (column, ascending) => setState(() {
          _sortColumn = column;
          _sortAscending = ascending;
        }),
        isSelected: _selectedRows.contains,
        onSelectChanged: (row, selected) => setState(
          () => selected ? _selectedRows.add(row) : _selectedRows.remove(row),
        ),
        onRowTap: (_) {},
        columns: [
          AppDataColumn(
            label: l10n.galleryColumnName,
            flex: 3,
            sortable: true,
            cellBuilder: (context, name) => Row(
              children: [
                AppAvatar(name: name, size: 32),
                const SizedBox(width: AppSpacing.sm),
                Flexible(child: Text(name)),
              ],
            ),
          ),
          AppDataColumn(
            label: l10n.galleryColumnRole,
            flex: 2,
            cellBuilder: (context, name) => RoleChip(
              role: name == _demoPeople.first
                  ? UserRole.facilitator
                  : UserRole.member,
            ),
          ),
          AppDataColumn(
            label: l10n.galleryColumnStatus,
            flex: 2,
            cellBuilder: (context, name) => _attendancePill(
              context,
              name == 'Rodrigo Paz'
                  ? AttendanceStatus.absent
                  : AttendanceStatus.present,
            ),
          ),
        ],
        phoneCardBuilder: (context, name) => Row(
          children: [
            AppAvatar(name: name, size: 40),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: Text(name, style: context.textTheme.titleSmall)),
            _attendancePill(
              context,
              name == 'Rodrigo Paz'
                  ? AttendanceStatus.absent
                  : AttendanceStatus.present,
            ),
          ],
        ),
      ),
    ]);
  }

  Widget _attendancePill(BuildContext context, AttendanceStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      AttendanceStatus.present => StatusPill(
        tone: StatusTone.ok,
        label: l10n.attendancePresent,
      ),
      AttendanceStatus.late => StatusPill(
        tone: StatusTone.info,
        label: l10n.attendanceLate,
      ),
      AttendanceStatus.excused => StatusPill(
        tone: StatusTone.neutral,
        label: l10n.attendanceExcused,
      ),
      AttendanceStatus.absent => StatusPill(
        tone: StatusTone.error,
        label: l10n.attendanceAbsent,
      ),
    };
  }

  Widget _buildDialogs(BuildContext context) {
    final l10n = context.l10n;
    return _buildSection(context, l10n.gallerySectionDialogs, [
      _wrap([
        AppButton(
          label: l10n.galleryShowDialog,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => AppDialogs.confirm(
            context,
            message: l10n.notFoundMessage,
            destructive: true,
            confirmLabel: l10n.actionDelete,
          ),
        ),
        AppButton(
          label: l10n.galleryShowSheet,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => AppDialogs.showSheet<void>(
            context,
            title: l10n.galleryTitle,
            builder: (sheetContext) => ScoreGrid(value: 3, onChanged: (_) {}),
          ),
        ),
      ]),
    ]);
  }
}
