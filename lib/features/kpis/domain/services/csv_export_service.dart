import '../models/csv_document.dart';

/// Hands a CSV file to the user: a browser download on web, the share sheet
/// on mobile.
abstract interface class CsvExportService {
  Future<void> export(CsvDocument document);
}
