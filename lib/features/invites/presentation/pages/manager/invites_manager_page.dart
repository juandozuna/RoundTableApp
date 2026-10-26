import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_chip.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../core/widgets/offline_banner.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../auth/auth_routes.dart';
import '../../../../auth/presentation/widgets/context_switcher.dart';
import '../../../domain/models/invite.dart';
import '../../../domain/models/invite_problem.dart';
import '../../../domain/models/invite_status.dart';
import '../../../invites_routes.dart';
import '../../widgets/invite_labels.dart';
import '../../widgets/invite_problem_text.dart';
import '../../widgets/invite_status_pill.dart';
import 'cubit/invites_manager_cubit.dart';
import 'cubit/invites_manager_state.dart';

/// Invites of the current context with status filters, search, and
/// share / renew / revoke (bulk on tablet and desktop).
class InvitesManagerPage extends StatelessWidget {
  const InvitesManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<InvitesManagerCubit, InvitesManagerState>(
      listenWhen: (a, b) => a.event != b.event && b.event != null,
      listener: _onEvent,
      builder: (context, state) => AppScaffold(
        actions: const [ContextSwitcher()],
        maxContentWidth: 1180,
        banner: state.online
            ? null
            : OfflineBanner(
                detail: l10n.offlineDetailOnlineOnly,
                onRetry: context.read<InvitesManagerCubit>().load,
              ),
        body: _buildBody(context, state),
      ),
    );
  }

  void _onEvent(BuildContext context, InvitesManagerState state) {
    final event = state.event!;
    final l10n = context.l10n;
    switch (event.kind) {
      case InvitesManagerEventKind.renewed:
        AppToast.show(
          context,
          l10n.invitesToastRenewed(event.count),
          kind: AppToastKind.success,
        );
      case InvitesManagerEventKind.revoked:
        AppToast.show(
          context,
          l10n.invitesToastRevoked(event.count),
          kind: AppToastKind.success,
        );
      case InvitesManagerEventKind.failed:
        AppToast.show(
          context,
          (event.problem ?? InviteProblem.generic).message(context),
          kind: AppToastKind.error,
        );
    }
  }

  Widget _buildBody(BuildContext context, InvitesManagerState state) {
    final l10n = context.l10n;
    final cubit = context.read<InvitesManagerCubit>();
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        _buildHeader(context, state),
        const SizedBox(height: AppSpacing.md),
        switch (state.status) {
          InvitesManagerStatus.denied => _denied(context),
          InvitesManagerStatus.loading => const SkeletonList(count: 4),
          InvitesManagerStatus.failed => ErrorState(
            message: state.problem == InviteProblem.offline
                ? l10n.invitesOfflineList
                : (state.problem ?? InviteProblem.generic).message(context),
            onRetry: cubit.load,
          ),
          InvitesManagerStatus.ready => _buildList(context, state),
        },
      ],
    );
  }

  Widget _buildHeader(BuildContext context, InvitesManagerState state) {
    final l10n = context.l10n;
    final canCreate = state.status != InvitesManagerStatus.denied;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            l10n.invitesManagerTitle,
            style: context.textTheme.headlineMedium,
          ),
        ),
        if (canCreate)
          AppButton(
            label: l10n.invitesInviteAction,
            icon: Icons.add_rounded,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: () => context.push(InvitesRoutes.create),
          ),
      ],
    );
  }

  Widget _denied(BuildContext context) {
    final l10n = context.l10n;
    return EmptyState(
      icon: Icons.lock_outline_rounded,
      title: l10n.invitesDeniedTitle,
      message: l10n.invitesDeniedBody,
      actionLabel: l10n.actionGoHome,
      onAction: () => context.go(AuthRoutes.appRoot),
    );
  }

  Widget _buildList(BuildContext context, InvitesManagerState state) {
    final l10n = context.l10n;
    final cubit = context.read<InvitesManagerCubit>();
    if (state.invites.isEmpty) {
      return EmptyState(
        icon: Icons.mail_outline_rounded,
        title: l10n.invitesEmptyTitle,
        message: l10n.invitesEmptyBody,
        actionLabel: l10n.invitesEmptyAction,
        onAction: () => context.push(InvitesRoutes.create),
      );
    }
    final rows = state.visible;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FormBuilder(
          child: AppTextFormField(
            name: 'q',
            label: l10n.invitesSearchLabel,
            hint: l10n.invitesSearchHint,
            prefixIcon: Icons.search_rounded,
            onChanged: (value) => cubit.setQuery(value ?? ''),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            AppChip(
              label: l10n.invitesFilterAll,
              selected: state.filter == null,
              count: state.countFor(null),
              onSelected: (_) => cubit.setFilter(null),
            ),
            for (final status in InviteStatus.values)
              AppChip(
                label: InviteLabels.status(context, status),
                selected: state.filter == status,
                count: state.countFor(status),
                onSelected: (_) => cubit.setFilter(status),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        if (state.selectedIds.isNotEmpty && !context.layout.isPhone)
          _buildBulkBar(context, state),
        if (rows.isEmpty)
          EmptyState(
            icon: Icons.filter_list_off_rounded,
            title: l10n.invitesFilterEmptyTitle,
            message: l10n.invitesFilterEmptyBody,
            actionLabel: l10n.invitesFilterShowAll,
            onAction: () => cubit.setFilter(null),
          )
        else
          AppDataTable<Invite>(
            rows: rows,
            columns: _columns(context, state),
            phoneCardBuilder: (context, invite) =>
                _buildInviteCard(context, invite, state),
            isSelected: (invite) => state.selectedIds.contains(invite.id),
            onSelectChanged: (invite, _) => cubit.toggleSelected(invite.id),
          ),
      ],
    );
  }

  List<AppDataColumn<Invite>> _columns(
    BuildContext context,
    InvitesManagerState state,
  ) {
    final l10n = context.l10n;
    return [
      AppDataColumn<Invite>(
        label: l10n.invitesColumnPerson,
        flex: 3,
        cellBuilder: (context, invite) => Row(
          children: [
            AppAvatar(name: invite.person.fullName, size: 34),
            const SizedBox(width: AppSpacing.sm),
            Expanded(child: _buildPersonText(context, invite)),
          ],
        ),
      ),
      AppDataColumn<Invite>(
        label: l10n.invitesColumnRoleScope,
        flex: 3,
        cellBuilder: (context, invite) => Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(InviteLabels.role(context, invite.roleKind)),
            Text(invite.scopeName, style: context.textTheme.bodySmall),
          ],
        ),
      ),
      AppDataColumn<Invite>(
        label: l10n.invitesColumnStatus,
        flex: 2,
        cellBuilder: (context, invite) =>
            InviteStatusPill(status: invite.status),
      ),
      AppDataColumn<Invite>(
        label: l10n.invitesColumnDetail,
        flex: 2,
        cellBuilder: (context, invite) => Text(_detail(context, invite)),
      ),
      AppDataColumn<Invite>(
        label: '',
        flex: 4,
        cellBuilder: (context, invite) => Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: _buildInviteActions(context, invite, state),
        ),
      ),
    ];
  }

  Widget _buildBulkBar(BuildContext context, InvitesManagerState state) {
    final l10n = context.l10n;
    final cubit = context.read<InvitesManagerCubit>();
    final open = state.selected
        .where((invite) => invite.status.isOpen)
        .toList();
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: context.colors.accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadii.md),
        border: Border.all(color: context.colors.accent, width: 1.5),
      ),
      child: Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.xs,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            l10n.invitesSelectedCount(state.selectedIds.length),
            style: context.textTheme.labelLarge,
          ),
          AppButton(
            label: state.allVisibleSelected
                ? l10n.invitesUnselectAll
                : l10n.invitesSelectAll,
            variant: AppButtonVariant.ghost,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: cubit.toggleAllVisible,
          ),
          AppButton(
            label: l10n.invitesRenewAction,
            icon: Icons.autorenew_rounded,
            variant: AppButtonVariant.secondary,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: state.online && !state.busy && open.isNotEmpty
                ? () => cubit.renew([for (final invite in open) invite.id])
                : null,
          ),
          AppButton(
            label: l10n.invitesRevokeAction,
            icon: Icons.block_rounded,
            variant: AppButtonVariant.danger,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: state.online && !state.busy && open.isNotEmpty
                ? () => confirmRevoke(context, [
                    for (final invite in open) invite,
                  ])
                : null,
          ),
          AppButton(
            label: l10n.invitesClearSelection,
            variant: AppButtonVariant.ghost,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: cubit.clearSelection,
          ),
        ],
      ),
    );
  }

  static String _detail(BuildContext context, Invite invite) {
    final l10n = context.l10n;
    final loc = MaterialLocalizations.of(context);
    String date(DateTime? value) =>
        value == null ? '' : loc.formatMediumDate(value.toLocal());
    return switch (invite.status) {
      InviteStatus.pending => l10n.invitesDetailExpires(date(invite.expiresAt)),
      InviteStatus.accepted => l10n.invitesDetailAccepted(
        date(invite.acceptedAt),
      ),
      InviteStatus.expired => l10n.invitesDetailExpired(date(invite.expiresAt)),
      InviteStatus.revoked => l10n.invitesDetailRevoked(date(invite.revokedAt)),
    };
  }

  Widget _buildPersonText(BuildContext context, Invite invite) {
    final struck = invite.status == InviteStatus.revoked;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          invite.person.fullName,
          overflow: TextOverflow.ellipsis,
          style: context.textTheme.titleSmall!.copyWith(
            decoration: struck ? TextDecoration.lineThrough : null,
          ),
        ),
        if (invite.person.email != null)
          Text(
            invite.person.email!,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall,
          ),
      ],
    );
  }

  Widget _buildInviteCard(
    BuildContext context,
    Invite invite,
    InvitesManagerState state,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppAvatar(name: invite.person.fullName, size: 44),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPersonText(context, invite),
              Text(
                '${InviteLabels.role(context, invite.roleKind)} · ${invite.scopeName}',
                style: context.textTheme.bodySmall,
              ),
              Text(
                _detail(context, invite),
                style: context.textTheme.bodySmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              InviteStatusPill(status: invite.status),
              const SizedBox(height: AppSpacing.sm),
              _buildInviteActions(context, invite, state),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInviteActions(
    BuildContext context,
    Invite invite,
    InvitesManagerState state,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<InvitesManagerCubit>();
    final enabled = state.online && !state.busy;
    if (!invite.status.isOpen) {
      return Text(l10n.invitesNoActions, style: context.textTheme.bodySmall);
    }
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        if (invite.status.canShare)
          AppButton(
            label: l10n.invitesShareAction,
            icon: Icons.send_rounded,
            variant: AppButtonVariant.secondary,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: () =>
                context.push(InvitesRoutes.shareFor(invite.id), extra: invite),
          ),
        AppButton(
          label: l10n.invitesRenewAction,
          icon: Icons.autorenew_rounded,
          variant: AppButtonVariant.secondary,
          size: AppButtonSize.small,
          fullWidth: false,
          onPressed: enabled
              ? () async {
                  final renewed = await cubit.renew([invite.id]);
                  if (renewed != null && context.mounted) {
                    unawaited(
                      context.push(
                        InvitesRoutes.shareFor(renewed.id),
                        extra: renewed,
                      ),
                    );
                  }
                }
              : null,
        ),
        AppButton(
          label: l10n.invitesRevokeAction,
          icon: Icons.block_rounded,
          variant: AppButtonVariant.danger,
          size: AppButtonSize.small,
          fullWidth: false,
          onPressed: enabled ? () => confirmRevoke(context, [invite]) : null,
        ),
      ],
    );
  }
}

/// Asks before revoking; revoking frees the seat a pending invite holds.
Future<void> confirmRevoke(BuildContext context, List<Invite> invites) async {
  final l10n = context.l10n;
  final cubit = context.read<InvitesManagerCubit>();
  final confirmed = await AppDialogs.confirm(
    context,
    title: invites.length == 1
        ? l10n.invitesRevokeConfirmTitleOne(invites.first.person.firstName)
        : l10n.invitesRevokeConfirmTitleMany(invites.length),
    message: l10n.invitesRevokeConfirmBody,
    confirmLabel: l10n.invitesRevokeConfirmAction,
    destructive: true,
  );
  if (confirmed) await cubit.revoke([for (final invite in invites) invite.id]);
}
