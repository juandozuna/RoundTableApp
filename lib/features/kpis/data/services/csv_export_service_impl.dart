import 'package:injectable/injectable.dart';

import '../../domain/models/csv_document.dart';
import '../../domain/services/csv_export_service.dart';
import 'csv_file_saver.dart';

@LazySingleton(as: CsvExportService)
class CsvExportServiceImpl implements CsvExportService {
  @override
  Future<void> export(CsvDocument document) =>
      saveCsvFile(document.filename, document.toCsv());
}
