/// Normalizes raw input into the value that is validated and stored.
abstract final class FieldTransformers {
  static final RegExp _whitespaceRun = RegExp(r'\s+');
  static final RegExp _phoneSeparators = RegExp(r'[\s\-().]');
  static final RegExp _nonAlphanumeric = RegExp(r'[^A-Za-z0-9]');

  static String trimmed(String? raw) => (raw ?? '').trim();

  static String email(String? raw) => trimmed(raw).toLowerCase();

  /// Collapses inner whitespace: "  ana   lucía " → "ana lucía".
  static String personName(String? raw) =>
      trimmed(raw).replaceAll(_whitespaceRun, ' ');

  /// Strips separators and turns a leading `00` into `+`, producing E.164
  /// when the person typed an international number. The result is stored
  /// unverified (AGENTS.md §14).
  static String phoneE164(String? raw) {
    final compact = trimmed(raw).replaceAll(_phoneSeparators, '');
    if (compact.startsWith('00')) return '+${compact.substring(2)}';
    return compact;
  }

  /// Uppercase letters and digits only: "ab-12 cd" → "AB12CD".
  static String inviteCode(String? raw) =>
      trimmed(raw).replaceAll(_nonAlphanumeric, '').toUpperCase();

  static int? score(String? raw) => int.tryParse(trimmed(raw));
}
