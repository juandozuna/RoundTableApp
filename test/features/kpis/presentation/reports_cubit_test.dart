import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_scope.dart';
import 'package:gold_roundtables/features/admin/domain/services/admin_scope_service.dart';
import 'package:gold_roundtables/features/admin/domain/use_cases/scope/watch_admin_scope_use_case.dart';
import 'package:gold_roundtables/features/kpis/domain/models/drill_level.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_breakdown_row.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_dimension.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_member_detail.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_table_row.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/export/export_csv_use_case.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/report/load_drill_level_use_case.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/report/load_report_options_use_case.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/report/load_report_use_case.dart';
import 'package:gold_roundtables/features/kpis/presentation/pages/reports/cubit/reports_cubit.dart';
import 'package:gold_roundtables/features/kpis/presentation/pages/reports/cubit/reports_state.dart';

import '../../admin/fakes.dart';

class _Scope implements AdminScopeService {
  _Scope(this.scope);

  final AdminScope? scope;

  @override
  Stream<AdminScope?> watch() => Stream.value(scope);
}

void main() {
  late FakeKpiService kpis;
  late RecordingCsvExport csv;

  ReportsCubit build(AdminScope? scope) {
    final clock = FixedClock();
    return ReportsCubit(
      LoadReportUseCase(kpis, clock),
      LoadReportOptionsUseCase(kpis),
      LoadDrillLevelUseCase(kpis, clock),
      ExportCsvUseCase(csv),
      WatchAdminScopeUseCase(_Scope(scope)),
    );
  }

  const admin = AdminScope(isAdministrator: true);
  const coordinator = AdminScope(
    isAdministrator: false,
    organizationId: 'org-luz',
    organizationName: 'Fundación Luz',
  );

  setUp(() {
    csv = RecordingCsvExport();
    kpis = FakeKpiService()
      ..breakdowns = {
        KpiDimension.country: const [
          KpiBreakdownRow(key: 'DO', label: 'República Dominicana'),
          KpiBreakdownRow(key: 'CO', label: 'Colombia'),
        ],
        KpiDimension.organization: const [
          KpiBreakdownRow(
            key: 'org-luz',
            label: 'Fundación Luz',
            tablesTotal: 2,
          ),
        ],
      }
      ..tableRows = const [
        KpiTableRow(
          roundTableId: 't1',
          code: 'LUZ-01',
          name: 'Fe',
          organizationId: 'org-luz',
          organizationName: 'Fundación Luz',
          countryCode: 'DO',
          locationId: 'l1',
          locationName: 'Sede',
          facilitatorPersonId: 'f1',
          facilitatorName: 'Ana',
        ),
      ]
      ..members = const [
        KpiMemberDetail(personId: 'p1', firstName: 'Ana', lastName: 'Méndez'),
      ];
  });

  test('platform admin starts at the country level', () async {
    final cubit = build(admin);
    addTearDown(cubit.close);
    await cubit.load();
    expect(cubit.state.status, ReportsStatus.ready);
    expect(cubit.state.drillLevel!.kind, DrillKind.country);
    expect(cubit.state.drillLevel!.rows.map((r) => r.label), [
      'República Dominicana',
      'Colombia',
    ]);
    expect(cubit.state.options.countries, hasLength(2));
  });

  test(
    'a coordinator is locked to their organization and starts at tables',
    () async {
      final cubit = build(coordinator);
      addTearDown(cubit.close);
      await cubit.load();
      expect(cubit.state.lockedOrganizationId, 'org-luz');
      expect(cubit.state.drillLevel!.kind, DrillKind.table);
      // The breadcrumb cannot go above the locked organization.
      await cubit.drillTo(0);
      expect(cubit.state.drillPath, hasLength(1));
    },
  );

  test(
    'drilling goes country → organization → table → member and back',
    () async {
      final cubit = build(admin);
      addTearDown(cubit.close);
      await cubit.load();
      await cubit.drillInto(cubit.state.drillLevel!.rows.first);
      expect(cubit.state.drillLevel!.kind, DrillKind.organization);
      expect(kpis.breakdownCalls.last.filters.country, 'DO');

      await cubit.drillInto(cubit.state.drillLevel!.rows.first);
      expect(cubit.state.drillLevel!.kind, DrillKind.table);
      expect(kpis.tableCalls.last.organizationId, 'org-luz');

      await cubit.drillInto(cubit.state.drillLevel!.rows.first);
      expect(cubit.state.drillLevel!.kind, DrillKind.member);
      expect(cubit.state.drillLevel!.rows.single.label, 'Ana Méndez');
      expect(cubit.state.drillLevel!.next, isNull);

      await cubit.drillTo(1);
      expect(cubit.state.drillLevel!.kind, DrillKind.organization);
      await cubit.drillTo(0);
      expect(cubit.state.drillPath, isEmpty);
    },
  );

  test('changing the country resets the filters that depended on it', () async {
    final cubit = build(admin);
    addTearDown(cubit.close);
    await cubit.load(organizationId: 'org-luz', tableId: 't1');
    expect(cubit.state.filters.organizationId, 'org-luz');
    await cubit.setCountry('CO');
    expect(cubit.state.filters.country, 'CO');
    expect(cubit.state.filters.organizationId, isNull);
    expect(cubit.state.filters.roundTableId, isNull);
  });

  test('period changes the date range sent to the server', () async {
    final cubit = build(admin);
    addTearDown(cubit.close);
    await cubit.load();
    await cubit.setPeriod(4);
    expect(cubit.state.filters.periodWeeks, 4);
    final summaryFilters = kpis.breakdownCalls
        .where((c) => c.dimension == KpiDimension.module)
        .last
        .filters;
    expect(summaryFilters.from, DateTime.utc(2026, 9, 27, 12));
  });

  test('charts switch between graph and table independently', () async {
    final cubit = build(admin);
    addTearDown(cubit.close);
    await cubit.load();
    cubit.toggleChartView(ReportChart.attendance);
    expect(cubit.state.tableViews, {ReportChart.attendance});
    cubit.toggleChartView(ReportChart.attendance);
    expect(cubit.state.tableViews, isEmpty);
  });

  test('CSV export of the drill level is real text', () async {
    final cubit = build(admin);
    addTearDown(cubit.close);
    await cubit.load();
    final doc = cubit.drillCsv([
      'Nombre',
      'Mesas',
      'Asist.',
      'Valores',
      'Mejora',
      'Tarde',
    ], 'x.csv')!;
    await cubit.exportCsv(doc);
    expect(csv.exported.single.toCsv(), contains('República Dominicana'));
  });
}
