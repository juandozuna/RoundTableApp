import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../constants/app_constants.dart';
import '../../extensions/build_context_x.dart';
import '../../form_rules/app_field_kind.dart';
import '../../theme/app_spacing.dart';

/// Text field whose keyboard, formatting, validation and saved value come
/// from its [kind]. The saved value is normalized (e.g. E.164 phone).
class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.name,
    this.label,
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
    this.controller,
    this.errorText,
    this.autofocus = false,
    this.dense = false,
  });

  final String name;

  /// Floating label; omit for hint-only inputs such as search boxes.
  final String? label;
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

  /// For text owned outside the form (e.g. a Cubit draft that can be replaced
  /// from elsewhere); the field then follows this controller.
  final TextEditingController? controller;

  /// Error decided outside the form (e.g. by a Cubit's domain validation);
  /// shown instead of the [kind] validator's message.
  final String? errorText;
  final bool autofocus;

  /// Compact height for toolbars (search boxes).
  final bool dense;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: controller == null ? initialValue : null,
      controller: controller,
      enabled: enabled,
      autofocus: autofocus,
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
        labelText: label == null ? null : (required ? '$label *' : label),
        hintText: hint,
        helperText: helper,
        errorText: errorText,
        errorMaxLines: errorText == null ? null : 3,
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        isDense: dense ? true : null,
        contentPadding: dense
            ? const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.md,
              )
            : null,
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
