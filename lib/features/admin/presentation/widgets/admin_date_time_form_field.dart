import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/form_rules/field_error.dart';
import '../admin_format.dart';

/// FormBuilder field that picks a date, and optionally a time of day, and
/// stores a wall-clock [DateTime] (no timezone: the server reads it in the
/// table's own zone).
class AdminDateTimeFormField extends StatelessWidget {
  const AdminDateTimeFormField({
    super.key,
    required this.name,
    required this.label,
    this.initialValue,
    this.required = false,
    this.withTime = true,
    this.firstDate,
  });

  final String name;
  final String label;
  final DateTime? initialValue;
  final bool required;
  final bool withTime;

  /// Earliest selectable day; today when absent.
  final DateTime? firstDate;

  /// `yyyy-MM-dd` of a picked date, as sent to the API.
  static String isoDate(DateTime value) =>
      '${value.year.toString().padLeft(4, '0')}-'
      '${value.month.toString().padLeft(2, '0')}-'
      '${value.day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final today = DateTime.now();
    final first = firstDate ?? DateTime(today.year, today.month, today.day);
    return FormBuilderField<DateTime>(
      name: name,
      initialValue: initialValue,
      validator: (value) =>
          required && value == null ? FieldError.required.message(l10n) : null,
      builder: (field) => InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => _pick(field, first),
        child: InputDecorator(
          isEmpty: field.value == null,
          decoration: InputDecoration(
            labelText: required ? '$label *' : label,
            errorText: field.errorText,
            suffixIcon: Icon(
              withTime ? Icons.event_rounded : Icons.calendar_today_rounded,
            ),
          ),
          child: Text(
            field.value == null
                ? ''
                : withTime
                ? AdminFormat.wallClock(field.value!)
                : AdminFormat.wallDate(field.value!),
            style: context.textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }

  Future<void> _pick(FormFieldState<DateTime> field, DateTime first) async {
    final context = field.context;
    final current = field.value;
    final day = await showDatePicker(
      context: context,
      initialDate: current != null && !current.isBefore(first)
          ? current
          : first,
      firstDate: first,
      lastDate: DateTime(first.year + 2, first.month, first.day),
    );
    if (day == null || !context.mounted) return;
    if (!withTime) {
      field.didChange(day);
      return;
    }
    final time = await showTimePicker(
      context: context,
      initialTime: current == null
          ? const TimeOfDay(hour: 19, minute: 0)
          : TimeOfDay(hour: current.hour, minute: current.minute),
    );
    if (time == null) return;
    field.didChange(
      DateTime(day.year, day.month, day.day, time.hour, time.minute),
    );
  }
}
