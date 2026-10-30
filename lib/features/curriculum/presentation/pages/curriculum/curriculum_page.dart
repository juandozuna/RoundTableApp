import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_chip.dart';
import '../../../../../core/widgets/app_icon_button.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/empty_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../../admin/admin_routes.dart';
import '../../../../admin/domain/models/record_status.dart';
import '../../../../admin/presentation/admin_error_messages.dart';
import '../../../../admin/presentation/widgets/admin_denied_view.dart';
import '../../../../admin/presentation/widgets/admin_page_frame.dart';
import '../../../curriculum_routes.dart';
import '../../../domain/models/curriculum_edit.dart';
import '../../../domain/models/curriculum_plan.dart';
import '../../../domain/models/curriculum_view.dart';
import 'cubit/curriculum_cubit.dart';
import 'cubit/curriculum_state.dart';
import 'widgets/curriculum_edit_dialog.dart';
import 'widgets/curriculum_text_dialogs.dart';

/// "Currículo": modules, the 48 values and their reflection questions, in
/// Spanish or in any content language, with upload and per-item editing
/// (platform administrators, online only — ADR 0017).
class CurriculumPage extends StatelessWidget {
  const CurriculumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AdminPageFrame(
      title: l10n.curriculumTitle,
      maxContentWidth: 960,
      onReconnect: () => context.read<CurriculumCubit>().reload(),
      onRetry: () => context.read<CurriculumCubit>().reload(),
      builder: (context, access) {
        if (!access.scope!.isAdministrator) {
          return AdminDeniedView(
            message: l10n.curriculumDeniedMessage,
            homeLocation: AdminRoutes.explorer,
          );
        }
        return BlocConsumer<CurriculumCubit, CurriculumState>(
          listenWhen: (a, b) => b.notice != null || b.error != null,
          listener: _onOutcome,
          builder: (context, state) =>
              _buildBody(context, state, access.online),
        );
      },
    );
  }

  void _onOutcome(BuildContext context, CurriculumState state) {
    final l10n = context.l10n;
    final notice = state.notice;
    if (notice != null) {
      AppToast.show(context, switch (notice) {
        CurriculumNotice.saved => l10n.curriculumToastSaved,
        CurriculumNotice.unchanged => l10n.curriculumToastUnchanged,
        CurriculumNotice.questionAdded => l10n.curriculumToastQuestionAdded,
        CurriculumNotice.languageAdded => l10n.curriculumToastLanguageAdded,
      }, kind: AppToastKind.success);
    } else if (state.error != null) {
      AppToast.show(
        context,
        state.error!.adminMessage(l10n),
        kind: AppToastKind.error,
      );
    }
  }

  Widget _buildBody(BuildContext context, CurriculumState state, bool online) {
    final l10n = context.l10n;
    final view = state.view;
    if (state.status == CurriculumStatus.loading) {
      return ListView(children: const [SkeletonList(count: 5, itemHeight: 72)]);
    }
    if (view == null) {
      return ErrorState(
        message: state.error?.adminMessage(l10n),
        onRetry: () => context.read<CurriculumCubit>().reload(),
      );
    }
    final locale = state.locale;
    final canEdit = online && !state.saving;
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      children: [
        Text(l10n.curriculumIntro, style: context.textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.md),
        _buildLanguageBar(context, view, locale, canEdit),
        const SizedBox(height: AppSpacing.md),
        _buildActions(context, view, locale, online),
        if (locale != null) ...[
          const SizedBox(height: AppSpacing.md),
          _buildCompleteness(context, view),
        ],
        const SizedBox(height: AppSpacing.lg),
        for (final module in view.modules)
          _buildModule(context, module, locale, canEdit),
      ],
    );
  }

  // ── Languages ───────────────────────────────────────────────────────────

  Widget _buildLanguageBar(
    BuildContext context,
    CurriculumView view,
    String? locale,
    bool canEdit,
  ) {
    final l10n = context.l10n;
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final language in view.locales)
          AppChip(
            label: language.isDefault
                ? l10n.curriculumLanguageBase(language.name)
                : language.name,
            selected: language.isDefault
                ? locale == null
                : language.code == locale,
            icon: language.status == RecordStatus.inactive
                ? Icons.visibility_off_outlined
                : null,
            onSelected: (_) => context.go(
              CurriculumRoutes.curriculumPath(
                locale: language.isDefault ? null : language.code,
              ),
            ),
          ),
        AppButton(
          label: l10n.curriculumAddLanguage,
          icon: Icons.add_rounded,
          variant: AppButtonVariant.ghost,
          size: AppButtonSize.small,
          fullWidth: false,
          onPressed: canEdit ? () => _addLanguage(context) : null,
        ),
      ],
    );
  }

  /// The upload may change anything: reload when the person comes back.
  Future<void> _openUpload(BuildContext context, String? locale) async {
    final cubit = context.read<CurriculumCubit>();
    await context.push<void>(CurriculumRoutes.uploadPath(locale: locale));
    await cubit.reload();
  }

  Future<void> _addLanguage(BuildContext context) async {
    final cubit = context.read<CurriculumCubit>();
    final language = await CurriculumTextDialogs.addLanguage(context);
    if (language == null) return;
    await cubit.addLanguage(code: language.code, name: language.name);
    if (!context.mounted) return;
    context.go(CurriculumRoutes.curriculumPath(locale: language.code));
  }

  Widget _buildCompleteness(BuildContext context, CurriculumView view) {
    final l10n = context.l10n;
    final language = view.selectedLocale;
    if (language == null) return const SizedBox.shrink();
    final completeness = language.completeness ?? const LocaleCompleteness();
    final active = language.status == RecordStatus.active;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.curriculumCompleteness(
                    language.name,
                    completeness.translated,
                    completeness.total,
                    completeness.percent,
                  ),
                  style: context.textTheme.titleSmall,
                ),
              ),
              StatusPill(
                tone: active ? StatusTone.ok : StatusTone.neutral,
                label: active
                    ? l10n.curriculumLanguageActive
                    : l10n.curriculumLanguageHidden,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          LinearProgressIndicator(
            value: completeness.ratio,
            minHeight: 8,
            borderRadius: BorderRadius.circular(AppRadii.pill),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.curriculumCompletenessHint,
            style: context.textTheme.bodySmall,
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            label: active
                ? l10n.curriculumHideLanguage
                : l10n.curriculumShowLanguage,
            variant: AppButtonVariant.secondary,
            size: AppButtonSize.small,
            fullWidth: false,
            onPressed: () => context.read<CurriculumCubit>().setLanguageActive(
              language.code,
              active: !active,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions(
    BuildContext context,
    CurriculumView view,
    String? locale,
    bool online,
  ) {
    final l10n = context.l10n;
    final languageName = view.selectedLocale?.name;
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        AppButton(
          label: locale == null
              ? l10n.curriculumUpload
              : l10n.curriculumUploadTranslation(languageName ?? locale),
          icon: Icons.upload_file_rounded,
          fullWidth: false,
          onPressed: online ? () => _openUpload(context, locale) : null,
        ),
        AppButton(
          label: l10n.curriculumExport,
          icon: Icons.ios_share_rounded,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => context.read<CurriculumCubit>().shareExport(
            subject: l10n.curriculumExportSubject(languageName ?? 'Español'),
          ),
        ),
      ],
    );
  }

  // ── Tree ────────────────────────────────────────────────────────────────

  Widget _buildModule(
    BuildContext context,
    CurriculumModuleItem module,
    String? locale,
    bool canEdit,
  ) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: AppCard(
        padding: EdgeInsets.zero,
        child: ExpansionTile(
          shape: const Border(),
          collapsedShape: const Border(),
          title: Text(
            l10n.curriculumModuleTitle(
              module.number,
              _shown(module.name, module.translation?.name, locale),
            ),
            style: context.textTheme.titleMedium,
          ),
          subtitle: Text(
            l10n.curriculumValueCount(module.values.length),
            style: context.textTheme.bodySmall,
          ),
          trailing: _buildEditButton(
            context,
            tooltip: l10n.curriculumEditModule(module.number),
            enabled: canEdit,
            onPressed: () => _edit(
              context,
              CurriculumEditTarget(
                entity: CurriculumEntity.module,
                id: module.id,
                title: l10n.curriculumEditModule(module.number),
                baseName: module.name,
                baseDescription: module.description,
                name: locale == null ? module.name : module.translation?.name,
                description: locale == null
                    ? module.description
                    : module.translation?.description,
                locale: locale,
              ),
            ),
          ),
          children: [
            for (final value in module.values)
              _buildValue(context, value, locale, canEdit),
          ],
        ),
      ),
    );
  }

  Widget _buildValue(
    BuildContext context,
    CurriculumValueItem value,
    String? locale,
    bool canEdit,
  ) {
    final l10n = context.l10n;
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      shape: const Border(),
      collapsedShape: const Border(),
      title: Text(
        l10n.curriculumValueTitle(
          value.number,
          _shown(value.name, value.translation?.name, locale),
        ),
        style: context.textTheme.titleSmall,
      ),
      subtitle: Text(
        [
          l10n.curriculumQuestionCount(value.activeQuestions.length),
          if (value.usedByClosedSessions) l10n.curriculumUsedInSessions,
        ].join(' · '),
        style: context.textTheme.bodySmall,
      ),
      trailing: _buildEditButton(
        context,
        tooltip: l10n.curriculumEditValue(value.number),
        enabled: canEdit,
        onPressed: () => _edit(
          context,
          CurriculumEditTarget(
            entity: CurriculumEntity.value,
            id: value.id,
            title: l10n.curriculumEditValue(value.number),
            baseName: value.name,
            baseDescription: value.description,
            name: locale == null ? value.name : value.translation?.name,
            description: locale == null
                ? value.description
                : value.translation?.description,
            bookletReference: value.bookletReference,
            locale: locale,
          ),
        ),
      ),
      childrenPadding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        0,
        AppSpacing.lg,
        AppSpacing.md,
      ),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((value.description ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(
              _shown(
                value.description!,
                value.translation?.description,
                locale,
              ),
              style: context.textTheme.bodyMedium,
            ),
          ),
        if ((value.bookletReference ?? '').isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: Text(
              value.bookletReference!,
              style: context.textTheme.bodySmall,
            ),
          ),
        for (final question in value.questions)
          _buildQuestion(context, value, question, locale, canEdit),
        if (locale == null)
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton(
              label: l10n.curriculumAddQuestion,
              icon: Icons.add_rounded,
              variant: AppButtonVariant.ghost,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: canEdit ? () => _addQuestion(context, value) : null,
            ),
          ),
      ],
    );
  }

  Widget _buildQuestion(
    BuildContext context,
    CurriculumValueItem value,
    CurriculumQuestionItem question,
    String? locale,
    bool canEdit,
  ) {
    final l10n = context.l10n;
    final translated = question.translation?.text;
    final missing = locale != null && (translated ?? '').isEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _shown(question.text, translated, locale),
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: question.isActive ? null : context.colors.muted,
                    decoration: question.isActive
                        ? null
                        : TextDecoration.lineThrough,
                  ),
                ),
                if (missing)
                  Text(
                    l10n.curriculumUntranslated,
                    style: context.textTheme.bodySmall,
                  ),
                Wrap(
                  spacing: AppSpacing.sm,
                  children: [
                    Text(question.code, style: context.textTheme.bodySmall),
                    if (question.responseType == QuestionResponseType.person)
                      Text(
                        l10n.curriculumResponsePerson,
                        style: context.textTheme.bodySmall,
                      ),
                    if (!question.isActive)
                      Text(
                        l10n.curriculumQuestionInactive,
                        style: context.textTheme.bodySmall,
                      ),
                    if (question.answered)
                      Text(
                        l10n.curriculumQuestionAnswered,
                        style: context.textTheme.bodySmall,
                      ),
                  ],
                ),
              ],
            ),
          ),
          _buildEditButton(
            context,
            tooltip: l10n.curriculumEditQuestion(question.code),
            enabled: canEdit,
            onPressed: () => _edit(
              context,
              CurriculumEditTarget(
                entity: CurriculumEntity.question,
                id: question.id,
                title: l10n.curriculumEditQuestion(question.code),
                baseName: question.text,
                name: locale == null ? question.text : translated,
                responseType: question.responseType,
                status: question.status,
                typeLocked: question.answered,
                locale: locale,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEditButton(
    BuildContext context, {
    required String tooltip,
    required bool enabled,
    required VoidCallback onPressed,
  }) => AppIconButton(
    icon: Icons.edit_outlined,
    tooltip: tooltip,
    onPressed: enabled ? onPressed : null,
  );

  /// The language's text, or the Spanish base where it is not translated.
  String _shown(String base, String? translated, String? locale) =>
      locale != null && (translated ?? '').isNotEmpty ? translated! : base;

  Future<void> _edit(BuildContext context, CurriculumEditTarget target) async {
    final cubit = context.read<CurriculumCubit>();
    final edit = await CurriculumEditDialog.show(context, target);
    if (edit != null) await cubit.edit(edit);
  }

  Future<void> _addQuestion(
    BuildContext context,
    CurriculumValueItem value,
  ) async {
    final cubit = context.read<CurriculumCubit>();
    final question = await CurriculumTextDialogs.addQuestion(
      context,
      valueName: value.name,
    );
    if (question == null) return;
    await cubit.addQuestion(
      NewQuestion(
        valueId: value.id,
        code: question.code,
        text: question.text,
        responseType: question.type,
      ),
    );
  }
}
