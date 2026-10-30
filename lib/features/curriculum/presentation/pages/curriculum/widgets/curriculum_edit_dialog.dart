import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/form_fields/app_checkbox_form_field.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../../admin/domain/models/record_status.dart';
import '../../../../domain/models/curriculum_edit.dart';
import '../../../../domain/models/curriculum_plan.dart';
import '../../../../domain/models/curriculum_view.dart';

/// What the edit dialog changes: the item, its current texts and, for a
/// translation, the Spanish text it translates.
class CurriculumEditTarget {
  const CurriculumEditTarget({
    required this.entity,
    required this.id,
    required this.title,
    required this.baseName,
    this.baseDescription,
    this.name,
    this.description,
    this.bookletReference,
    this.responseType = QuestionResponseType.text,
    this.status = RecordStatus.active,
    this.typeLocked = false,
    this.locale,
  });

  final CurriculumEntity entity;
  final String id;
  final String title;

  /// Spanish name (or question text); shown read-only above a translation.
  final String baseName;
  final String? baseDescription;
  final String? name;
  final String? description;
  final String? bookletReference;
  final QuestionResponseType responseType;
  final RecordStatus status;

  /// The question already has answers: its answer type cannot change.
  final bool typeLocked;

  /// Language being translated; null edits the Spanish base.
  final String? locale;

  bool get isTranslation => locale != null;
  bool get isQuestion => entity == CurriculumEntity.question;
}

/// Dialog to edit the text of a module, value or question (base or
/// translation). Resolves to the edit to send, or null when cancelled.
class CurriculumEditDialog extends StatefulWidget {
  const CurriculumEditDialog({super.key, required this.target});

  final CurriculumEditTarget target;

  static Future<CurriculumEdit?> show(
    BuildContext context,
    CurriculumEditTarget target,
  ) => showDialog<CurriculumEdit>(
    context: context,
    builder: (_) => CurriculumEditDialog(target: target),
  );

  @override
  State<CurriculumEditDialog> createState() => _CurriculumEditDialogState();
}

class _CurriculumEditDialogState extends State<CurriculumEditDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  CurriculumEditTarget get _target => widget.target;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(_target.title),
      content: SizedBox(
        width: 520,
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _buildFields(context),
            ),
          ),
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        0,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      actions: [
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          label: l10n.curriculumSave,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: _submit,
        ),
      ],
    );
  }

  List<Widget> _buildFields(BuildContext context) {
    final l10n = context.l10n;
    final target = _target;
    final nameLabel = target.isQuestion
        ? l10n.curriculumFieldQuestionText
        : l10n.curriculumFieldName;
    return [
      if (target.isTranslation) ...[
        Text(
          l10n.curriculumSpanishText.toUpperCase(),
          style: context.textStyles.kicker,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(target.baseName, style: context.textTheme.bodyMedium),
        if ((target.baseDescription ?? '').isNotEmpty)
          Text(target.baseDescription!, style: context.textTheme.bodySmall),
        const SizedBox(height: AppSpacing.md),
      ],
      AppTextFormField(
        name: target.isQuestion ? 'text' : 'name',
        label: nameLabel,
        required: !target.isTranslation,
        initialValue: target.name,
        maxLines: target.isQuestion ? 3 : 1,
        autofocus: true,
      ),
      if (!target.isQuestion) ...[
        const SizedBox(height: AppSpacing.md),
        AppTextFormField(
          name: 'description',
          label: l10n.curriculumFieldDescription,
          initialValue: target.description,
          maxLines: 3,
        ),
      ],
      if (target.entity == CurriculumEntity.value && !target.isTranslation) ...[
        const SizedBox(height: AppSpacing.md),
        AppTextFormField(
          name: 'booklet',
          label: l10n.curriculumFieldBooklet,
          initialValue: target.bookletReference,
        ),
      ],
      if (target.isQuestion && !target.isTranslation) ...[
        const SizedBox(height: AppSpacing.md),
        AppDropdownFormField<QuestionResponseType>(
          name: 'type',
          label: l10n.curriculumFieldResponseType,
          initialValue: target.responseType,
          enabled: !target.typeLocked,
          items: [
            AppDropdownItem(
              value: QuestionResponseType.text,
              label: l10n.curriculumResponseText,
            ),
            AppDropdownItem(
              value: QuestionResponseType.person,
              label: l10n.curriculumResponsePerson,
            ),
          ],
        ),
        if (target.typeLocked)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Text(
              l10n.curriculumTypeLockedHint,
              style: context.textTheme.bodySmall,
            ),
          ),
        const SizedBox(height: AppSpacing.md),
        AppCheckboxFormField(
          name: 'active',
          label: l10n.curriculumFieldQuestionActive,
          initialValue: target.status == RecordStatus.active,
        ),
      ],
    ];
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    String? text(String key) => (values[key] as String?)?.trim() ?? '';
    final target = _target;
    final edit = target.isQuestion
        ? CurriculumEdit(
            entity: target.entity,
            id: target.id,
            locale: target.locale,
            text: text('text'),
            responseType: target.isTranslation || target.typeLocked
                ? null
                : values['type'] as QuestionResponseType?,
            status: target.isTranslation
                ? null
                : (values['active'] == true
                      ? RecordStatus.active
                      : RecordStatus.inactive),
          )
        : CurriculumEdit(
            entity: target.entity,
            id: target.id,
            locale: target.locale,
            name: text('name'),
            description: text('description'),
            bookletReference:
                target.entity == CurriculumEntity.value && !target.isTranslation
                ? text('booklet')
                : null,
          );
    Navigator.of(context).pop(edit);
  }
}
