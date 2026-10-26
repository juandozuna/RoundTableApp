import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../../../core/widgets/app_message.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../kpis/kpis_routes.dart';
import '../../../admin_routes.dart';
import '../../../domain/explorer/explorer_engine.dart';
import '../../../domain/models/admin_person.dart';
import '../../../domain/models/person_status.dart';
import '../../admin_error_messages.dart';
import '../../admin_format.dart';
import '../../widgets/admin_denied_view.dart';
import '../../widgets/admin_page_frame.dart';
import '../../widgets/admin_status_pills.dart';
import '../../widgets/explorer_labels.dart';
import '../../widgets/section_card.dart';
import 'cubit/person_detail_cubit.dart';
import 'cubit/person_detail_state.dart';

/// Contact data, roles and seats of one person; deactivate / reactivate.
class PersonDetailPage extends StatelessWidget {
  const PersonDetailPage({super.key, required this.personId});

  final String personId;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PersonDetailCubit>();
    return AdminPageFrame(
      title: context.l10n.adminPersonTitle,
      backFallbackLocation: AdminRoutes.explorer,
      maxContentWidth: 860,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      builder: (context, access) =>
          BlocConsumer<PersonDetailCubit, PersonDetailState>(
            listenWhen: (a, b) =>
                (b.changedTo != null && a.changedTo != b.changedTo) ||
                (b.actionError != null && a.actionError != b.actionError),
            listener: (context, state) {
              final l10n = context.l10n;
              final error = state.actionError;
              if (error != null) {
                AppToast.show(
                  context,
                  error.adminMessage(l10n),
                  kind: AppToastKind.error,
                );
              } else if (state.changedTo != null) {
                final name = state.person?.fullName ?? '';
                AppToast.show(
                  context,
                  state.changedTo == PersonStatus.inactive
                      ? l10n.adminToastPersonDeactivated(name)
                      : l10n.adminToastPersonReactivated(name),
                  kind: AppToastKind.success,
                );
              }
            },
            builder: (context, state) {
              final l10n = context.l10n;
              switch (state.status) {
                case PersonDetailStatus.loading:
                  return ListView(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSpacing.lg,
                    ),
                    children: const [SkeletonList(count: 4, itemHeight: 96)],
                  );
                case PersonDetailStatus.failure:
                  final denied =
                      state.error?.kind.name == 'notFound' ||
                      state.error?.kind.name == 'forbidden';
                  return denied
                      ? AdminDeniedView(
                          title: l10n.adminDeniedPersonTitle,
                          message: l10n.adminDeniedPersonMessage,
                          homeLocation: AdminRoutes.explorer,
                        )
                      : ErrorState(
                          message: state.error?.adminMessage(l10n),
                          onRetry: () => cubit.load(personId),
                        );
                case PersonDetailStatus.ready:
                  return _buildPerson(
                    context,
                    state.person!,
                    writable:
                        access.online &&
                        !state.working &&
                        (access.scope!.isAdministrator ||
                            !state.person!.isStaff),
                  );
              }
            },
          ),
    );
  }

  Widget _buildPerson(
    BuildContext context,
    AdminPerson person, {
    required bool writable,
  }) {
    final l10n = context.l10n;
    final cubit = context.read<PersonDetailCubit>();
    final kind = ExplorerEngine.personKind(person);
    Widget row(String label, String? value, {String? hint}) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 130,
            child: Text(label.toUpperCase(), style: context.textStyles.kicker),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value ?? AdminFormat.missing),
                if (hint != null)
                  Text(hint, style: context.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Wrap(
          spacing: AppSpacing.md,
          runSpacing: AppSpacing.sm,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AppAvatar(name: person.fullName, size: 52),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ExplorerLabels.personKind(context, kind).toUpperCase(),
                  style: context.textStyles.kicker,
                ),
                Text(person.fullName, style: context.textTheme.headlineMedium),
              ],
            ),
            PersonStatusPill(status: person.status),
            if (person.status == PersonStatus.inactive)
              AppButton(
                label: l10n.adminReactivate,
                icon: Icons.person_add_alt_1_rounded,
                variant: AppButtonVariant.secondary,
                size: AppButtonSize.small,
                fullWidth: false,
                onPressed: writable ? () => cubit.setActive(true) : null,
              )
            else
              AppButton(
                label: l10n.adminDeactivatePerson,
                icon: Icons.person_off_rounded,
                variant: AppButtonVariant.danger,
                size: AppButtonSize.small,
                fullWidth: false,
                onPressed: writable ? () => _deactivate(context, person) : null,
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        if (person.status == PersonStatus.invited)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.md),
            child: AppMessage(
              tone: StatusTone.pending,
              title: l10n.adminPersonInvitedTitle,
              detail: l10n.adminPersonInvitedDetail,
            ),
          ),
        SectionCard(
          title: l10n.adminPersonData,
          child: Column(
            children: [
              row(l10n.adminFieldEmail, person.email),
              row(
                l10n.adminFieldPhone,
                person.phone,
                hint: l10n.adminPhoneUnverified,
              ),
              row(l10n.adminFieldPosition, person.position),
              row(
                l10n.adminFieldLinkedAccount,
                person.linked ? l10n.adminLinkedYes : l10n.adminLinkedNo,
              ),
            ],
          ),
        ),
        SectionCard(
          title: l10n.adminRolesAndTables,
          child: _buildAssignments(context, person),
        ),
      ],
    );
  }

  Widget _buildAssignments(BuildContext context, AdminPerson person) {
    final l10n = context.l10n;
    if (person.roles.isEmpty && person.tables.isEmpty) {
      return EmptyState(
        icon: Icons.assignment_ind_rounded,
        title: l10n.adminPersonNoAssignments,
        message: l10n.adminPersonNoAssignmentsMessage,
      );
    }
    return Column(
      children: [
        for (final role in person.roles)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.shield_rounded),
            title: Text(
              role.role == 'platform_admin'
                  ? l10n.roleAdministrator
                  : l10n.roleCoordinator,
            ),
          ),
        for (final table in person.tables)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.table_restaurant_rounded),
            title: Text(table.roundTableName ?? table.roundTableId),
            subtitle: Text(
              table.role.name == 'facilitator'
                  ? l10n.roleFacilitator
                  : l10n.roleMember,
            ),
            trailing: Wrap(
              children: [
                AppIconButton(
                  tooltip: l10n.adminSeeAnswersOf(person.fullName),
                  icon: Icons.visibility_rounded,
                  onPressed: () => context.push(
                    KpisRoutes.memberDetailPath(
                      tableId: table.roundTableId,
                      personId: person.id,
                    ),
                  ),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
            onTap: () =>
                context.push(AdminRoutes.tablePath(table.roundTableId)),
          ),
      ],
    );
  }

  Future<void> _deactivate(BuildContext context, AdminPerson person) async {
    final l10n = context.l10n;
    final cubit = context.read<PersonDetailCubit>();
    final ok = await AppDialogs.confirm(
      context,
      title: l10n.adminDeactivatePersonTitle(person.fullName),
      message: l10n.adminDeactivatePersonMessage,
      confirmLabel: l10n.adminDeactivate,
      destructive: true,
    );
    if (ok) await cubit.setActive(false);
  }
}
