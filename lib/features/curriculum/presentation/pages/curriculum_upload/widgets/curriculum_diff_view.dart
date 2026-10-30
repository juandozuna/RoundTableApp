import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_card.dart';
import '../../../../../../core/widgets/status_pill.dart';
import '../../../../../../l10n/gen/app_localizations.dart';
import '../../../../domain/models/curriculum_plan.dart';

/// The diff of an upload: what is new, what changes and what is refused.
class CurriculumDiffView extends StatelessWidget {
  const CurriculumDiffView({super.key, required this.plan});

  final CurriculumPlan plan;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (plan.isEmpty) {
      return AppCard(
        child: Row(
          children: [
            Icon(Icons.check_circle_rounded, color: context.statusColors.ok),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: Text(
                l10n.curriculumNoChanges,
                style: context.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildSummary(context),
        if (plan.refused.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.md),
          _buildRefused(context),
        ],
        const SizedBox(height: AppSpacing.md),
        for (final change in plan.changes) _buildChange(context, change),
      ],
    );
  }

  Widget _buildSummary(BuildContext context) {
    final l10n = context.l10n;
    final counts = {
      CurriculumChangeAction.create: (StatusTone.ok, l10n.curriculumDiffNew),
      CurriculumChangeAction.update: (
        StatusTone.info,
        l10n.curriculumDiffChanged,
      ),
      CurriculumChangeAction.reactivate: (
        StatusTone.ok,
        l10n.curriculumDiffReactivated,
      ),
      CurriculumChangeAction.deactivate: (
        StatusTone.pending,
        l10n.curriculumDiffDeactivated,
      ),
      CurriculumChangeAction.delete: (
        StatusTone.error,
        l10n.curriculumDiffRemoved,
      ),
    };
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        for (final entry in counts.entries)
          if (plan.countOf(entry.key) > 0)
            StatusPill(
              tone: entry.value.$1,
              label: '${plan.countOf(entry.key)} ${entry.value.$2}',
            ),
      ],
    );
  }

  Widget _buildRefused(BuildContext context) {
    final l10n = context.l10n;
    final error = context.statusColors.error;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.block_rounded, color: error),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  l10n.curriculumRefusedTitle,
                  style: context.textTheme.titleSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final refusal in plan.refused)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: Text(
                '${refusal.label}: ${refusal.message}',
                style: context.textTheme.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildChange(BuildContext context, CurriculumChange change) {
    final l10n = context.l10n;
    final (tone, action) = switch (change.action) {
      CurriculumChangeAction.create => (StatusTone.ok, l10n.curriculumDiffNew),
      CurriculumChangeAction.update => (
        StatusTone.info,
        l10n.curriculumDiffChanged,
      ),
      CurriculumChangeAction.reactivate => (
        StatusTone.ok,
        l10n.curriculumDiffReactivated,
      ),
      CurriculumChangeAction.deactivate => (
        StatusTone.pending,
        l10n.curriculumDiffDeactivated,
      ),
      CurriculumChangeAction.delete => (
        StatusTone.error,
        l10n.curriculumDiffRemoved,
      ),
    };
    final entity = switch (change.entity) {
      CurriculumEntity.module => l10n.curriculumEntityModule,
      CurriculumEntity.value => l10n.curriculumEntityValue,
      CurriculumEntity.question => l10n.curriculumEntityQuestion,
    };
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                StatusPill(tone: tone, label: action),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    '$entity ${change.key} · ${change.label}',
                    style: context.textTheme.titleSmall,
                  ),
                ),
              ],
            ),
            if (change.answered)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  l10n.curriculumDiffKeptBecauseAnswered,
                  style: context.textTheme.bodySmall,
                ),
              ),
            for (final field in change.fields.entries)
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.xs),
                child: Text(
                  l10n.curriculumDiffField(
                    _fieldLabel(l10n, field.key),
                    field.value.from ?? l10n.curriculumDiffEmpty,
                    field.value.to ?? l10n.curriculumDiffEmpty,
                  ),
                  style: context.textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _fieldLabel(AppLocalizations l10n, String field) => switch (field) {
    'name' => l10n.curriculumFieldName,
    'description' => l10n.curriculumFieldDescription,
    'booklet_reference' => l10n.curriculumFieldBooklet,
    'text' => l10n.curriculumFieldQuestionText,
    'sort_order' => l10n.curriculumFieldOrder,
    'response_type' => l10n.curriculumFieldResponseType,
    'status' => l10n.curriculumFieldStatus,
    _ => field,
  };
}
