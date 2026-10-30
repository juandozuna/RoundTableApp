import 'package:flutter/material.dart';

import '../../extensions/build_context_x.dart';
import '../../form_rules/app_field_kind.dart';
import '../app_icon_button.dart';
import 'app_text_form_field.dart';

/// Password input: hidden by default with a show/hide control. Pick the
/// [kind] that fits the screen (`currentPassword`, `newPassword` or
/// `confirmPassword`).
class AppPasswordFormField extends StatefulWidget {
  const AppPasswordFormField({
    super.key,
    required this.name,
    required this.label,
    this.kind = AppFieldKind.currentPassword,
    this.matchValue,
    this.enabled = true,
    this.textInputAction,
    this.onSubmitted,
    this.helper,
    this.autofocus = false,
  });

  final String name;
  final String label;
  final AppFieldKind kind;
  final ValueGetter<String?>? matchValue;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueChanged<String?>? onSubmitted;
  final String? helper;
  final bool autofocus;

  @override
  State<AppPasswordFormField> createState() => _AppPasswordFormFieldState();
}

class _AppPasswordFormFieldState extends State<AppPasswordFormField> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppTextFormField(
      name: widget.name,
      label: widget.label,
      kind: widget.kind,
      required: true,
      helper: widget.helper,
      matchValue: widget.matchValue,
      enabled: widget.enabled,
      autofocus: widget.autofocus,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      obscureText: !_visible,
      suffixIcon: AppIconButton(
        icon: _visible
            ? Icons.visibility_off_rounded
            : Icons.visibility_rounded,
        tooltip: _visible ? l10n.passwordHide : l10n.passwordShow,
        onPressed: () => setState(() => _visible = !_visible),
      ),
    );
  }
}
