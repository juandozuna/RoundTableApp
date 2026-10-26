import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/form_rules/app_field_kind.dart';
import '../../../../../core/models/user_role.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/seat_pips.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../auth/auth_routes.dart';
import '../../../../auth/presentation/widgets/context_switcher.dart';
import '../../../domain/models/invite_defaults.dart';
import '../../../domain/models/invite_problem.dart';
import '../../../domain/models/invite_role_kind.dart';
import '../../../domain/models/invite_target_table.dart';
import '../../../domain/models/person_draft.dart';
import '../../../invites_routes.dart';
import '../../widgets/invite_labels.dart';
import '../../widgets/invite_problem_text.dart';
import 'cubit/invite_form_cubit.dart';
import 'cubit/invite_form_state.dart';

/// Structured pre-registration: person, role (locked per inviter), table
/// with its seat meter. Online only.
class InviteFormPage extends StatefulWidget {
  const InviteFormPage({super.key});

  @override
  State<InviteFormPage> createState() => _InviteFormPageState();
}

class _InviteFormPageState extends State<InviteFormPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    String? text(String key) {
      final value = (values[key] as String?)?.trim();
      return value == null || value.isEmpty ? null : value;
    }

    context.read<InviteFormCubit>().submit(
      PersonDraft(
        firstName: text('first_name')!,
        lastName: text('last_name')!,
        position: text('position'),
        email: text('email'),
        phone: text('phone'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<InviteFormCubit, InviteFormState>(
      listenWhen: (a, b) => b.created != null && a.created != b.created,
      listener: (context, state) {
        final invite = state.created!;
        context.read<InviteFormCubit>().consumeCreated();
        context.pushReplacement(
          InvitesRoutes.shareFor(invite.id),
          extra: invite,
        );
      },
      builder: (context, state) => AppScaffold(
        backFallbackLocation: InvitesRoutes.manager,
        actions: const [ContextSwitcher()],
        maxContentWidth: 1080,
        banner: state.online
            ? null
            : OfflineBanner(detail: l10n.offlineDetailOnlineOnly),
        body: switch (state.status) {
          InviteFormStatus.loading => const Padding(
            padding: EdgeInsets.only(top: AppSpacing.lg),
            child: SkeletonList(count: 3, itemHeight: 88),
          ),
          InviteFormStatus.denied => EmptyState(
            icon: Icons.lock_outline_rounded,
            title: l10n.invitesDeniedTitle,
            message: l10n.invitesDeniedBody,
            actionLabel: l10n.actionGoHome,
            onAction: () => context.go(AuthRoutes.appRoot),
          ),
          InviteFormStatus.failed => ErrorState(
            message: (state.problem ?? InviteProblem.generic).message(context),
            onRetry: context.read<InviteFormCubit>().load,
          ),
          InviteFormStatus.ready => _buildForm(context, state),
        },
      ),
    );
  }

  Widget _buildForm(BuildContext context, InviteFormState state) {
    final l10n = context.l10n;
    final form = _buildFormColumn(context, state);
    final aside = _buildAside(context, state);
    final wide = context.layout.isDesktop;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Text(
          l10n.invitesFormKicker.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        Text(l10n.invitesFormHeadline, style: context.textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.xs),
        Text(l10n.invitesFormSubtitle, style: context.textTheme.bodySmall),
        const SizedBox(height: AppSpacing.lg),
        if (wide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 6, child: form),
              const SizedBox(width: AppSpacing.xl),
              Expanded(flex: 4, child: aside),
            ],
          )
        else ...[
          form,
          const SizedBox(height: AppSpacing.lg),
          aside,
        ],
      ],
    );
  }

  Widget _buildFormColumn(BuildContext context, InviteFormState state) {
    final l10n = context.l10n;
    final cubit = context.read<InviteFormCubit>();
    final role = state.inviterRole;
    return FormBuilder(
      key: _formKey,
      enabled: !state.submitting,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: AppTextFormField(
                  name: 'first_name',
                  label: l10n.invitesFieldFirstName,
                  kind: AppFieldKind.personName,
                  required: true,
                  textInputAction: TextInputAction.next,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: AppTextFormField(
                  name: 'last_name',
                  label: l10n.invitesFieldLastName,
                  kind: AppFieldKind.personName,
                  required: true,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'position',
            label: l10n.invitesFieldPositionOptional,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'email',
            label: l10n.invitesFieldEmail,
            kind: AppFieldKind.email,
            required: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'phone',
            label: l10n.invitesFieldPhone,
            kind: AppFieldKind.phone,
            required: true,
            helper: l10n.invitesPhoneUnverified,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.invitesFieldRole.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.xs),
          for (final option in InviteRoleKind.values)
            _buildRoleOption(
              context,
              kind: option,
              selected: state.role == option,
              enabled: state.roles.contains(option),
              note:
                  option == InviteRoleKind.facilitator && state.facilitatorTaken
                  ? l10n.invitesRoleFacilitatorTaken
                  : null,
              onTap: () => cubit.selectRole(option),
            ),
          if (role == UserRole.administrator) ...[
            const SizedBox(height: AppSpacing.md),
            AppDropdownFormField<String>(
              key: const ValueKey('organization'),
              name: 'organization',
              label: l10n.invitesFieldOrganization,
              initialValue: state.organizationId,
              items: [
                for (final org in state.organizations)
                  AppDropdownItem(value: org.id, label: org.name),
              ],
              onChanged: (value) {
                if (value != null) cubit.selectOrganization(value);
              },
            ),
          ],
          if (state.needsTable) ...[
            const SizedBox(height: AppSpacing.md),
            if (role == UserRole.facilitator)
              _buildLockedTable(context, table: state.selectedTable)
            else
              AppDropdownFormField<String>(
                key: ValueKey(
                  'table-${state.organizationId}-${state.tables.length}',
                ),
                name: 'table',
                label: l10n.invitesFieldTable,
                initialValue: state.tableId,
                items: [
                  for (final table in state.tables)
                    AppDropdownItem(
                      value: table.id,
                      label:
                          '${table.name} · ${table.activePeople}/${table.maxPeople}',
                    ),
                ],
                onChanged: cubit.selectTable,
              ),
          ],
          if (state.problem != null) ...[
            const SizedBox(height: AppSpacing.md),
            AppMessage(
              tone: state.problem == InviteProblem.offline
                  ? StatusTone.offline
                  : StatusTone.error,
              title: state.problem!.message(context),
            ),
          ],
          if (!state.online) ...[
            const SizedBox(height: AppSpacing.md),
            AppMessage(
              tone: StatusTone.offline,
              icon: Icons.cloud_off_rounded,
              title: l10n.invitesFormOfflineTitle,
              detail: l10n.invitesFormOfflineBody,
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            label: l10n.invitesCreateAction,
            icon: Icons.send_rounded,
            loading: state.submitting,
            onPressed: state.canSubmit ? _submit : null,
          ),
        ],
      ),
    );
  }

  Widget _buildAside(BuildContext context, InviteFormState state) {
    final l10n = context.l10n;
    final table = state.selectedTable;
    final children = <Widget>[];
    if (state.needsTable && table != null) {
      children.add(
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(table.name.toUpperCase(), style: context.textStyles.kicker),
              const SizedBox(height: AppSpacing.sm),
              SeatPips(taken: table.activePeople, capacity: table.maxPeople),
              const SizedBox(height: AppSpacing.sm),
              Text(
                table.isFull
                    ? l10n.invitesTableFull(table.activePeople, table.maxPeople)
                    : l10n.invitesSeatsFree(table.freeSeats),
                style: context.textTheme.titleSmall,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(l10n.invitesSeatsRule, style: context.textTheme.bodySmall),
            ],
          ),
        ),
      );
      if (table.isFull) {
        children.add(const SizedBox(height: AppSpacing.md));
        children.add(
          AppMessage(
            tone: StatusTone.error,
            icon: Icons.groups_rounded,
            title: l10n.invitesNoSeatsTitle,
            detail: l10n.invitesNoSeatsBody,
          ),
        );
      }
    } else if (!state.needsTable) {
      children.add(
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.invitesScopeKicker.toUpperCase(),
                style: context.textStyles.kicker,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.invitesScopeWholeOrganization(_organizationName(state)),
                style: context.textTheme.titleSmall,
              ),
              Text(
                l10n.invitesScopeCoordinatorNote,
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );
    }
    children
      ..add(const SizedBox(height: AppSpacing.md))
      ..add(
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.invitesWhatTheyGet.toUpperCase(),
                style: context.textStyles.kicker,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.invitesWhatTheyGetBody(InviteDefaults.expiresInDays),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  String _organizationName(InviteFormState state) {
    for (final org in state.organizations) {
      if (org.id == state.organizationId) return org.name;
    }
    final table = state.tables.firstOrNull;
    return table?.organizationName ?? '';
  }

  Widget _buildLockedTable(
    BuildContext context, {
    required InviteTargetTable? table,
  }) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.invitesFieldTable.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.xs),
        Container(
          constraints: const BoxConstraints(minHeight: AppSizes.control),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          decoration: BoxDecoration(
            color: context.colors.surfaceAlt,
            borderRadius: BorderRadius.circular(AppRadii.md),
            border: Border.all(color: context.colors.border, width: 2),
          ),
          child: Row(
            children: [
              const Icon(Icons.lock_outline_rounded, size: AppSizes.iconMd),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  table?.name ?? '',
                  style: context.textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.invitesFacilitatorOwnTable,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }

  Widget _buildRoleOption(
    BuildContext context, {
    required InviteRoleKind kind,
    required bool selected,
    required bool enabled,
    required VoidCallback onTap,
    String? note,
  }) {
    final l10n = context.l10n;
    final blocked = !enabled || note != null;
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Semantics(
        inMutuallyExclusiveGroup: true,
        checked: selected,
        enabled: !blocked,
        child: Opacity(
          opacity: blocked && !selected ? 0.7 : 1,
          child: AppCard(
            highlighted: selected,
            onTap: !enabled
                ? () => AppToast.show(context, l10n.invitesRoleLockedToast)
                : onTap,
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Icon(
                  selected
                      ? Icons.radio_button_checked_rounded
                      : Icons.radio_button_unchecked_rounded,
                  color: selected
                      ? context.colors.accent
                      : context.colors.muted,
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            InviteLabels.role(context, kind),
                            style: context.textTheme.titleSmall,
                          ),
                          if (!enabled) ...[
                            const SizedBox(width: AppSpacing.xs),
                            const Icon(
                              Icons.lock_outline_rounded,
                              size: AppSizes.iconSm,
                            ),
                          ],
                        ],
                      ),
                      Text(
                        !enabled
                            ? l10n.invitesRoleOnlyStaff
                            : note ??
                                  InviteLabels.roleDescription(context, kind),
                        style: context.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
