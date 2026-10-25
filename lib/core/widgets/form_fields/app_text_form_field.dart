import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../constants/app_constants.dart';
import '../../extensions/build_context_x.dart';
import '../../form_rules/app_field_kind.dart';

/// Text field whose keyboard, formatting, validation and saved value come
/// from its [kind]. The saved value is normalized (e.g. E.164 phone).
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.name,
    required this.label,
    this.kind = AppFieldKind.text,
    this.required = false,
    this.minLength = AppLimits.shortTextMinLength,
    this.initialValue,
    this.hint,
    this.helper,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
    this.textInputAction,
    this.onSubmitted,
    this.onChanged,
    this.prefixIcon,
  });

  final String name;
  final String label;
  final AppFieldKind kind;
  final bool required;
  final int minLength;
  final String? initialValue;
  final String? hint;
  final String? helper;
  final int maxLines;
  final int? maxLength;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueChanged<String?>? onSubmitted;
  final ValueChanged<String?>? onChanged;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      maxLines: maxLines,
      minLines: maxLines > 1 ? 2 : null,
      maxLength: maxLength,
      keyboardType: maxLines > 1 ? TextInputType.multiline : kind.keyboardType,
      textCapitalization: kind.textCapitalization,
      autofillHints: kind.autofillHints,
      inputFormatters: kind.inputFormatters,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      onChanged: onChanged,
      style: context.textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: required ? '$label *' : label,
        hintText: hint,
        helperText: helper,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
      ),
      validator: kind.validator(
        context.l10n,
        required: required,
        minLength: minLength,
      ),
      valueTransformer: kind.transform,
    );
  }
}
