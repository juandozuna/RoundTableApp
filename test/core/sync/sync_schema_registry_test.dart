import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/core/sync/sync.dart';
import 'package:powersync/powersync.dart';

class _Contribution implements SyncSchemaContribution {
  const _Contribution(this.tables);

  @override
  final List<Table> tables;
}

void main() {
  test('combines core local tables with feature tables', () {
    const registry = SyncSchemaRegistry([
      _Contribution([
        Table('attendance', [Column.text('session_id')]),
      ]),
    ]);
    final names = registry.buildSchema().tables.map((t) => t.name);
    expect(names, containsAll(['local_sync_state', 'attendance']));
  });

  test('rejects duplicate table names', () {
    const registry = SyncSchemaRegistry([
      _Contribution([Table('answers', [])]),
      _Contribution([Table('answers', [])]),
    ]);
    expect(registry.buildSchema, throwsStateError);
  });

  group('SyncSnapshot.aggregateState', () {
    test('uploading wins, then pending, else synced', () {
      const base = SyncSnapshot(connection: SyncConnection.connected);
      expect(base.aggregateState, SyncState.synced);
      expect(base.copyWith(pendingCount: 2).aggregateState, SyncState.pending);
      expect(
        base.copyWith(pendingCount: 2, uploading: true).aggregateState,
        SyncState.syncing,
      );
    });
  });
}
