import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/health_reason.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_table_row.dart';

void main() {
  test('health_reasons decode and unknown reasons are ignored', () {
    expect(
      HealthReason.listFromJson([
        'low_attendance',
        'future_reason',
        'few_people',
      ]),
      [HealthReason.lowAttendance, HealthReason.fewPeople],
    );
    expect(HealthReason.listFromJson(null), isEmpty);
  });

  test('a kpi_tables row carries reasons and recent attendance', () {
    final row = KpiTableRow.fromJson({
      'round_table_id': 't7',
      'code': 'LUZ-07',
      'name': 'Mesa Fe 07',
      'organization_id': 'o1',
      'organization_name': 'Fundación Luz',
      'health': 'active',
      'recent_attendance_pct': 62.5,
      'health_reasons': ['low_attendance', 'few_people'],
    });
    expect(row.recentAttendancePct, 62.5);
    expect(row.healthReasons, [
      HealthReason.lowAttendance,
      HealthReason.fewPeople,
    ]);
  });

  test('rows from an older server have no reasons', () {
    final row = KpiTableRow.fromJson({
      'round_table_id': 't1',
      'code': 'C',
      'name': 'N',
      'organization_id': 'o',
      'organization_name': 'O',
    });
    expect(row.healthReasons, isEmpty);
  });
}
