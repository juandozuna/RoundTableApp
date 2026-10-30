import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../domain/models/curriculum_view.dart';

/// Name and code of a language to add.
typedef NewLanguage = ({String code, String name});

/// Dialogs of the curriculum page that collect a few new values.
abstract final class CurriculumTextDialogs {
  static Future<NewLanguage?> addLanguage(BuildContext context) =>
      showDialog<NewLanguage>(
        context: context,
        builder: (_) => const _AddLanguageDialog(),
      );

  static Future<({String code, String text, QuestionResponseType type})?>
  addQuestion(BuildContext context, {required String valueName}) => showDialog(
    context: context,
    builder: (_) => _AddQuestionDialog(valueName: valueName),
  );
}

class _AddLanguageDialog extends StatefulWidget {
  const _AddLanguageDialog();

  @override
  State<_AddLanguageDialog> createState() => _AddLanguageDialogState();
}

class _AddLanguageDialogState extends State<_AddLanguageDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.curriculumAddLanguage),
      content: SizedBox(
        width: 440,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextFormField(
                name: 'name',
                label: l10n.curriculumFieldLanguageName,
                hint: l10n.curriculumFieldLanguageNameHint,
                required: true,
                autofocus: true,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextFormField(
                name: 'code',
                label: l10n.curriculumFieldLanguageCode,
                hint: l10n.curriculumFieldLanguageCodeHint,
                helper: l10n.curriculumFieldLanguageCodeHelper,
                required: true,
                maxLength: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          label: l10n.curriculumAddLanguageConfirm,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: _submit,
        ),
      ],
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    Navigator.of(context).pop((
      code: (form.value['code'] as String).trim().toLowerCase(),
      name: (form.value['name'] as String).trim(),
    ));
  }
}

class _AddQuestionDialog extends StatefulWidget {
  const _AddQuestionDialog({required this.valueName});

  final String valueName;

  @override
  State<_AddQuestionDialog> createState() => _AddQuestionDialogState();
}

class _AddQuestionDialogState extends State<_AddQuestionDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.curriculumAddQuestionTitle(widget.valueName)),
      content: SizedBox(
        width: 520,
        child: FormBuilder(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextFormField(
                  name: 'text',
                  label: l10n.curriculumFieldQuestionText,
                  required: true,
                  maxLines: 3,
                  autofocus: true,
                ),
                const SizedBox(height: AppSpacing.md),
                AppTextFormField(
                  name: 'code',
                  label: l10n.curriculumFieldQuestionCode,
                  helper: l10n.curriculumFieldQuestionCodeHelper,
                  required: true,
                  maxLength: 40,
                ),
                const SizedBox(height: AppSpacing.md),
                AppDropdownFormField<QuestionResponseType>(
                  name: 'type',
                  label: l10n.curriculumFieldResponseType,
                  initialValue: QuestionResponseType.text,
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
              ],
            ),
          ),
        ),
      ),
      actions: [
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          label: l10n.curriculumAddQuestionConfirm,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: _submit,
        ),
      ],
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final values = form.value;
    Navigator.of(context).pop((
      code: (values['code'] as String).trim().toLowerCase(),
      text: (values['text'] as String).trim(),
      type:
          (values['type'] as QuestionResponseType?) ??
          QuestionResponseType.text,
    ));
  }
}
