import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../../../domain/models/session_cancel_reason.dart';

/// Why a session is cancelled, with an optional note.
typedef SessionCancelChoice = ({SessionCancelReason reason, String? note});

/// Confirms cancelling one session (holiday, force majeure, other). Says
/// plainly that the program value does not advance.
class CancelSessionDialog extends StatefulWidget {
  const CancelSessionDialog({super.key, required this.sessionDate});

  /// The session's date as shown to the admin.
  final String sessionDate;

  static Future<SessionCancelChoice?> show(
    BuildContext context, {
    required String sessionDate,
  }) => showDialog<SessionCancelChoice>(
    context: context,
    builder: (_) => CancelSessionDialog(sessionDate: sessionDate),
  );

  @override
  State<CancelSessionDialog> createState() => _CancelSessionDialogState();
}

class _CancelSessionDialogState extends State<CancelSessionDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.adminCancelSessionTitle),
      content: SizedBox(
        width: 420,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.adminCancelSessionMessage(widget.sessionDate)),
              const SizedBox(height: AppSpacing.md),
              AppDropdownFormField<SessionCancelReason>(
                name: 'reason',
                label: l10n.adminCancelReason,
                required: true,
                items: [
                  AppDropdownItem(
                    value: SessionCancelReason.holiday,
                    label: l10n.adminCancelReasonHoliday,
                  ),
                  AppDropdownItem(
                    value: SessionCancelReason.forceMajeure,
                    label: l10n.adminCancelReasonForceMajeure,
                  ),
                  AppDropdownItem(
                    value: SessionCancelReason.other,
                    label: l10n.adminCancelReasonOther,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              AppTextFormField(
                name: 'note',
                label: l10n.adminCancelNote,
                maxLength: 300,
              ),
            ],
          ),
        ),
      ),
      actions: [
        AppButton(
          label: l10n.adminCancelKeep,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(),
        ),
        AppButton(
          label: l10n.adminCancelConfirm,
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
    final note = (form.value['note'] as String?)?.trim();
    Navigator.of(context).pop((
      reason: form.value['reason'] as SessionCancelReason,
      note: note == null || note.isEmpty ? null : note,
    ));
  }
}
