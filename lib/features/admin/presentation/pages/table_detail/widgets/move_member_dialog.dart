import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/theme/status_tone.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_message.dart';
import '../../../../../../core/widgets/form_fields/app_dropdown_form_field.dart';
import '../../../../domain/models/admin_table.dart';
import '../../../../domain/models/round_table_status.dart';

/// Picks the table a member moves to. Full tables (9 people including the
/// facilitator) are listed but cannot be chosen.
class MoveMemberDialog extends StatefulWidget {
  const MoveMemberDialog({
    super.key,
    required this.personName,
    required this.from,
    required this.targets,
  });

  final String personName;
  final AdminTable from;
  final List<AdminTable> targets;

  static Future<String?> show(
    BuildContext context, {
    required String personName,
    required AdminTable from,
    required List<AdminTable> targets,
  }) => showDialog<String>(
    context: context,
    builder: (_) =>
        MoveMemberDialog(personName: personName, from: from, targets: targets),
  );

  @override
  State<MoveMemberDialog> createState() => _MoveMemberDialogState();
}

class _MoveMemberDialogState extends State<MoveMemberDialog> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<AdminTable> get _targets =>
      widget.targets.where((t) => t.status == RoundTableStatus.active).toList();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final targets = _targets;
    return AlertDialog(
      title: Text(l10n.adminMoveTitle(widget.personName)),
      content: SizedBox(
        width: 420,
        child: FormBuilder(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.adminMoveMessage(widget.from.code)),
              const SizedBox(height: AppSpacing.md),
              if (targets.isEmpty)
                AppMessage(
                  tone: StatusTone.info,
                  title: l10n.adminMoveNoTargets,
                )
              else
                AppDropdownFormField<String>(
                  name: 'table',
                  label: l10n.adminMoveDestination,
                  required: true,
                  items: [
                    for (final t in targets)
                      AppDropdownItem(
                        value: t.id,
                        label:
                            '${t.code} · ${t.name} · ${t.activePeople}/${t.maxPeople}${t.isFull ? ' · ${l10n.adminTableFull}' : ''}',
                      ),
                  ],
                  onChanged: (_) => setState(() {}),
                ),
              if (_selectedFull(targets))
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.md),
                  child: AppMessage(
                    tone: StatusTone.error,
                    title: l10n.adminErrorTableFull,
                  ),
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
          label: l10n.adminMove,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: targets.isEmpty || _selectedFull(targets)
              ? null
              : _confirm,
        ),
      ],
    );
  }

  bool _selectedFull(List<AdminTable> targets) {
    final id = _formKey.currentState?.fields['table']?.value as String?;
    if (id == null) return false;
    return targets.where((t) => t.id == id).any((t) => t.isFull);
  }

  void _confirm() {
    final form = _formKey.currentState;
    if (form == null || !form.saveAndValidate()) return;
    Navigator.of(context).pop(form.value['table'] as String);
  }
}
