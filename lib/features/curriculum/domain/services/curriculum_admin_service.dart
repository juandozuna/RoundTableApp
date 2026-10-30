import '../models/curriculum_edit.dart';
import '../models/curriculum_plan.dart';
import '../models/curriculum_upload.dart';
import '../models/curriculum_view.dart';

/// Curriculum administration for platform administrators. Online only
/// (ADR 0003); the server validates, applies atomically and audits (ADR 0017).
abstract interface class CurriculumAdminService {
  /// The curriculum with [locale]'s text (Spanish when null).
  Future<CurriculumView> load({String? locale});

  /// What the upload would change, writing nothing.
  Future<CurriculumPlan> previewUpload(CurriculumUpload upload);

  /// Applies the upload in one transaction. Re-sending the same file changes
  /// nothing.
  Future<CurriculumPlan> applyUpload(CurriculumUpload upload);

  /// Returns whether anything changed.
  Future<bool> edit(CurriculumEdit edit);

  Future<void> addQuestion(NewQuestion question);

  Future<void> addLanguage({required String code, required String name});

  Future<void> setLanguageActive(String code, {required bool active});
}
