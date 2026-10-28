import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/auth_session/offline_window.dart';
import 'package:gold_roundtables/core/sync/domain/unsynced_changes_policy.dart';

void main() {
  final since = DateTime.utc(2026, 10, 1, 8);

  group('UnsyncedChangesPolicy (24 h warning)', () {
    bool stale(Duration elapsed) => UnsyncedChangesPolicy.isStale(
      pendingSince: since,
      now: since.add(elapsed),
    );

    test('does not warn before 24 hours', () {
      expect(stale(const Duration(hours: 23, minutes: 59)), isFalse);
    });

    test('warns from exactly 24 hours', () {
      expect(stale(const Duration(hours: 24)), isTrue);
      expect(stale(const Duration(days: 3)), isTrue);
    });

    test('never warns when nothing is pending', () {
      expect(
        UnsyncedChangesPolicy.isStale(pendingSince: null, now: since),
        isFalse,
      );
    });
  });

  group('OfflineWindow (7 days)', () {
    bool expired(Duration elapsed) => OfflineWindow.hasExpired(
      lastVerifiedAt: since,
      now: since.add(elapsed),
    );

    test('is open through day 7 and closed after', () {
      expect(expired(const Duration(days: 7)), isFalse);
      expect(expired(const Duration(days: 7, seconds: 1)), isTrue);
    });

    test('an unrecorded device is not expired', () {
      expect(
        OfflineWindow.hasExpired(lastVerifiedAt: null, now: since),
        isFalse,
      );
    });
  });
}
