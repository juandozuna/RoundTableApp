import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_message.dart';
import '../../../../core/widgets/form_fields/app_text_form_field.dart';
import '../../domain/explorer/explorer_engine.dart';

/// Confirm dialog for hard-to-undo actions: the confirm button stays disabled
/// until the user types the entity's name.
class ConfirmByTypingDialog extends StatefulWidget {
  const ConfirmByTypingDialog({
    super.key,
    required this.name,
    required this.title,
    required this.warningTitle,
    required this.warningDetail,
    required this.confirmLabel,
  });

  final String name;
  final String title;
  final String warningTitle;
  final String warningDetail;
  final String confirmLabel;

  static Future<bool> show(
    BuildContext context, {
    required String name,
    required String title,
    required String warningTitle,
    required String warningDetail,
    required String confirmLabel,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => ConfirmByTypingDialog(
        name: name,
        title: title,
        warningTitle: warningTitle,
        warningDetail: warningDetail,
        confirmLabel: confirmLabel,
      ),
    );
    return result ?? false;
  }

  @override
  State<ConfirmByTypingDialog> createState() => _ConfirmByTypingDialogState();
}

class _ConfirmByTypingDialogState extends State<ConfirmByTypingDialog> {
  final TextEditingController _controller = TextEditingController();

  bool get _matches =>
      ExplorerEngine.fold(_controller.text.trim()) ==
      ExplorerEngine.fold(widget.name.trim());

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppMessage(
            tone: StatusTone.error,
            title: widget.warningTitle,
            detail: widget.warningDetail,
          ),
          const SizedBox(height: AppSpacing.md),
          AppTextFormField(
            name: 'confirmName',
            label: l10n.adminTypeNameToConfirm(widget.name),
            controller: _controller,
            autofocus: true,
            onChanged: (_) => setState(() {}),
          ),
        ],
      ),
      actions: [
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          fullWidth: false,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton(
          label: widget.confirmLabel,
          variant: AppButtonVariant.danger,
          size: AppButtonSize.medium,
          fullWidth: false,
          onPressed: _matches ? () => Navigator.of(context).pop(true) : null,
        ),
      ],
    );
  }
}
