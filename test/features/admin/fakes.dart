import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/id/id_generator.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_location.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_organization.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_person.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_table.dart';
import 'package:gold_roundtables/features/admin/domain/models/saved_explorer_view.dart';
import 'package:gold_roundtables/features/admin/domain/models/table_membership.dart';
import 'package:gold_roundtables/features/admin/domain/services/admin_directory_service.dart';
import 'package:gold_roundtables/features/admin/domain/services/saved_views_service.dart';
import 'package:gold_roundtables/features/kpis/domain/models/csv_document.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_breakdown_row.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_dimension.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_filters.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_member_detail.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_summary.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_table_row.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_weekly_point.dart';
import 'package:gold_roundtables/features/kpis/domain/models/revealed_answers.dart';
import 'package:gold_roundtables/features/kpis/domain/services/csv_export_service.dart';
import 'package:gold_roundtables/features/kpis/domain/services/kpi_service.dart';

class FixedClock implements ClockService {
  FixedClock([DateTime? now]) : _now = now ?? DateTime.utc(2026, 10, 25, 12);

  final DateTime _now;

  @override
  DateTime nowUtc() => _now;
}

class CountingIds implements IdGenerator {
  int _n = 0;

  @override
  String newId() => 'id-${++_n}';
}

class InMemorySavedViews implements SavedViewsService {
  List<SavedExplorerView> stored = [];

  @override
  Future<List<SavedExplorerView>> load() async => stored;

  @override
  Future<void> save(List<SavedExplorerView> views) async => stored = views;
}

class RecordingCsvExport implements CsvExportService {
  final List<CsvDocument> exported = [];

  @override
  Future<void> export(CsvDocument document) async => exported.add(document);
}

class FakeDirectory implements AdminDirectoryService {
  FakeDirectory({
    this.orgs = const [],
    this.tableRows = const [],
    this.peopleRows = const [],
    this.memberRows = const [],
    this.locationRows = const [],
  });

  List<AdminOrganization> orgs;
  List<AdminTable> tableRows;
  List<AdminPerson> peopleRows;
  List<TableMembership> memberRows;
  List<AdminLocation> locationRows;

  T _find<T>(List<T> rows, bool Function(T) test) {
    for (final row in rows) {
      if (test(row)) return row;
    }
    throw const ApiException(
      kind: ApiErrorKind.notFound,
      code: 'not_found',
      statusCode: 404,
    );
  }

  @override
  Future<List<AdminOrganization>> organizations() async => orgs;

  @override
  Future<AdminOrganization> organization(String id) async =>
      _find<AdminOrganization>(orgs, (o) => o.id == id);

  @override
  Future<List<AdminLocation>> locations({String? organizationId}) async =>
      locationRows;

  @override
  Future<AdminLocation> location(String id) async =>
      _find<AdminLocation>(locationRows, (l) => l.id == id);

  @override
  Future<List<AdminTable>> tables({String? organizationId}) async => [
    for (final t in tableRows)
      if (organizationId == null || t.organizationId == organizationId) t,
  ];

  @override
  Future<AdminTable> table(String id) async =>
      _find<AdminTable>(tableRows, (t) => t.id == id);

  @override
  Future<List<AdminPerson>> people({String? organizationId}) async => [
    for (final p in peopleRows)
      if (organizationId == null || p.organizationId == organizationId) p,
  ];

  @override
  Future<AdminPerson> person(String id) async =>
      _find<AdminPerson>(peopleRows, (p) => p.id == id);

  @override
  Future<List<TableMembership>> memberships(String roundTableId) async =>
      memberRows;
}

class FakeKpiService implements KpiService {
  KpiSummary summaryValue = const KpiSummary();
  List<KpiWeeklyPoint> weekly = const [];
  Map<KpiDimension, List<KpiBreakdownRow>> breakdowns = {};
  List<KpiTableRow> tableRows = const [];
  List<KpiMemberDetail> members = const [];
  RevealedAnswers revealed = const RevealedAnswers(roundTableId: 't');
  Object? revealError;
  final List<KpiFilters> tableCalls = [];
  final List<({KpiDimension dimension, KpiFilters filters})> breakdownCalls =
      [];
  int revealCalls = 0;

  @override
  Future<KpiSummary> summary(KpiFilters filters) async => summaryValue;

  @override
  Future<List<KpiBreakdownRow>> breakdown(
    KpiDimension dimension,
    KpiFilters filters,
  ) async {
    breakdownCalls.add((dimension: dimension, filters: filters));
    return breakdowns[dimension] ?? const [];
  }

  @override
  Future<List<KpiWeeklyPoint>> weeklySeries(KpiFilters filters) async => weekly;

  @override
  Future<List<KpiTableRow>> tables(KpiFilters filters) async {
    tableCalls.add(filters);
    return tableRows;
  }

  @override
  Future<List<KpiMemberDetail>> memberDetail(String roundTableId) async =>
      members;

  @override
  Future<RevealedAnswers> revealAnswers({
    required String roundTableId,
    String? personId,
  }) async {
    revealCalls++;
    final error = revealError;
    if (error != null) throw error;
    return revealed;
  }
}
