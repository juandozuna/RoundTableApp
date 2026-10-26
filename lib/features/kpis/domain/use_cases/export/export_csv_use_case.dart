import 'package:injectable/injectable.dart';

import '../../models/csv_document.dart';
import '../../services/csv_export_service.dart';

@injectable
class ExportCsvUseCase {
  const ExportCsvUseCase(this._export);

  final CsvExportService _export;

  Future<void> call(CsvDocument document) => _export.export(document);
}
