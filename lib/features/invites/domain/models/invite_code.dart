/// Invite code rules: 6 characters from an alphabet without 0/O/1/I,
/// case-insensitive (api-contract.md §3).
abstract final class InviteCode {
  static const int length = 6;
  static const String alphabet = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

  /// Uppercase, without spaces or dashes (the server does the same).
  static String normalize(String raw) =>
      raw.toUpperCase().replaceAll(RegExp(r'[\s-]'), '');

  static bool isValid(String code) =>
      code.length == length && code.split('').every(alphabet.contains);

  /// Extracts a code from what a QR or a paste contains: a bare code, a link
  /// (`…/#/invitacion/ABC234`, `…/invite/ABC234`) or a link with `?code=`.
  /// Returns `null` when it is not an invitation.
  static String? parse(String raw) {
    final text = raw.trim();
    if (text.isEmpty) return null;
    final direct = normalize(text);
    if (isValid(direct)) return direct;

    final uri = Uri.tryParse(text);
    if (uri == null || !uri.hasScheme) return null;
    final queryCode = uri.queryParameters['code'];
    final candidates = [
      ?queryCode,
      ..._segments(uri.fragment),
      ...uri.pathSegments,
    ];
    for (final candidate in candidates.reversed) {
      final code = normalize(candidate);
      if (isValid(code)) return code;
    }
    return null;
  }

  static List<String> _segments(String fragment) =>
      fragment.split('?').first.split('/').where((s) => s.isNotEmpty).toList();
}
