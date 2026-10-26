import 'package:flutter_test/flutter_test.dart';

import '../support/session_test_database.dart';

/// PowerSync owns the schema; the Drift views must only ask for columns that
/// exist, otherwise every query on that table fails at runtime.
void main() {
  late SessionTestDatabase db;

  setUp(() async => db = await SessionTestDatabase.open());
  tearDown(() => db.close());

  test('every Drift column exists in the PowerSync table', () async {
    for (final table in db.drift.allTables) {
      final name = table.actualTableName;
      final columns = (await db.sync.powerSync.getAll(
        'PRAGMA table_info("$name")',
      )).map((row) => row['name'] as String).toSet();

      expect(columns, isNotEmpty, reason: 'table $name is not in the schema');
      for (final column in table.$columns) {
        expect(
          columns,
          contains(column.name),
          reason: '$name.${column.name} is missing from the PowerSync schema',
        );
      }
    }
  });
}
