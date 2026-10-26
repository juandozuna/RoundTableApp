import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/health_status.dart';
import 'package:gold_roundtables/features/admin/domain/explorer/explorer_engine.dart';
import 'package:gold_roundtables/features/admin/domain/models/explorer_query.dart';

import '../fixtures.dart';

void main() {
  final data = sampleData();
  const tables = ExplorerQuery();

  group('tables', () {
    test('sort by code ascending by default', () {
      final rows = ExplorerEngine.tables(data, tables);
      expect(rows.map((t) => t.code), ['HOR-01', 'LUZ-01', 'LUZ-02']);
    });

    test('sort descending flips the order', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(ascending: false),
      );
      expect(rows.first.code, 'LUZ-02');
    });

    test('"Mesas retrasadas" keeps only delayed tables', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(viewId: ExplorerView.delayed.id),
      );
      expect(rows.map((t) => t.code), ['LUZ-02']);
    });

    test('"Baja asistencia" is attendance under 70 and ignores no data', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(viewId: ExplorerView.lowAttendance.id),
      );
      expect(rows.map((t) => t.code), ['LUZ-02']);
    });

    test('"Sincronizado tarde" needs late rows', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(viewId: ExplorerView.syncedLate.id),
      );
      expect(rows.map((t) => t.code), ['LUZ-02']);
    });

    test('search ignores case and accents', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(search: 'FUNDACION'),
      );
      expect(rows.map((t) => t.code), ['LUZ-01', 'LUZ-02']);
    });

    test('filters combine', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(
          filters: {
            ExplorerFilterKeys.country: 'DO',
            ExplorerFilterKeys.status: HealthStatus.active.wireValue,
          },
        ),
      );
      expect(rows.map((t) => t.code), ['LUZ-01']);
    });

    test('tables without data sort before tables with data ascending', () {
      final rows = ExplorerEngine.tables(
        data,
        tables.copyWith(sortKey: 'attendance'),
      );
      expect(rows.first.code, 'HOR-01');
    });

    test('view counts follow the current search and filters', () {
      final query = tables.copyWith(search: 'luz');
      expect(ExplorerEngine.viewCount(data, query, ExplorerView.all.id), 2);
      expect(ExplorerEngine.viewCount(data, query, ExplorerView.delayed.id), 1);
    });

    test('aggregate weights attendance by people and counts health', () {
      final a = ExplorerEngine.aggregate(data.tables);
      expect(a.tables, 3);
      expect(a.people, 15);
      expect(a.valuesCompleted, 15);
      expect(a.syncedLateRows, 3);
      expect(a.active, 1);
      expect(a.delayed, 1);
      expect(a.inactive, 1);
      expect(a.lowAttendance, 1);
      // (92*6 + 66*6) / 12
      expect(a.attendancePct, closeTo(79, 0.001));
    });

    test('aggregate of nothing has no averages', () {
      final a = ExplorerEngine.aggregate(const []);
      expect(a.tables, 0);
      expect(a.attendancePct, isNull);
      expect(a.improvementAvg, isNull);
    });
  });

  group('organizations', () {
    const orgs = ExplorerQuery(
      entity: ExplorerEntity.organizations,
      sortKey: 'name',
    );

    test('"Sin mesas" and "Sin coordinador" views', () {
      expect(
        ExplorerEngine.organizations(
          data,
          orgs.copyWith(viewId: ExplorerView.withoutTables.id),
        ).map((o) => o.organization.name),
        ['Colegio Horizonte'],
      );
      expect(
        ExplorerEngine.organizations(
          data,
          orgs.copyWith(viewId: ExplorerView.withoutCoordinator.id),
        ).map((o) => o.id),
        ['org-hor'],
      );
    });

    test('filters by country', () {
      final rows = ExplorerEngine.organizations(
        data,
        orgs.copyWith(filters: {ExplorerFilterKeys.country: 'CO'}),
      );
      expect(rows.single.id, 'org-hor');
    });
  });

  group('people', () {
    const people = ExplorerQuery(
      entity: ExplorerEntity.people,
      sortKey: 'name',
    );

    test('classifies people by what they do', () {
      final kinds = {
        for (final p in data.people) p.id: ExplorerEngine.personKind(p),
      };
      expect(kinds['p1'], PersonKind.coordinator);
      expect(kinds['p2'], PersonKind.facilitator);
      expect(kinds['p3'], PersonKind.member);
      expect(kinds['p4'], PersonKind.unassigned);
    });

    test('views: pending invites and inactive', () {
      expect(
        ExplorerEngine.people(
          data,
          people.copyWith(viewId: ExplorerView.pendingInvites.id),
        ).map((p) => p.id),
        ['p4'],
      );
      expect(
        ExplorerEngine.people(
          data,
          people.copyWith(viewId: ExplorerView.inactive.id),
        ).map((p) => p.id),
        ['p5'],
      );
    });

    test('search matches accents ("baez" finds Báez)', () {
      final rows = ExplorerEngine.people(data, people.copyWith(search: 'baez'));
      expect(rows.single.id, 'p5');
    });
  });

  test('fold strips Spanish diacritics', () {
    expect(ExplorerEngine.fold('Peña ÁÉÍÓÚ ü'), 'pena aeiou u');
  });
}
