import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../domain/models/admin_person.dart';

/// Adds a person who already belongs to the organization to the table.
class AddExistingMemberDialog extends StatefulWidget {
  const AddExistingMemberDialog({super.key, required this.candidates});

  final List<AdminPerson> candidates;

  static Future<AdminPerson?> show(
    BuildContext context,
    List<AdminPerson> candidates,
  ) => showDialog<AdminPerson>(
    context: context,
    builder: (_) => AddExistingMemberDialog(candidates: candidates),
  );

  @override
  State<AddExistingMemberDialog> createState() =>
      _AddExistingMemberDialogState();
}

class _AddExistingMemberDialogState extends State<AddExistingMemberDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.adminAddExistingMember),
      content: SizedBox(
        width: 420,
        child: FormBuilder(
          key: _formKey,
          child: widget.candidates.isEmpty
              ? AppMessage(
                  tone: StatusTone.info,
                  title: l10n.adminNoExistingCandidates,
                  detail: l10n.adminNoExistingCandidatesDetail,
                )
              : AppDropdownFormField<String>(
                  name: 'person',
                  label: l10n.adminPerson,
                  required: true,
                  items: [
                    for (final p in widget.candidates)
                      AppDropdownItem(value: p.id, label: p.fullName),
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
          label: l10n.adminAdd,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: widget.candidates.isEmpty
              ? null
              : () {
                  final form = _formKey.currentState;
                  if (form == null || !form.saveAndValidate()) return;
                  final id = form.value['person'] as String;
                  Navigator.of(
                    context,
                  ).pop(widget.candidates.firstWhere((p) => p.id == id));
                },
        ),
      ],
    );
  }
}
