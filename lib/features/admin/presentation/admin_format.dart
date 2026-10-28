import '../../../l10n/gen/app_localizations.dart';

/// Number and label formatting shared by the administration, report and audit
/// screens.
abstract final class AdminFormat {
  static const String missing = '—';

  /// `+0.7` / `−0.4` (points of score improvement).
  static String improvement(double? value) {
    if (value == null) return missing;
    final sign = value >= 0 ? '+' : '−';
    return '$sign${value.abs().toStringAsFixed(1)}';
  }

  /// `86%`; one decimal is noise at this scale.
  static String percent(double? value) =>
      value == null ? missing : '${value.round()}%';

  static String decimal(double? value) =>
      value == null ? missing : value.toStringAsFixed(1);

  static String weekday(AppLocalizations l10n, int weekday) =>
      switch (weekday) {
        1 => l10n.adminWeekday1,
        2 => l10n.adminWeekday2,
        3 => l10n.adminWeekday3,
        4 => l10n.adminWeekday4,
        5 => l10n.adminWeekday5,
        6 => l10n.adminWeekday6,
        _ => l10n.adminWeekday7,
      };

  /// `Martes 19:00`.
  static String schedule(AppLocalizations l10n, int day, String time) =>
      '${weekday(l10n, day)} $time';

  /// Day/month/year of a UTC instant in local time, e.g. `25/10/2026`.
  static String date(DateTime? value) {
    if (value == null) return missing;
    final local = value.toLocal();
    final day = local.day.toString().padLeft(2, '0');
    final month = local.month.toString().padLeft(2, '0');
    return '$day/$month/${local.year}';
  }

  /// `25/10`, for tight spaces.
  static String shortDate(DateTime? value) {
    if (value == null) return missing;
    final local = value.toLocal();
    return '${local.day.toString().padLeft(2, '0')}/${local.month.toString().padLeft(2, '0')}';
  }

  static String dateTime(DateTime? value) {
    if (value == null) return missing;
    final local = value.toLocal();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '${date(value)} $hour:$minute';
  }

  /// `25/10/2026` of a wall-clock date (no timezone conversion).
  static String wallDate(DateTime value) {
    final day = value.day.toString().padLeft(2, '0');
    final month = value.month.toString().padLeft(2, '0');
    return '$day/$month/${value.year}';
  }

  /// `25/10/2026 19:30` of a wall-clock time (no timezone conversion).
  static String wallClock(DateTime? value) {
    if (value == null) return missing;
    final hour = value.hour.toString().padLeft(2, '0');
    final minute = value.minute.toString().padLeft(2, '0');
    return '${wallDate(value)} $hour:$minute';
  }
}
