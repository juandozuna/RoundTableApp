import '../../../l10n/gen/app_localizations.dart';
import '../../admin/presentation/admin_format.dart';

/// Wall-clock labels of the calendar. Inputs are already in the table's
/// timezone (zone-less date-times), so nothing here converts to the viewer's
/// zone.
abstract final class CalendarFormat {
  static String _two(int value) => value.toString().padLeft(2, '0');

  /// `19:00`.
  static String time(DateTime local) =>
      '${_two(local.hour)}:${_two(local.minute)}';

  /// `25/10`.
  static String shortDate(DateTime local) =>
      '${_two(local.day)}/${_two(local.month)}';

  /// `Lunes 25/10`.
  static String dayHeading(AppLocalizations l10n, DateTime local) =>
      '${AdminFormat.weekday(l10n, local.weekday)} ${shortDate(local)}';

  /// `25/10 19:00`.
  static String shortDateTime(DateTime local) =>
      '${shortDate(local)} ${time(local)}';

  /// Calendar day of [local], for grouping.
  static DateTime day(DateTime local) =>
      DateTime(local.year, local.month, local.day);
}
