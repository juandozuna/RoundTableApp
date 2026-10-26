import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/network/api_error_messages.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_chip.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../admin/presentation/admin_format.dart';
import '../../../../admin/presentation/widgets/admin_page_frame.dart';
import '../../../../admin/presentation/widgets/admin_search_field.dart';
import '../../../../kpis/domain/models/csv_document.dart';
import '../../../domain/models/audit_category.dart';
import '../../../domain/models/audit_event.dart';
import '../../audit_labels.dart';
import 'cubit/audit_cubit.dart';
import 'cubit/audit_state.dart';

/// "Auditoría": who did what, newest first. Read-only.
class AuditPage extends StatelessWidget {
  const AuditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuditCubit>();
    return AdminPageFrame(
      title: context.l10n.auditTitle,
      showPalette: true,
      maxContentWidth: 980,
      onReconnect: cubit.refresh,
      onRetry: cubit.refresh,
      builder: (context, access) => BlocBuilder<AuditCubit, AuditState>(
        builder: (context, state) {
          final l10n = context.l10n;
          if (state.status == AuditStatus.loading) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
              children: const [SkeletonList(count: 6, itemHeight: 72)],
            );
          }
          if (state.status == AuditStatus.failure) {
            return ErrorState(
              message: state.error?.userMessage(l10n),
              onRetry: cubit.load,
            );
          }
          return _buildList(
            context,
            state,
            access.scope!.isAdministrator,
            access.scope!.organizationName,
            access.online,
          );
        },
      ),
    );
  }

  Widget _buildList(
    BuildContext context,
    AuditState state,
    bool isAdministrator,
    String? organizationName,
    bool online,
  ) {
    final l10n = context.l10n;
    final cubit = context.read<AuditCubit>();
    final events = cubit.visible((e) => AuditLabels.matchText(context, e));
    final refined =
        state.category != null ||
        state.organizationId != null ||
        state.search.isNotEmpty;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (isAdministrator
                            ? l10n.auditScopePlatform
                            : organizationName ?? '')
                        .toUpperCase(),
                    style: context.textStyles.kicker,
                  ),
                  Text(
                    l10n.auditTitle,
                    style: context.textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            AppButton(
              label: l10n.adminExportCsv,
              icon: Icons.download_rounded,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: events.isEmpty ? null : () => _export(context, events),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.sm),
                child: AppChip(
                  label: l10n.auditAllTypes,
                  selected: state.category == null,
                  onSelected: (_) => cubit.setCategory(null),
                ),
              ),
              for (final category in AuditCategory.values)
                Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: AppChip(
                    label: AuditLabels.category(l10n, category),
                    icon: AuditLabels.categoryIcon(category),
                    selected: state.category == category,
                    onSelected: (_) => cubit.setCategory(
                      state.category == category ? null : category,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            AdminSearchField(
              hint: l10n.auditSearchHint,
              initialText: state.search,
              onChanged: cubit.search,
            ),
            if (isAdministrator && state.organizations.length > 1)
              DropdownButton<String?>(
                value: state.organizationId,
                hint: Text(l10n.auditAllOrganizations),
                onChanged: cubit.setOrganization,
                items: [
                  DropdownMenuItem<String?>(
                    value: null,
                    child: Text(l10n.auditAllOrganizations),
                  ),
                  for (final org in state.organizations)
                    DropdownMenuItem<String?>(
                      value: org.id,
                      child: Text(org.name),
                    ),
                ],
              )
            else if (!isAdministrator && organizationName != null)
              Chip(
                avatar: const Icon(Icons.lock_rounded, size: 16),
                label: Text(l10n.adminOrganizationLock(organizationName)),
              ),
            if (refined)
              TextButton(
                onPressed: cubit.clearFilters,
                child: Text(l10n.adminClearFilters),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        if (events.isEmpty)
          EmptyState(
            icon: Icons.list_alt_rounded,
            title: l10n.auditEmptyTitle,
            message: l10n.auditEmptyMessage,
            actionLabel: refined ? l10n.adminClearFilters : null,
            onAction: cubit.clearFilters,
          )
        else
          for (final event in events)
            _buildEvent(context, event, isAdministrator),
        const SizedBox(height: AppSpacing.sm),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                l10n.auditFooter(events.length),
                style: context.textTheme.bodySmall,
              ),
            ),
            Text(
              online ? l10n.connectivityOnline : l10n.adminDataSavedReadOnly,
              style: context.textTheme.bodySmall,
            ),
          ],
        ),
        if (state.hasMore)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.md),
            child: AppButton(
              label: l10n.auditLoadMore,
              variant: AppButtonVariant.secondary,
              loading: state.refreshing,
              onPressed: online ? cubit.loadMore : null,
            ),
          ),
      ],
    );
  }

  Widget _buildEvent(
    BuildContext context,
    AuditEvent event,
    bool showOrganization,
  ) {
    final l10n = context.l10n;
    final category = AuditCategory.forEventType(event.eventType);
    final detail = AuditLabels.detail(l10n, event);
    final actor = event.actorName ?? l10n.auditSystemActor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: context.colors.line),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppAvatar(name: actor, size: 36),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(actor, style: context.textTheme.titleSmall),
                Text(
                  AuditLabels.subject(l10n, event),
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  [
                    if (detail.isNotEmpty) detail,
                    if (showOrganization && event.organizationName != null)
                      event.organizationName!,
                  ].join(' · '),
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StatusPill(
                tone: category == AuditCategory.sensitive
                    ? StatusTone.late
                    : StatusTone.info,
                label: AuditLabels.event(l10n, event.eventType),
                icon: AuditLabels.categoryIcon(category),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                AdminFormat.dateTime(event.createdAt),
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _export(BuildContext context, List<AuditEvent> events) {
    final l10n = context.l10n;
    final cubit = context.read<AuditCubit>();
    return cubit.exportCsv(
      CsvDocument(
        filename: 'auditoria.csv',
        headers: [
          l10n.auditColDate,
          l10n.auditColActor,
          l10n.auditColEvent,
          l10n.auditColSubject,
          l10n.auditColDetail,
          l10n.adminColOrganization,
        ],
        rows: [
          for (final e in events)
            [
              e.createdAt.toUtc().toIso8601String(),
              e.actorName ?? '',
              AuditLabels.event(l10n, e.eventType),
              AuditLabels.subject(l10n, e),
              AuditLabels.detail(l10n, e),
              e.organizationName ?? '',
            ],
        ],
      ),
    );
  }
}
