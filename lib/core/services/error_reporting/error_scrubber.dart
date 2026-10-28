/// Removes personal data from texts that leave the device. Exception
/// messages can echo user input (a failed parse of an answer, an email in a
/// server error), so only a redacted, truncated form is ever reported.
abstract final class ErrorScrubber {
  static const int maxMessageLength = 300;
  static const int maxStackLines = 25;

  static final RegExp _email = RegExp(r'[\w.+-]+@[\w-]+(\.[\w-]+)+');
  static final RegExp _uuid = RegExp(
    r'[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-'
    r'[0-9a-fA-F]{12}',
  );
  static final RegExp _token = RegExp(r'\beyJ[\w-]+\.[\w-]+\.[\w-]+');
  static final RegExp _longNumber = RegExp(r'\+?\d[\d\s().-]{6,}\d');
  static final RegExp _inviteCode = RegExp(r'\b[A-Z0-9]{6}\b');

  static String message(String raw) {
    final redacted = raw
        .replaceAll(_token, '<token>')
        .replaceAll(_email, '<email>')
        .replaceAll(_uuid, '<id>')
        .replaceAll(_longNumber, '<number>')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    return redacted.length <= maxMessageLength
        ? redacted
        : '${redacted.substring(0, maxMessageLength)}…';
  }

  static String? stack(StackTrace? stackTrace) {
    if (stackTrace == null) return null;
    final lines = stackTrace.toString().trim().split('\n');
    return lines.take(maxStackLines).join('\n');
  }

  /// Path only: drops the query string and replaces ids and invite codes.
  static String route(String location) {
    final path = Uri.tryParse(location)?.path ?? location.split('?').first;
    return path
        .split('/')
        .map(
          (segment) => _uuid.hasMatch(segment) || _inviteCode.hasMatch(segment)
              ? ':id'
              : segment,
        )
        .join('/');
  }
}
