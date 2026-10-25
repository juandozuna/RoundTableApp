import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../extensions/build_context_x.dart';
import '../../form_rules/field_error.dart';
import '../../form_rules/field_validators.dart';
import '../../theme/app_spacing.dart';
import '../score_grid.dart';

/// Form field around [ScoreGrid]: 1–10, 5 not allowed.
class AppScoreFormField extends StatelessWidget {
  const AppScoreFormField({
    super.key,
    required this.name,
    required this.label,
    this.required = true,
    this.initialValue,
    this.enabled = true,
    this.onChanged,
  });

  final String name;
  final String label;
  final bool required;
  final int? initialValue;
  final bool enabled;
  final ValueChanged<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderField<int>(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      validator: (value) {
        if (required && value == null) return FieldError.required.message(l10n);
        return FieldValidators.score(value)?.message(l10n);
      },
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(label, style: context.textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          ScoreGrid(
            value: field.value,
            onChanged: enabled ? field.didChange : null,
            errorText: field.errorText,
          ),
        ],
      ),
    );
  }
}
