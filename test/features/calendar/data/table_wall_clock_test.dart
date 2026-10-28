import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/calendar/data/services/table_wall_clock.dart';

void main() {
  final clock = TableWallClock();

  test('shows the clock on the wall of the table, not of the viewer', () {
    final instant = DateTime.utc(2026, 10, 29, 23);
    expect(
      clock.of(instant, 'America/Santo_Domingo'),
      DateTime(2026, 10, 29, 19),
    );
    expect(
      clock.of(instant, 'America/Mexico_City'),
      DateTime(2026, 10, 29, 17),
    );
    expect(clock.of(instant, 'Europe/Madrid'), DateTime(2026, 10, 30));
  });

  test('follows daylight saving time of each zone', () {
    // Madrid is UTC+2 in summer and UTC+1 in winter.
    expect(
      clock.of(DateTime.utc(2026, 7, 1, 18), 'Europe/Madrid'),
      DateTime(2026, 7, 1, 20),
    );
    expect(
      clock.of(DateTime.utc(2026, 12, 1, 18), 'Europe/Madrid'),
      DateTime(2026, 12, 1, 19),
    );
  });

  test(
    'a session at the same local time keeps its hour across a DST change',
    () {
      // Mexico City abolished DST in 2022; New York did not.
      expect(
        clock.of(DateTime.utc(2026, 11, 1, 23), 'America/New_York'),
        DateTime(2026, 11, 1, 18),
      );
      expect(
        clock.of(DateTime.utc(2026, 10, 25, 22), 'America/New_York'),
        DateTime(2026, 10, 25, 18),
      );
    },
  );

  test('an unknown zone falls back to UTC', () {
    expect(
      clock.of(DateTime.utc(2026, 10, 29, 23), 'Mars/Olympus'),
      DateTime(2026, 10, 29, 23),
    );
  });
}
