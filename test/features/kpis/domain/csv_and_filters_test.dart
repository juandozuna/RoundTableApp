import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/kpis/domain/models/csv_document.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_filters.dart';
import 'package:gold_roundtables/features/kpis/domain/models/report_filters.dart';

void main() {
  group('CsvDocument', () {
    test('quotes commas, quotes and line breaks (RFC 4180)', () {
      const doc = CsvDocument(
        filename: 'x.csv',
        headers: ['Nombre', 'Nota'],
        rows: [
          ['Ana, Luz', 'dijo "hola"'],
          ['Luis', 'línea1\nlínea2'],
        ],
      );
      expect(
        doc.toCsv(),
        'Nombre,Nota\r\n'
        '"Ana, Luz","dijo ""hola"""\r\n'
        'Luis,"línea1\nlínea2"\r\n',
      );
    });

    test('keeps accents untouched', () {
      const doc = CsvDocument(
        filename: 'x.csv',
        headers: ['Año'],
        rows: [
          ['Peña'],
        ],
      );
      expect(doc.toCsv(), 'Año\r\nPeña\r\n');
    });
  });

  group('filters', () {
    test('RPC params omit absent filters and format dates', () {
      final filters = KpiFilters(
        from: DateTime.utc(2026, 8, 1),
        to: DateTime.utc(2026, 10, 25),
        country: 'DO',
        organizationId: 'org',
      );
      expect(filters.toParams(), {
        'p_from': '2026-08-01',
        'p_to': '2026-10-25',
        'p_country': 'DO',
        'p_organization_id': 'org',
      });
    });

    test('kpi_tables only receives the filters it supports', () {
      const filters = KpiFilters(
        country: 'CO',
        moduleId: 'm1',
        health: 'delayed',
      );
      expect(filters.toTableParams(), {
        'p_country': 'CO',
        'p_health': 'delayed',
      });
    });

    test('report period turns into a date range ending today', () {
      final now = DateTime.utc(2026, 10, 25);
      final kpi = const ReportFilters(
        periodWeeks: 4,
        country: 'DO',
      ).toKpiFilters(now);
      expect(kpi.from, DateTime.utc(2026, 9, 27));
      expect(kpi.to, now);
      expect(kpi.country, 'DO');
    });
  });
}
