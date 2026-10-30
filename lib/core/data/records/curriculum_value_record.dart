import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_value_record.freezed.dart';
part 'curriculum_value_record.g.dart';

/// Row of `curriculum_values` (reference data).
@freezed
abstract class CurriculumValueRecord with _$CurriculumValueRecord {
  const factory CurriculumValueRecord({
    required String id,
    required String moduleId,
    required int numberInModule,
    required int sequence,
    required String name,
    String? description,
    String? bookletReference,
    required String status,
  }) = _CurriculumValueRecord;

  factory CurriculumValueRecord.fromJson(Map<String, dynamic> json) =>
      _$CurriculumValueRecordFromJson(json);
}
