import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../extensions/build_context_x.dart';
import '../../theme/app_spacing.dart';
import '../app_icon_button.dart';

/// Integer stepper ( − value + ) bounded by [min] and [max].
class AppCounterFormField extends StatelessWidget {
  const AppCounterFormField({
    super.key,
    required this.name,
    required this.label,
    this.min = 0,
    this.max = 99,
    this.initialValue,
    this.enabled = true,
    this.onChanged,
  });

  final String name;
  final String label;
  final int min;
  final int max;
  final int? initialValue;
  final bool enabled;
  final ValueChanged<int?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<int>(
      name: name,
      initialValue: initialValue ?? min,
      enabled: enabled,
      onChanged: onChanged,
      builder: (field) => _buildField(context, field),
    );
  }

  Widget _buildField(BuildContext context, FormFieldState<int> field) {
    final l10n = context.l10n;
    final value = field.value ?? min;
    final canDecrease = enabled && value > min;
    final canIncrease = enabled && value < max;
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        errorText: field.errorText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xs,
          vertical: AppSpacing.xs,
        ),
      ),
      child: Row(
        children: [
          AppIconButton(
            icon: Icons.remove_rounded,
            tooltip: l10n.tooltipDecrease,
            onPressed: canDecrease ? () => field.didChange(value - 1) : null,
          ),
          Expanded(
            child: Semantics(
              liveRegion: true,
              label: l10n.counterSemantics(label, value),
              excludeSemantics: true,
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: context.textStyles.number,
              ),
            ),
          ),
          AppIconButton(
            icon: Icons.add_rounded,
            tooltip: l10n.tooltipIncrease,
            onPressed: canIncrease ? () => field.didChange(value + 1) : null,
          ),
        ],
      ),
    );
  }
}
