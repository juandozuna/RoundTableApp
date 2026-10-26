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
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/seat_pips.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../admin_routes.dart';
import '../../../domain/models/admin_table.dart';
import '../../../domain/models/invite_request.dart';
import '../../../domain/models/person_input.dart';
import '../../../domain/models/round_table_status.dart';
import '../../admin_error_messages.dart';
import '../../widgets/admin_page_frame.dart';
import 'cubit/invite_person_cubit.dart';
import 'cubit/invite_person_state.dart';
import 'widgets/invite_share_card.dart';

/// Invite a coordinator, facilitator or member, then share the code and link.
/// Reuses nothing from the sign-in feature: it calls the `invites` function
/// through the administration data layer.
class InvitePersonPage extends StatefulWidget {
  const InvitePersonPage({super.key});

  @override
  State<InvitePersonPage> createState() => _InvitePersonPageState();
}

class _InvitePersonPageState extends State<InvitePersonPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminPageFrame(
      title: l10n.adminInvitePerson,
      backFallbackLocation: AdminRoutes.explorer,
      maxContentWidth: 760,
      builder: (context, access) =>
          BlocConsumer<InvitePersonCubit, InvitePersonState>(
            listenWhen: (a, b) =>
                b.error != null &&
                a.error != b.error &&
                b.status == InvitePersonStatus.editing,
            listener: (context, state) => AppToast.show(
              context,
              state.error!.adminMessage(l10n),
              kind: AppToastKind.error,
            ),
            builder: (context, state) => _buildState(
              context,
              state,
              access.online,
              access.scope!.isAdministrator,
              access.scope!.organizationId,
            ),
          ),
    );
  }

  Widget _buildState(
    BuildContext context,
    InvitePersonState state,
    bool online,
    bool isAdministrator,
    String? ownOrganizationId,
  ) {
    final l10n = context.l10n;
    switch (state.status) {
      case InvitePersonStatus.loading:
        return ListView(
          children: const [SkeletonList(count: 4, itemHeight: 72)],
        );
      case InvitePersonStatus.failure:
        return ErrorState(
          message: state.error?.adminMessage(l10n),
          onRetry: () => context.read<InvitePersonCubit>().init(
            role: state.role,
            organizationId: state.organizationId,
            tableId: state.tableId,
          ),
        );
      case InvitePersonStatus.shared:
        return _buildShared(context, state);
      case InvitePersonStatus.editing:
      case InvitePersonStatus.submitting:
        return _buildForm(
          context,
          state,
          online,
          isAdministrator,
          ownOrganizationId,
        );
    }
  }

  Widget _buildShared(BuildContext context, InvitePersonState state) {
    final l10n = context.l10n;
    final invite = state.invite!;
    final cubit = context.read<InvitePersonCubit>();
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        AppMessage(
          tone: StatusTone.ok,
          title: l10n.adminInviteCreatedTitle(invite.personName),
          detail: l10n.adminInviteCreatedDetail,
        ),
        const SizedBox(height: AppSpacing.md),
        InviteShareCard(
          invite: invite,
          onShare: (message) => cubit.share(message, subject: l10n.appTitle),
        ),
        AppButton(
          label: l10n.adminInviteAnother,
          icon: Icons.add_rounded,
          onPressed: cubit.inviteAnother,
        ),
        const SizedBox(height: AppSpacing.sm),
        AppButton(
          label: l10n.adminBackToExplorer,
          variant: AppButtonVariant.secondary,
          onPressed: () => context.go(AdminRoutes.explorer),
        ),
      ],
    );
  }

  Widget _buildForm(
    BuildContext context,
    InvitePersonState state,
    bool online,
    bool isAdministrator,
    String? ownOrganizationId,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<InvitePersonCubit>();
    final submitting = state.status == InvitePersonStatus.submitting;
    final roles = [
      if (isAdministrator) InviteRoleKind.coordinator,
      InviteRoleKind.facilitator,
      InviteRoleKind.member,
    ];
    final role = roles.contains(state.role) ? state.role : roles.first;
    final tables = state.tables
        .where((t) => t.status == RoundTableStatus.active)
        .where((t) => role != InviteRoleKind.facilitator || !t.hasFacilitator)
        .toList();
    final chosen = state.tableId == null
        ? null
        : tables.where((t) => t.id == state.tableId).firstOrNull;
    final organizationId = state.organizationId ?? ownOrganizationId;
    return FormBuilder(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        children: [
          Text(
            l10n.adminSectionRoleScope.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppDropdownFormField<InviteRoleKind>(
            name: 'role',
            label: l10n.adminColRole,
            required: true,
            initialValue: role,
            onChanged: (value) {
              if (value != null) cubit.selectRole(value);
            },
            items: [
              for (final r in roles)
                AppDropdownItem(value: r, label: _roleLabel(context, r)),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          if (isAdministrator)
            AppDropdownFormField<String>(
              name: 'organization',
              label: l10n.adminFilterOrganization,
              required: true,
              initialValue: organizationId,
              onChanged: (value) {
                if (value != null) cubit.selectOrganization(value);
              },
              items: [
                for (final org in state.organizations)
                  AppDropdownItem(value: org.id, label: org.name),
              ],
            )
          else
            InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.adminFilterOrganization,
                prefixIcon: const Icon(Icons.lock_rounded),
              ),
              child: Text(
                state.organizations
                        .where((o) => o.id == organizationId)
                        .map((o) => o.name)
                        .firstOrNull ??
                    '',
              ),
            ),
          if (role != InviteRoleKind.coordinator) ...[
            const SizedBox(height: AppSpacing.md),
            AppDropdownFormField<String>(
              // Rebuilt when the options change so the old pick is dropped.
              key: ValueKey('table-$organizationId-$role'),
              name: 'table',
              label: l10n.adminColTable,
              required: true,
              initialValue: chosen?.id,
              hint: tables.isEmpty ? l10n.adminNoTablesForInvite : null,
              onChanged: cubit.selectTable,
              items: [
                for (final t in tables)
                  AppDropdownItem(
                    value: t.id,
                    label: role == InviteRoleKind.member
                        ? '${t.code} · ${t.name} · ${t.activePeople}/${t.maxPeople}${t.isFull ? ' · ${l10n.adminTableFull}' : ''}'
                        : '${t.code} · ${t.name}',
                  ),
              ],
            ),
            if (chosen != null && role == InviteRoleKind.member)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md),
                child: _buildSeats(context, chosen),
              ),
          ],
          const SizedBox(height: AppSpacing.xl),
          Text(
            l10n.adminSectionPerson.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppTextFormField(
                  name: 'firstName',
                  label: l10n.adminFieldFirstName,
                  kind: AppFieldKind.personName,
                  required: true,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextFormField(
                  name: 'lastName',
                  label: l10n.adminFieldLastName,
                  kind: AppFieldKind.personName,
                  required: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'position',
            label: l10n.adminFieldPositionOptional,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'email',
            label: l10n.adminFieldEmail,
            kind: AppFieldKind.email,
            required: true,
            helper: l10n.adminFieldInviteEmailHelper,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'phone',
            label: l10n.adminFieldPhone,
            kind: AppFieldKind.phone,
            helper: l10n.adminFieldPhoneHelper,
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(
            label: l10n.adminCreateAndInvite,
            icon: Icons.check_rounded,
            loading: submitting,
            onPressed: online && !submitting && !(chosen?.isFull ?? false)
                ? _submit
                : null,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: l10n.actionCancel,
            variant: AppButtonVariant.secondary,
            onPressed: () => context.canPop()
                ? context.pop()
                : context.go(AdminRoutes.explorer),
          ),
        ],
      ),
    );
  }

  Widget _buildSeats(BuildContext context, AdminTable table) {
    final l10n = context.l10n;
    return AppMessage(
      tone: table.isFull ? StatusTone.error : StatusTone.info,
      title: l10n.adminSeatsOf(table.code),
      detail: table.isFull
          ? l10n.adminErrorTableFull
          : l10n.adminSeatsLeft(table.maxPeople - table.activePeople),
      icon: Icons.groups_rounded,
      action: SeatPips(taken: table.activePeople, capacity: table.maxPeople),
    );
  }

  String _roleLabel(BuildContext context, InviteRoleKind role) {
    final l10n = context.l10n;
    return switch (role) {
      InviteRoleKind.coordinator => l10n.roleCoordinator,
      InviteRoleKind.facilitator => l10n.roleFacilitator,
      InviteRoleKind.member => l10n.roleMember,
    };
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    String? text(String key) {
      final value = (values[key] as String?)?.trim();
      return value == null || value.isEmpty ? null : value;
    }

    context.read<InvitePersonCubit>().submit(
      PersonInput(
        firstName: values['firstName'] as String,
        lastName: values['lastName'] as String,
        position: text('position'),
        email: text('email'),
        phone: text('phone'),
      ),
    );
  }
}
