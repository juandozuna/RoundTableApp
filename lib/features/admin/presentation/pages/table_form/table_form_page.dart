import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/admin_organization.dart';
import '../../../domain/models/admin_person.dart';
import '../../../domain/models/admin_table.dart';
import '../../../domain/models/organization_status.dart';
import '../../../domain/models/person_input.dart';
import '../../../domain/models/person_status.dart';
import '../../../domain/models/program_value.dart';
import '../../../domain/models/record_status.dart';
import '../../../domain/models/round_table_status.dart';
import '../../../domain/models/table_input.dart';
import '../../admin_countries.dart';
import '../../admin_error_messages.dart';
import '../../admin_format.dart';
import '../../widgets/admin_date_time_form_field.dart';
import '../../widgets/admin_page_frame.dart';
import '../../widgets/admin_time_form_field.dart';
import 'cubit/table_form_cubit.dart';
import 'cubit/table_form_state.dart';
import 'widgets/rewind_confirm_dialog.dart';

/// Full-page form to create a table or edit its schedule (coordinator/admin).
class TableFormPage extends StatefulWidget {
  const TableFormPage({super.key, this.tableId});

  /// Null when creating.
  final String? tableId;

  @override
  State<TableFormPage> createState() => _TableFormPageState();
}

class _TableFormPageState extends State<TableFormPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool _newFacilitator = false;
  int? _moduleNumber;
  bool _moduleChosen = false;

  bool get _isEdit => widget.tableId != null;

  String get _back =>
      _isEdit ? AdminRoutes.tablePath(widget.tableId!) : AdminRoutes.explorer;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminPageFrame(
      title: _isEdit ? l10n.adminEditTable : l10n.adminCreateTable,
      backFallbackLocation: _back,
      maxContentWidth: 760,
      builder: (context, access) =>
          BlocConsumer<TableFormCubit, TableFormState>(
            listenWhen: (a, b) =>
                a.status != b.status || a.pendingRewind != b.pendingRewind,
            listener: _onStatus,
            builder: (context, state) => _buildBody(
              context,
              state,
              access.online,
              access.scope!.isAdministrator,
              access.scope!.organizationId,
            ),
          ),
    );
  }

  Future<void> _askRewindConfirmation() async {
    final cubit = context.read<TableFormCubit>();
    final confirmed = await RewindConfirmDialog.show(context);
    if (confirmed) {
      await cubit.confirmRewind(widget.tableId!);
    } else {
      cubit.dismissRewind();
    }
  }

  void _onStatus(BuildContext context, TableFormState state) {
    final l10n = context.l10n;
    if (state.pendingRewind != null) {
      _askRewindConfirmation();
      return;
    }
    if (state.status == TableFormStatus.saved) {
      AppToast.show(
        context,
        _isEdit ? l10n.adminToastTableUpdated : l10n.adminToastTableCreated,
        kind: AppToastKind.success,
      );
      final invite = state.facilitatorInvite;
      if (invite != null) {
        context.go(
          AdminRoutes.invitePath(
            role: 'facilitator',
            tableId: state.savedTableId,
          ),
          extra: invite,
        );
      } else if (_isEdit && context.canPop()) {
        context.pop();
      } else {
        context.go(AdminRoutes.tablePath(state.savedTableId!));
      }
    } else if (state.error != null && state.status == TableFormStatus.editing) {
      final message = state.error!.adminMessage(l10n);
      final field = state.error!.adminFieldName;
      if (field != null) {
        _formKey.currentState?.fields[field]?.invalidate(message);
      }
      AppToast.show(context, message, kind: AppToastKind.error);
    }
  }

  Widget _buildBody(
    BuildContext context,
    TableFormState state,
    bool online,
    bool isAdministrator,
    String? ownOrganizationId,
  ) {
    final l10n = context.l10n;
    if (state.status == TableFormStatus.loading) {
      return ListView(children: const [SkeletonList(count: 5, itemHeight: 72)]);
    }
    if (state.status == TableFormStatus.failure) {
      return ErrorState(
        message: state.error?.adminMessage(l10n),
        onRetry: () =>
            context.read<TableFormCubit>().init(tableId: widget.tableId),
      );
    }
    final data = state.data;
    final table = data.table;
    final organizations = data.organizations
        .where((o) => o.status == OrganizationStatus.active)
        .toList();
    final organizationId =
        state.organizationId ?? (isAdministrator ? null : ownOrganizationId);
    final locations = data.locations
        .where((l) => l.status == RecordStatus.active)
        .toList();
    final submitting = state.status == TableFormStatus.submitting;
    return FormBuilder(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          Text(
            l10n.adminSectionIdentity.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          _buildOrganizationField(
            context,
            organizations,
            organizationId,
            isAdministrator,
            table != null,
            data.organizations,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'name',
            label: l10n.adminFieldTableName,
            required: true,
            initialValue: table?.name,
            hint: l10n.adminFieldTableNameHint,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'code',
            label: l10n.adminFieldTableCode,
            required: true,
            initialValue: table?.code,
            hint: l10n.adminFieldTableCodeHint,
            helper: l10n.adminFieldTableCodeHelper,
          ),
          const SizedBox(height: AppSpacing.xl),
          Text(
            l10n.adminSectionLocationSchedule.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          if (organizationId != null && locations.isEmpty)
            AppMessage(
              tone: StatusTone.pending,
              title: l10n.adminOrgWithoutLocations,
              detail: l10n.adminOrgWithoutLocationsDetail,
              action: AppTextButton(
                label: l10n.adminNewLocation,
                onPressed: () =>
                    context.push(AdminRoutes.locationNewPath(organizationId)),
              ),
            )
          else
            AppDropdownFormField<String>(
              name: 'location',
              label: l10n.adminFieldLocation,
              required: true,
              initialValue: table?.locationId,
              hint: organizationId == null
                  ? l10n.adminChooseOrganizationFirst
                  : null,
              enabled: organizationId != null,
              items: [
                for (final l in locations)
                  AppDropdownItem(value: l.id, label: l.name),
              ],
            ),
          const SizedBox(height: AppSpacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppDropdownFormField<int>(
                  name: 'weekday',
                  label: l10n.adminFieldWeekday,
                  required: true,
                  initialValue: table?.weekday,
                  items: [
                    for (var day = 1; day <= 7; day++)
                      AppDropdownItem(
                        value: day,
                        label: AdminFormat.weekday(l10n, day),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AdminTimeFormField(
                  name: 'time',
                  label: l10n.adminFieldTime,
                  required: true,
                  initialValue: table?.startTimeShort,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppDropdownFormField<String>(
            name: 'timezone',
            label: l10n.adminFieldTimezone,
            required: true,
            initialValue:
                table?.timezone ??
                _defaultTimezone(data.organizations, organizationId),
            items: [
              for (final zone in {
                ...AdminCountries.timezones,
                ?table?.timezone,
              })
                AppDropdownItem(value: zone, label: zone),
            ],
          ),
          if (_isEdit) ...[
            const SizedBox(height: AppSpacing.md),
            AdminDateTimeFormField(
              name: 'scheduleEffectiveFrom',
              label: l10n.adminScheduleEffectiveFrom,
              withTime: false,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.adminScheduleEffectiveHelp,
              style: context.textTheme.bodySmall,
            ),
          ],
          const SizedBox(height: AppSpacing.xs),
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
          ..._buildProgramFields(context, data.programValues, table),
          if (_isEdit) ...[
            const SizedBox(height: AppSpacing.md),
            AppDropdownFormField<RoundTableStatus>(
              name: 'status',
              label: l10n.adminColStatus,
              initialValue: table!.status,
              items: [
                AppDropdownItem(
                  value: RoundTableStatus.active,
                  label: l10n.adminTableStatusActive,
                ),
                AppDropdownItem(
                  value: RoundTableStatus.paused,
                  label: l10n.adminTableStatusPaused,
                ),
                AppDropdownItem(
                  value: RoundTableStatus.closed,
                  label: l10n.adminTableStatusClosed,
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: AppSpacing.xl),
            Text(
              l10n.adminSectionFacilitator.toUpperCase(),
              style: context.textStyles.kicker,
            ),
            const SizedBox(height: AppSpacing.sm),
            ..._buildFacilitatorFields(
              context,
              data.people,
              data.organizationTables.map((t) => t.facilitatorPersonId).toSet(),
              organizationId != null,
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: _isEdit ? l10n.adminSaveChanges : l10n.adminCreateTable,
            icon: Icons.check_rounded,
            loading: submitting,
            onPressed: online && !submitting
                ? () => _submit(state, organizationId)
                : null,
          ),
          if (!online)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.sm),
              child: Text(
                l10n.adminOfflineFormDetail,
                style: context.textTheme.bodySmall,
              ),
            ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.actionCancel,
            variant: AppButtonVariant.secondary,
            onPressed: submitting
                ? null
                : () => context.canPop() ? context.pop() : context.go(_back),
          ),
        ],
      ),
    );
  }

  /// Module + value picker for the program position (RF-28, values 1–48).
  List<Widget> _buildProgramFields(
    BuildContext context,
    List<ProgramValue> values,
    AdminTable? table,
  ) {
    if (values.isEmpty) return const [];
    final l10n = context.l10n;
    final current = values.where((v) => v.id == table?.currentValueId);
    final module = _moduleChosen
        ? _moduleNumber
        : current.firstOrNull?.module.number;
    final modules = {for (final v in values) v.module.number: v.module};
    final inModule = values.where((v) => v.module.number == module);
    return [
      const SizedBox(height: AppSpacing.xl),
      Text(
        l10n.adminSectionProgram.toUpperCase(),
        style: context.textStyles.kicker,
      ),
      const SizedBox(height: AppSpacing.sm),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AppDropdownFormField<int>(
              name: 'module',
              label: l10n.adminFieldModule,
              initialValue: module,
              onChanged: (value) => setState(() {
                _moduleChosen = true;
                _moduleNumber = value;
              }),
              items: [
                for (final m in modules.values)
                  AppDropdownItem(
                    value: m.number,
                    label: l10n.adminProgramModuleOption(m.number, m.name),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: AppDropdownFormField<String>(
              key: ValueKey('program-value-$module'),
              name: 'programValue',
              label: l10n.adminFieldProgramValue,
              enabled: module != null,
              initialValue: current.firstOrNull?.module.number == module
                  ? table?.currentValueId
                  : null,
              items: [
                for (final v in inModule)
                  AppDropdownItem(
                    value: v.id,
                    label: l10n.adminProgramValueOption(v.sequence, v.name),
                  ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: AppSpacing.xs),
      Text(
        _isEdit
            ? l10n.adminProgramValueHelperEdit
            : l10n.adminProgramValueHelperCreate,
        style: context.textTheme.bodySmall,
      ),
    ];
  }

  String? _defaultTimezone(
    List<AdminOrganization> organizations,
    String? organizationId,
  ) {
    for (final org in organizations) {
      if (org.id == organizationId) {
        return AdminCountries.defaultTimezone(org.countryCode);
      }
    }
    return null;
  }

  Widget _buildOrganizationField(
    BuildContext context,
    List<AdminOrganization> active,
    String? organizationId,
    bool isAdministrator,
    bool editing,
    List<AdminOrganization> all,
  ) {
    final l10n = context.l10n;
    if (!isAdministrator || editing) {
      final name = all
          .where((o) => o.id == organizationId)
          .map((o) => o.name)
          .firstOrNull;
      return InputDecorator(
        decoration: InputDecoration(
          labelText: l10n.adminFilterOrganization,
          prefixIcon: const Icon(Icons.lock_rounded),
        ),
        child: Text(name ?? AdminFormat.missing),
      );
    }
    return AppDropdownFormField<String>(
      name: 'organization',
      label: l10n.adminFilterOrganization,
      required: true,
      initialValue: organizationId,
      onChanged: (value) {
        if (value != null) {
          context.read<TableFormCubit>().selectOrganization(value);
        }
      },
      items: [
        for (final org in active)
          AppDropdownItem(value: org.id, label: org.name),
      ],
    );
  }

  List<Widget> _buildFacilitatorFields(
    BuildContext context,
    List<AdminPerson> people,
    Set<String?> facilitatingIds,
    bool hasOrganization,
  ) {
    final l10n = context.l10n;
    final candidates = people
        .where(
          (p) =>
              !p.isStaff &&
              p.status != PersonStatus.inactive &&
              !facilitatingIds.contains(p.id) &&
              p.tables.every((t) => t.role.name != 'facilitator'),
        )
        .toList();
    return [
      if (!_newFacilitator)
        AppDropdownFormField<String>(
          name: 'facilitator',
          label: l10n.adminFieldTableFacilitator,
          required: true,
          enabled: hasOrganization,
          hint: candidates.isEmpty ? l10n.adminNoFacilitatorCandidates : null,
          items: [
            for (final p in candidates)
              AppDropdownItem(
                value: p.id,
                label: p.status == PersonStatus.invited
                    ? '${p.fullName} · ${l10n.adminPersonStatusInvited}'
                    : p.fullName,
              ),
          ],
        )
      else ...[
        AppTextFormField(
          name: 'newFirstName',
          label: l10n.adminFieldFirstName,
          kind: AppFieldKind.personName,
          required: true,
        ),
        const SizedBox(height: AppSpacing.md),
        AppTextFormField(
          name: 'newLastName',
          label: l10n.adminFieldLastName,
          kind: AppFieldKind.personName,
          required: true,
        ),
        const SizedBox(height: AppSpacing.md),
        AppTextFormField(
          name: 'newEmail',
          label: l10n.adminFieldEmail,
          kind: AppFieldKind.email,
          required: true,
          helper: l10n.adminFieldInviteEmailHelper,
        ),
        const SizedBox(height: AppSpacing.md),
        AppTextFormField(
          name: 'newPhone',
          label: l10n.adminFieldPhone,
          kind: AppFieldKind.phone,
          helper: l10n.adminFieldPhoneHelper,
        ),
      ],
      const SizedBox(height: AppSpacing.sm),
      AppButton(
        label: _newFacilitator
            ? l10n.adminPickExistingFacilitator
            : l10n.adminInviteNewFacilitator,
        icon: _newFacilitator
            ? Icons.people_alt_rounded
            : Icons.person_add_alt_1_rounded,
        variant: AppButtonVariant.ghost,
        fullWidth: false,
        onPressed: hasOrganization
            ? () => setState(() => _newFacilitator = !_newFacilitator)
            : null,
      ),
      Text(
        l10n.adminFacilitatorRequiredHint,
        style: context.textTheme.bodySmall,
      ),
    ];
  }

  void _submit(TableFormState state, String? organizationId) {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    final cubit = context.read<TableFormCubit>();
    final table = state.data.table;
    final code = (values['code'] as String).trim().toUpperCase();
    if (table != null) {
      final time = values['time'] as String;
      final weekday = _changed(values['weekday'] as int, table.weekday);
      final startTime = _changed(time, table.startTimeShort);
      final timezone = _changed(values['timezone'] as String, table.timezone);
      final effectiveFrom = values['scheduleEffectiveFrom'] as DateTime?;
      final scheduleChanged =
          weekday != null || startTime != null || timezone != null;
      final input = TableInput(
        name: _changed(values['name'] as String, table.name),
        code: _changed(code, table.code),
        locationId: _changed(values['location'] as String?, table.locationId),
        weekday: weekday,
        startTime: startTime,
        timezone: timezone,
        scheduleEffectiveFrom: scheduleChanged && effectiveFrom != null
            ? AdminDateTimeFormField.isoDate(effectiveFrom)
            : null,
        status: _changed(values['status'] as RoundTableStatus?, table.status),
        currentValueId: _changed(
          values['programValue'] as String?,
          table.currentValueId,
        ),
      );
      cubit.update(table.id, input);
      return;
    }
    final orgId = organizationId ?? values['organization'] as String?;
    if (orgId == null) return;
    final PersonRef facilitator = _newFacilitator
        ? PersonRef.registered(
            PersonInput(
              firstName: values['newFirstName'] as String,
              lastName: values['newLastName'] as String,
              email: values['newEmail'] as String,
              phone: (values['newPhone'] as String?)?.isEmpty ?? true
                  ? null
                  : values['newPhone'] as String,
            ),
          )
        : PersonRef.existing(values['facilitator'] as String);
    cubit.create(
      organizationId: orgId,
      input: TableInput(
        locationId: values['location'] as String,
        name: (values['name'] as String).trim(),
        code: code,
        weekday: values['weekday'] as int,
        startTime: values['time'] as String,
        timezone: values['timezone'] as String,
        startValueId: values['programValue'] as String?,
      ),
      facilitator: facilitator,
    );
  }

  T? _changed<T>(T? value, T? original) => value == original ? null : value;
}
