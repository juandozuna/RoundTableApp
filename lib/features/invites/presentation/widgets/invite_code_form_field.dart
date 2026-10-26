import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/form_rules/app_field_kind.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/models/invite_code.dart';

/// Six segmented cells over one hidden text field, so paste, autofill and
/// the keyboard all work. Calls [onComplete] as soon as six characters are in.
class InviteCodeFormField extends StatefulWidget {
  const InviteCodeFormField({
    super.key,
    required this.name,
    required this.onComplete,
    this.onChanged,
    this.enabled = true,
    this.hasError = false,
    this.autofocus = true,
    this.controller,
  });

  final String name;
  final ValueChanged<String> onComplete;
  final VoidCallback? onChanged;
  final bool enabled;

  /// Draws the cells in the error colour.
  final bool hasError;
  final bool autofocus;

  /// Lets the page clear the field when the person comes back to try again.
  final TextEditingController? controller;

  @override
  State<InviteCodeFormField> createState() => _InviteCodeFormFieldState();
}

class _InviteCodeFormFieldState extends State<InviteCodeFormField> {
  late final TextEditingController _controller =
      widget.controller ?? TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FormBuilderField<String>(
      name: widget.name,
      enabled: widget.enabled,
      validator: AppFieldKind.inviteCode.validator(l10n, required: true),
      valueTransformer: AppFieldKind.inviteCode.transform,
      builder: (field) {
        return ListenableBuilder(
          listenable: Listenable.merge([_controller, _focus]),
          builder: (context, _) {
            final text = _controller.text;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < InviteCode.length; i++)
                          Flexible(
                            child: _buildCell(
                              context,
                              char: i < text.length ? text[i] : '',
                              active:
                                  _focus.hasFocus &&
                                  i == text.length &&
                                  text.length < InviteCode.length,
                              error: widget.hasError || field.hasError,
                            ),
                          ),
                      ],
                    ),
                    Positioned.fill(
                      // Invisible but present: an Opacity(0) subtree would
                      // be dropped from the semantics tree.
                      // Deliberately a bare TextField: it has no visible chrome
                      // (the cells above are the UI), so AppTextFormField's
                      // decoration does not apply.
                      child: TextField(
                        controller: _controller,
                        focusNode: _focus,
                        autofocus: widget.autofocus,
                        enabled: widget.enabled,
                        autocorrect: false,
                        enableSuggestions: false,
                        showCursor: false,
                        style: const TextStyle(color: Colors.transparent),
                        decoration: InputDecoration(
                          // Spoken label; invisible.
                          hintText: l10n.invitesCodeSemantics,
                          hintStyle: const TextStyle(color: Colors.transparent),
                          isCollapsed: true,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          fillColor: Colors.transparent,
                          filled: false,
                        ),
                        keyboardType: AppFieldKind.inviteCode.keyboardType,
                        textCapitalization:
                            AppFieldKind.inviteCode.textCapitalization,
                        inputFormatters: [
                          ...AppFieldKind.inviteCode.inputFormatters,
                          FilteringTextInputFormatter.allow(
                            RegExp('[A-Za-z0-9]'),
                          ),
                        ],
                        onChanged: (value) {
                          field.didChange(value);
                          widget.onChanged?.call();
                          if (value.length == InviteCode.length) {
                            widget.onComplete(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                if (field.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      field.errorText!,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodySmall!.copyWith(
                        color: context.statusColors.error,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildCell(
    BuildContext context, {
    required String char,
    required bool active,
    required bool error,
  }) {
    final colors = context.colors;
    final border = error
        ? context.statusColors.error
        : active
        ? colors.accent
        : colors.border;
    return Container(
      constraints: const BoxConstraints(maxWidth: 58),
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: AspectRatio(
        aspectRatio: 0.82,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadii.md),
            border: Border.all(color: border, width: 2),
            boxShadow: active
                ? [BoxShadow(color: colors.glow, spreadRadius: 3)]
                : null,
          ),
          child: Center(
            child: Text(
              char,
              style: context.textStyles.numberLarge.copyWith(color: colors.ink),
            ),
          ),
        ),
      ),
    );
  }
}
