import 'package:injectable/injectable.dart';

import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/content_language.dart';
import '../../domain/services/selected_content_language_service.dart';
import '../datasources/content_language_local_data_source.dart';

@LazySingleton(as: SelectedContentLanguageService)
class SelectedContentLanguageServiceImpl
    implements SelectedContentLanguageService {
  SelectedContentLanguageServiceImpl(this._local);

  final ContentLanguageLocalDataSource _local;

  @override
  Future<String> readCode() async {
    try {
      return await _local.readSelected() ?? ContentLanguageChoice.baseCode;
    } on Object catch (error) {
      AppLog.warning('settings', 'Stored content language unreadable', error);
      return ContentLanguageChoice.baseCode;
    }
  }
}
