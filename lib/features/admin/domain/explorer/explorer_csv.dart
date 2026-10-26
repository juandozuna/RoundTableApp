import '../../../kpis/domain/models/csv_document.dart';
import '../models/admin_person.dart';
import '../models/explorer_organization.dart';
import '../models/explorer_table.dart';
import 'explorer_engine.dart';

/// CSV documents of the Explorador grids. Headers come localized.
abstract final class ExplorerCsv {
  static String _n(num? value) => value == null ? '' : value.toString();

  static CsvDocument tables(
    List<ExplorerTable> rows,
    List<String> headers, {
    String filename = 'mesas.csv',
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final t in rows)
        [
          t.code,
          t.name,
          t.organizationName,
          t.locationName ?? '',
          t.facilitatorName ?? '',
          '${t.activePeople}',
          t.health.wireValue,
          _n(t.attendancePct),
          '${t.valuesCompleted}',
          _n(t.improvementAvg),
          '${t.syncedLateRows}',
        ],
    ],
  );

  static CsvDocument organizations(
    List<ExplorerOrganization> rows,
    List<String> headers, {
    String filename = 'organizaciones.csv',
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final o in rows)
        [
          o.organization.name,
          o.organization.kind,
          o.organization.countryName,
          o.organization.status.wireValue,
          '${o.tablesTotal}',
          '${o.people}',
          _n(o.attendancePct),
          _n(o.improvementAvg),
        ],
    ],
  );

  static CsvDocument people(
    List<AdminPerson> rows,
    List<String> headers, {
    String filename = 'personas.csv',
  }) => CsvDocument(
    filename: filename,
    headers: headers,
    rows: [
      for (final p in rows)
        [
          p.fullName,
          ExplorerEngine.personKind(p).name,
          p.email ?? '',
          p.phone ?? '',
          p.currentTable?.roundTableName ?? '',
          p.status.wireValue,
        ],
    ],
  );
}
