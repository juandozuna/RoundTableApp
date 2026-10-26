import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/health_status.dart';
import 'package:gold_roundtables/features/home/domain/models/table_health_rule.dart';

void main() {
  final now = DateTime.utc(2026, 10, 26, 12);

  HealthStatus? evaluate({
    bool active = true,
    DateTime? lastClosedAt,
    DateTime? pendingScheduledAt,
  }) => TableHealthRule.evaluate(
    now: now,
    tableIsActive: active,
    lastClosedAt: lastClosedAt,
    pendingScheduledAt: pendingScheduledAt,
  );

  test('no history yet is unknown', () {
    expect(evaluate(), isNull);
  });

  test('a paused or closed table is inactive', () {
    expect(evaluate(active: false), HealthStatus.inactive);
  });

  test('a recent session and an upcoming one is active', () {
    expect(
      evaluate(
        lastClosedAt: now.subtract(const Duration(days: 6)),
        pendingScheduledAt: now.add(const Duration(days: 1)),
      ),
      HealthStatus.active,
    );
  });

  test('a pending session overdue by more than a day is delayed', () {
    expect(
      evaluate(
        lastClosedAt: now.subtract(const Duration(days: 8)),
        pendingScheduledAt: now.subtract(const Duration(days: 2)),
      ),
      HealthStatus.delayed,
    );
  });

  test('a last session more than 9 days ago is delayed', () {
    expect(
      evaluate(
        lastClosedAt: now.subtract(const Duration(days: 10)),
        pendingScheduledAt: now.add(const Duration(days: 1)),
      ),
      HealthStatus.delayed,
    );
  });

  test('no closed session in 28 days is inactive', () {
    expect(
      evaluate(
        lastClosedAt: now.subtract(const Duration(days: 29)),
        pendingScheduledAt: now.add(const Duration(days: 1)),
      ),
      HealthStatus.inactive,
    );
  });
}
