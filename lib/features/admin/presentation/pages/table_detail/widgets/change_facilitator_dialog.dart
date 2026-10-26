import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/form_fields/app_checkbox_form_field.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../domain/models/admin_person.dart';
import '../../../../domain/models/person_status.dart';
import '../../../../domain/models/table_detail.dart';

typedef FacilitatorChoice = ({AdminPerson person, bool keepPrevious});

/// Picks the new facilitator of a table; the previous one can stay as member.
class ChangeFacilitatorDialog extends StatefulWidget {
  const ChangeFacilitatorDialog({super.key, required this.detail});

  final TableDetail detail;

  static Future<FacilitatorChoice?> show(
    BuildContext context,
    TableDetail detail,
  ) => showDialog<FacilitatorChoice>(
    context: context,
    builder: (_) => ChangeFacilitatorDialog(detail: detail),
  );

  @override
  State<ChangeFacilitatorDialog> createState() =>
      _ChangeFacilitatorDialogState();
}

class _ChangeFacilitatorDialogState extends State<ChangeFacilitatorDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<AdminPerson> get _candidates {
    final current = widget.detail.table.facilitatorPersonId;
    return widget.detail.organizationPeople
        .where(
          (p) =>
              p.id != current &&
              !p.isStaff &&
              p.status != PersonStatus.inactive &&
              !p.isCoordinator,
        )
        .toList();
  }

  bool _isInTable(AdminPerson person) =>
      widget.detail.activeMembers.any((m) => m.personId == person.id);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final table = widget.detail.table;
    final hasCurrent = table.hasFacilitator;
    final candidates = _candidates;
    return AlertDialog(
      title: Text(
        hasCurrent ? l10n.adminChangeFacilitator : l10n.adminAssignFacilitator,
      ),
      content: SizedBox(
        width: 420,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (hasCurrent)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: Text(
                    l10n.adminChangeFacilitatorCurrent(
                      table.facilitatorName ?? '',
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.md),
                  child: AppMessage(
                    tone: StatusTone.error,
                    title: l10n.adminTableWithoutFacilitator,
                  ),
                ),
              if (candidates.isEmpty)
                AppMessage(
                  tone: StatusTone.info,
                  title: l10n.adminNoFacilitatorCandidates,
                  detail: l10n.adminNoFacilitatorCandidatesDetail,
                )
              else
                AppDropdownFormField<String>(
                  name: 'person',
                  label: l10n.adminNewFacilitator,
                  required: true,
                  items: [
                    for (final person in candidates)
                      AppDropdownItem(
                        value: person.id,
                        label: _isInTable(person)
                            ? '${person.fullName} · ${l10n.adminAlreadyInTable}'
                            : person.fullName,
                      ),
                  ],
                ),
              if (hasCurrent) ...[
                const SizedBox(height: AppSpacing.sm),
                AppCheckboxFormField(
                  name: 'keep',
                  label: l10n.adminKeepPreviousAsMember(
                    table.facilitatorName ?? '',
                  ),
                  initialValue: true,
                ),
              ],
              Text(l10n.adminHistoryKept, style: context.textTheme.bodySmall),
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
          label: l10n.adminChangeFacilitatorConfirm,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: candidates.isEmpty ? null : _confirm,
        ),
      ],
    );
  }

  void _confirm() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    final id = form.value['person'] as String;
    final person = _candidates.firstWhere((p) => p.id == id);
    Navigator.of(
      context,
    ).pop((person: person, keepPrevious: form.value['keep'] != false));
  }
}
