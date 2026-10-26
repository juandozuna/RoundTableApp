import 'package:flutter/material.dart';

import '../../../../core/form_rules/app_field_kind.dart';
import '../../../../core/widgets/form_fields/app_text_form_field.dart';

/// Search box of the toolbars (explorer, audit). Reports every edit; the
/// caller owns the text so it survives rebuilds.
class AdminSearchField extends StatefulWidget {
  const AdminSearchField({
    super.key,
    required this.hint,
    required this.initialText,
    required this.onChanged,
  });

  final String hint;
  final String initialText;
  final ValueChanged<String> onChanged;

  @override
  State<AdminSearchField> createState() => _AdminSearchFieldState();
}

class _AdminSearchFieldState extends State<AdminSearchField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initialText,
  );

  @override
  void didUpdateWidget(AdminSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // The text was cleared from outside (e.g. "Limpiar todo").
    if (widget.initialText != _controller.text && widget.initialText.isEmpty) {
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 340, minHeight: 44),
      child: AppTextFormField(
        name: 'search',
        kind: AppFieldKind.search,
        controller: _controller,
        hint: widget.hint,
        prefixIcon: Icons.search_rounded,
        dense: true,
        textInputAction: TextInputAction.search,
        onChanged: (value) => widget.onChanged(value ?? ''),
      ),
    );
  }
}
