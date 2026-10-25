import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../extensions/build_context_x.dart';
import '../../form_rules/field_error.dart';

/// One option of an [AppDropdownFormField].
class AppDropdownItem<T> {
  const AppDropdownItem({required this.value, required this.label});

  final T value;
  final String label;
}

class AppDropdownFormField<T> extends StatelessWidget {
  const AppDropdownFormField({
    super.key,
    required this.name,
    required this.label,
    required this.items,
    this.required = false,
    this.initialValue,
    this.hint,
    this.enabled = true,
    this.onChanged,
  });

  final String name;
  final String label;
  final List<AppDropdownItem<T>> items;
  final bool required;
  final T? initialValue;
  final String? hint;
  final bool enabled;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderDropdown<T>(
      name: name,
      initialValue: initialValue,
      enabled: enabled,
      onChanged: onChanged,
      isExpanded: true,
      style: context.textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: required ? '$label *' : label,
        hintText: hint ?? l10n.dropdownHint,
      ),
      validator: (value) =>
          required && value == null ? FieldError.required.message(l10n) : null,
      items: [
        for (final item in items)
          DropdownMenuItem<T>(value: item.value, child: Text(item.label)),
      ],
    );
  }
}
