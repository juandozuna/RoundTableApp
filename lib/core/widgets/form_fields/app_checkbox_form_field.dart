import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../extensions/build_context_x.dart';
import '../../form_rules/field_error.dart';

/// Checkbox with a tappable label row (44 px+ target).
class AppCheckboxFormField extends StatelessWidget {
  const AppCheckboxFormField({
    super.key,
    required this.name,
    required this.label,
    this.mustBeChecked = false,
    this.initialValue = false,
    this.enabled = true,
    this.onChanged,
  });

  final String name;
  final String label;

  /// Fails validation while unchecked (consents, confirmations).
  final bool mustBeChecked;
  final bool initialValue;
  final bool enabled;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderCheckbox(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      decoration: const InputDecoration(
        border: InputBorder.none,
        filled: false,
        contentPadding: EdgeInsets.zero,
      ),
      title: Text(label, style: context.textTheme.bodyLarge),
      validator: (value) => mustBeChecked && value != true
          ? FieldError.required.message(context.l10n)
          : null,
    );
  }
}
