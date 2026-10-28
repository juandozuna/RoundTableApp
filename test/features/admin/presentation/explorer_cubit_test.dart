import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_table.dart';
import 'package:gold_roundtables/features/admin/domain/models/explorer_query.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/directory/load_explorer_data_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/views/delete_explorer_view_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/views/load_saved_views_use_case.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/views/save_explorer_view_use_case.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/explorer/cubit/explorer_cubit.dart';
import 'package:gold_roundtables/features/admin/presentation/pages/explorer/cubit/explorer_state.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_table_row.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/export/export_csv_use_case.dart';

import '../fakes.dart';
import '../fixtures.dart';

AdminTable _admin(String code, String org, String orgName, {int people = 6}) =>
    AdminTable(
      id: 'id-$code',
      organizationId: org,
      organizationName: orgName,
      name: 'Mesa $code',
      code: code,
      activePeople: people,
    );

void main() {
  late FakeDirectory directory;
  late FakeKpiService kpis;
  late InMemorySavedViews views;
  late RecordingCsvExport csv;

  ExplorerCubit build() => ExplorerCubit(
    LoadExplorerDataUseCase(directory, kpis, FixedClock()),
    LoadSavedViewsUseCase(views),
    SaveExplorerViewUseCase(views, CountingIds()),
    DeleteExplorerViewUseCase(views),
    ExportCsvUseCase(csv),
  );

  setUp(() {
    final data = sampleData();
    directory = FakeDirectory(
      orgs: [for (final o in data.organizations) o.organization],
      tableRows: [
        _admin('LUZ-01', 'org-luz', 'Fundación Luz'),
        _admin('LUZ-02', 'org-luz', 'Fundación Luz'),
        _admin('HOR-01', 'org-hor', 'Colegio Horizonte', people: 3),
      ],
      peopleRows: data.people,
    );
    kpis = FakeKpiService()
      ..tableRows = [
        for (final t in data.tables)
          KpiTableRow(
            roundTableId: t.id,
            code: t.code,
            name: t.name,
            organizationId: t.organizationId,
            organizationName: t.organizationName,
            countryCode: t.countryCode,
            health: t.health,
            attendancePct: t.attendancePct,
            syncedLateRows: t.syncedLateRows,
            valuesCompleted: t.valuesCompleted,
            healthReasons: t.healthReasons,
          ),
      ];
    views = InMemorySavedViews();
    csv = RecordingCsvExport();
  });

  blocTest<ExplorerCubit, ExplorerState>(
    'load joins directory rows with KPIs and derives the grid',
    build: build,
    act: (cubit) => cubit.load(),
    verify: (cubit) {
      final state = cubit.state;
      expect(state.status, ExplorerStatus.ready);
      expect(state.tables.map((t) => t.code), ['HOR-01', 'LUZ-01', 'LUZ-02']);
      expect(state.data.organizations, hasLength(2));
      expect(state.viewCounts[ExplorerView.delayed.id], 1);
      expect(state.viewCounts[ExplorerView.lowAttendance.id], 1);
      expect(state.viewCounts[ExplorerView.fewPeople.id], 1);
      expect(state.aggregate.tables, 3);
    },
  );

  blocTest<ExplorerCubit, ExplorerState>(
    'opening a built-in view applies its sort and filter',
    build: build,
    act: (cubit) async {
      await cubit.load(viewId: ExplorerView.delayed.id);
    },
    verify: (cubit) {
      expect(cubit.state.query.viewId, ExplorerView.delayed.id);
      expect(cubit.state.tables.map((t) => t.code), ['LUZ-02']);
    },
  );

  blocTest<ExplorerCubit, ExplorerState>(
    'the "Menos de 3 personas" view lists only tables with that reason',
    build: build,
    act: (cubit) async {
      await cubit.load(viewId: ExplorerView.fewPeople.id);
    },
    verify: (cubit) {
      expect(cubit.state.tables.map((t) => t.code), ['HOR-01']);
      expect(cubit.state.tables.single.hasFewPeople, isTrue);
    },
  );

  blocTest<ExplorerCubit, ExplorerState>(
    'selection is pruned when the rows it pointed to disappear',
    build: build,
    act: (cubit) async {
      await cubit.load();
      cubit
        ..toggleSelected('id-LUZ-01')
        ..toggleSelected('id-HOR-01')
        ..search('luz');
    },
    verify: (cubit) {
      expect(cubit.state.selection, {'id-LUZ-01'});
      expect(cubit.state.aggregate.tables, 1);
    },
  );

  blocTest<ExplorerCubit, ExplorerState>(
    'saving a view persists it, selects it and survives a reload',
    build: build,
    act: (cubit) async {
      await cubit.load();
      cubit.search('luz');
      await cubit.saveCurrentView('Solo Luz');
      await cubit.load(viewId: views.stored.single.id);
    },
    verify: (cubit) {
      expect(views.stored.single.name, 'Solo Luz');
      expect(cubit.state.query.viewId, views.stored.single.id);
      expect(cubit.state.query.search, 'luz');
      expect(cubit.state.tables, hasLength(2));
    },
  );

  blocTest<ExplorerCubit, ExplorerState>(
    'changing a filter detaches a saved view; deleting it resets to "Todas"',
    build: build,
    act: (cubit) async {
      await cubit.load();
      cubit.search('luz');
      await cubit.saveCurrentView('Solo Luz');
      cubit.setFilter(ExplorerFilterKeys.country, 'DO');
      await cubit.deleteView(views.stored.single.id);
    },
    verify: (cubit) {
      expect(views.stored, isEmpty);
      expect(cubit.state.query.viewId, ExplorerView.all.id);
    },
  );

  test(
    'report scope narrows to the one table, organization or country selected',
    () async {
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load();
      // The whole view spans two organizations in two countries.
      expect(cubit.reportScope(), (
        country: null,
        organizationId: null,
        tableId: null,
      ));
      cubit
        ..toggleSelected('id-LUZ-01')
        ..toggleSelected('id-LUZ-02');
      expect(cubit.reportScope().organizationId, 'org-luz');
      cubit
        ..clearSelection()
        ..toggleSelected('id-HOR-01');
      expect(cubit.reportScope().tableId, 'id-HOR-01');
    },
  );

  blocTest<ExplorerCubit, ExplorerState>(
    'export sends the selected rows only',
    build: build,
    act: (cubit) async {
      await cubit.load();
      cubit.toggleSelected('id-LUZ-01');
      await cubit.exportCsv(List.filled(11, 'h'));
    },
    verify: (_) {
      final doc = csv.exported.single;
      expect(doc.rows, hasLength(1));
      expect(doc.rows.single.first, 'LUZ-01');
    },
  );
}
