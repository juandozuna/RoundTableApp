/// A table of text ready to be exported as CSV (RFC 4180 quoting).
class CsvDocument {
  const CsvDocument({
    required this.filename,
    required this.headers,
    required this.rows,
  });

  final String filename;
  final List<String> headers;
  final List<List<String>> rows;

  String toCsv() {
    final lines = [headers, ...rows].map((row) => row.map(_escape).join(','));
    return '${lines.join('\r\n')}\r\n';
  }

  static String _escape(String value) {
    final needsQuotes =
        value.contains(',') ||
        value.contains('"') ||
        value.contains('\n') ||
        value.contains('\r');
    if (!needsQuotes) return value;
    return '"${value.replaceAll('"', '""')}"';
  }
}
