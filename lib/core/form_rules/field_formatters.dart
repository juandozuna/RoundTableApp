import 'package:flutter/services.dart';

/// Input formatters shared by [AppFieldKind]s.
abstract final class FieldFormatters {
  /// Uppercases and keeps letters and digits, up to [maxLength].
  static TextInputFormatter upperAlphanumeric(int maxLength) =>
      _UpperAlphanumericFormatter(maxLength);

  /// Allows a single leading `+`, digits and common separators.
  static final TextInputFormatter phone = FilteringTextInputFormatter.allow(
    RegExp(r'[0-9+\s\-().]'),
  );

  static final TextInputFormatter digitsOnly =
      FilteringTextInputFormatter.digitsOnly;
}

class _UpperAlphanumericFormatter extends TextInputFormatter {
  _UpperAlphanumericFormatter(this.maxLength);

  final int maxLength;
  static final RegExp _disallowed = RegExp(r'[^A-Z0-9]');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.toUpperCase().replaceAll(_disallowed, '');
    if (text.length > maxLength) text = text.substring(0, maxLength);
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
