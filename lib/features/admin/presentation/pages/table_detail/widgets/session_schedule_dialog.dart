import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../widgets/admin_date_time_form_field.dart';

/// A date and time chosen for a session, as a wall-clock time in the table's
/// timezone, with an optional reason.
typedef SessionSlotChoice = ({DateTime when, String? reason});

/// Asks for the new date and time of a session: used both to reschedule one
/// and to add an extraordinary one.
class SessionScheduleDialog extends StatefulWidget {
  const SessionScheduleDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmLabel,
    this.initial,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final DateTime? initial;

  static Future<SessionSlotChoice?> show(
    BuildContext context, {
    required String title,
    required String message,
    required String confirmLabel,
    DateTime? initial,
  }) => showDialog<SessionSlotChoice>(
    context: context,
    builder: (_) => SessionScheduleDialog(
      title: title,
      message: message,
      confirmLabel: confirmLabel,
      initial: initial,
    ),
  );

  @override
  State<SessionScheduleDialog> createState() => _SessionScheduleDialogState();
}

class _SessionScheduleDialogState extends State<SessionScheduleDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: 420,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(widget.message),
              const SizedBox(height: AppSpacing.md),
              AdminDateTimeFormField(
                name: 'when',
                label: l10n.adminFieldDateTime,
                required: true,
                initialValue: widget.initial,
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextFormField(
                name: 'reason',
                label: l10n.adminSessionReason,
                maxLength: 300,
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
          label: widget.confirmLabel,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: _confirm,
        ),
      ],
    );
  }

  void _confirm() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final reason = (form.value['reason'] as String?)?.trim();
    Navigator.of(context).pop((
      when: form.value['when'] as DateTime,
      reason: reason == null || reason.isEmpty ? null : reason,
    ));
  }
}
