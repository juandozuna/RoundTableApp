/// Formats a stored E.164 number for display, grouped per country.
///
/// Country patterns cover the pilot region; unknown codes fall back to
/// groups of three digits. Storage always stays E.164.
abstract final class PhoneDisplayFormatter {
  /// Dial code → digit groups of the national number.
  static const Map<String, List<int>> _patterns = {
    '1': [3, 3, 4], // US, CA, DO, PR
    '34': [3, 3, 3], // ES
    '51': [3, 3, 3], // PE
    '52': [2, 4, 4], // MX
    '53': [1, 3, 4], // CU
    '54': [2, 4, 4], // AR
    '55': [2, 5, 4], // BR
    '56': [1, 4, 4], // CL
    '57': [3, 3, 4], // CO
    '58': [3, 3, 4], // VE
    '502': [4, 4], // GT
    '503': [4, 4], // SV
    '504': [4, 4], // HN
    '505': [4, 4], // NI
    '506': [4, 4], // CR
    '507': [4, 4], // PA
    '591': [1, 3, 4], // BO
    '593': [2, 3, 4], // EC
    '595': [3, 3, 3], // PY
    '598': [2, 3, 3], // UY
  };

  static String format(String e164) {
    if (!e164.startsWith('+')) return e164;
    final digits = e164.substring(1);
    for (final length in const [3, 2, 1]) {
      if (digits.length <= length) continue;
      final code = digits.substring(0, length);
      final pattern = _patterns[code];
      if (pattern == null) continue;
      final national = digits.substring(length);
      if (national.length != pattern.fold<int>(0, (sum, g) => sum + g)) {
        return '+$code ${_groupsOf(national, 3)}';
      }
      return '+$code ${_applyPattern(national, pattern)}';
    }
    return '+${_groupsOf(digits, 3)}';
  }

  static String _applyPattern(String digits, List<int> pattern) {
    final parts = <String>[];
    var start = 0;
    for (final size in pattern) {
      parts.add(digits.substring(start, start + size));
      start += size;
    }
    return parts.join(' ');
  }

  static String _groupsOf(String digits, int size) {
    final parts = <String>[];
    for (var i = 0; i < digits.length; i += size) {
      final end = i + size > digits.length ? digits.length : i + size;
      parts.add(digits.substring(i, end));
    }
    return parts.join(' ');
  }
}
