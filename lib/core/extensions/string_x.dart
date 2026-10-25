extension StringX on String {
  /// Up to two initials: "Ana Lucía Soto" → "AS", "marta" → "MA".
  String get initials {
    final words = trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .toList();
    if (words.isEmpty) return '?';
    if (words.length == 1) {
      final word = words.single;
      return word.substring(0, word.length < 2 ? word.length : 2).toUpperCase();
    }
    return '${words.first[0]}${words.last[0]}'.toUpperCase();
  }

  /// Stable non-negative hash for picking palette entries.
  int get stableHash {
    var hash = 0;
    for (final unit in codeUnits) {
      hash = (hash * 31 + unit) & 0x7fffffff;
    }
    return hash;
  }
}
