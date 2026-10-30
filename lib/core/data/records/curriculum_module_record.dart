import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_module_record.freezed.dart';
part 'curriculum_module_record.g.dart';

/// Row of `curriculum_modules` (reference data, readable by every signed-in user).
@freezed
abstract class CurriculumModuleRecord with _$CurriculumModuleRecord {
  const factory CurriculumModuleRecord({
    required String id,
    required int number,
    required String name,
    String? description,
    required int valueCount,
    required String status,
  }) = _CurriculumModuleRecord;

  factory CurriculumModuleRecord.fromJson(Map<String, dynamic> json) =>
      _$CurriculumModuleRecordFromJson(json);
}
