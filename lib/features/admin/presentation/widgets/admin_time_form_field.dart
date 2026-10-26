import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/form_rules/field_error.dart';

/// FormBuilder field that picks a time of day and stores it as `HH:MM`.
class AdminTimeFormField extends StatelessWidget {
  const AdminTimeFormField({
    super.key,
    required this.name,
    required this.label,
    this.initialValue,
    this.required = false,
  });

  final String name;
  final String label;

  /// `HH:MM` (seconds are ignored).
  final String? initialValue;
  final bool required;

  static String format(TimeOfDay time) =>
      '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';

  static TimeOfDay? parse(String? value) {
    if (value == null || value.length < 5) return null;
    final hour = int.tryParse(value.substring(0, 2));
    final minute = int.tryParse(value.substring(3, 5));
    if (hour == null || minute == null) return null;
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderField<String>(
      name: name,
      initialValue: initialValue == null || initialValue!.length < 5
          ? null
          : initialValue!.substring(0, 5),
      validator: (value) => required && (value == null || value.isEmpty)
          ? FieldError.required.message(l10n)
          : null,
      builder: (field) => InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () async {
          final picked = await showTimePicker(
            context: field.context,
            initialTime:
                parse(field.value) ?? const TimeOfDay(hour: 19, minute: 0),
          );
          if (picked != null) field.didChange(format(picked));
        },
        child: InputDecorator(
          isEmpty: field.value == null,
          decoration: InputDecoration(
            labelText: required ? '$label *' : label,
            errorText: field.errorText,
            suffixIcon: const Icon(Icons.schedule_rounded),
          ),
          child: Text(field.value ?? '', style: context.textTheme.bodyLarge),
        ),
      ),
    );
  }
}
