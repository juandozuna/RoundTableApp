import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

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
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        style: context.textTheme.bodyLarge,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: widget.hint,
          prefixIcon: const Icon(Icons.search_rounded),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.md,
          ),
        ),
      ),
    );
  }
}
