import 'package:injectable/injectable.dart';
import 'package:timezone/data/latest_10y.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

/// Converts instants to wall-clock time in a table's IANA timezone, with the
/// timezone database bundled so it works offline and on every platform.
@lazySingleton
class TableWallClock {
  TableWallClock() {
    tz_data.initializeTimeZones();
  }

  /// [instant] as a zone-less date-time showing the clock on the wall of
  /// [timezone]. An unknown zone falls back to UTC.
  DateTime of(DateTime instant, String timezone) {
    final location = _location(timezone);
    final local = tz.TZDateTime.from(instant.toUtc(), location);
    return DateTime(
      local.year,
      local.month,
      local.day,
      local.hour,
      local.minute,
    );
  }

  tz.Location _location(String timezone) {
    try {
      return tz.getLocation(timezone);
    } on tz.LocationNotFoundException {
      return tz.UTC;
    }
  }
}
