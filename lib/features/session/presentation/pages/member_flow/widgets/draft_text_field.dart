import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';

/// Text control for an answer that lives in the Cubit's draft. Validation is
/// the domain's `ResponseValidator`, so the error comes from the Cubit state
/// instead of a form validator; the draft survives rebuilds.
class DraftTextField extends StatefulWidget {
  const DraftTextField({
    super.key,
    required this.label,
    required this.text,
    required this.onChanged,
    this.errorText,
    this.hint,
    this.maxLength,
    this.maxLines = 2,
  });

  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  final String? errorText;
  final String? hint;
  final int? maxLength;
  final int maxLines;

  @override
  State<DraftTextField> createState() => _DraftTextFieldState();
}

class _DraftTextFieldState extends State<DraftTextField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.text,
  );

  @override
  void didUpdateWidget(DraftTextField old) {
    super.didUpdateWidget(old);
    // Typing echoes back unchanged; only an outside change (an example chip)
    // replaces the text.
    if (widget.text != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.text,
        selection: TextSelection.collapsed(offset: widget.text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.maxLines > 1 ? 2 : null,
      keyboardType: widget.maxLines > 1
          ? TextInputType.multiline
          : TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      style: context.textTheme.bodyLarge,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        errorText: widget.errorText,
        errorMaxLines: 3,
      ),
    );
  }
}
