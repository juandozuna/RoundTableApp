import 'package:injectable/injectable.dart';

import '../../domain/models/curriculum_edit.dart';
import '../../domain/models/curriculum_plan.dart';
import '../../domain/models/curriculum_upload.dart';
import '../../domain/models/curriculum_view.dart';
import '../../domain/services/curriculum_admin_service.dart';
import '../datasources/curriculum_remote_data_source.dart';

@LazySingleton(as: CurriculumAdminService)
class CurriculumAdminServiceImpl implements CurriculumAdminService {
  CurriculumAdminServiceImpl(this._remote);

  final CurriculumRemoteDataSource _remote;

  @override
  Future<CurriculumView> load({String? locale}) => _remote.load(locale: locale);

  @override
  Future<CurriculumPlan> previewUpload(CurriculumUpload upload) =>
      _remote.upload(upload, dryRun: true);

  @override
  Future<CurriculumPlan> applyUpload(CurriculumUpload upload) =>
      _remote.upload(upload, dryRun: false);

  @override
  Future<bool> edit(CurriculumEdit edit) => _remote.edit(edit);

  @override
  Future<void> addQuestion(NewQuestion question) =>
      _remote.addQuestion(question);

  @override
  Future<void> addLanguage({required String code, required String name}) =>
      _remote.addLanguage(code: code, name: name);

  @override
  Future<void> setLanguageActive(String code, {required bool active}) =>
      _remote.setLanguageActive(code, active: active);
}
