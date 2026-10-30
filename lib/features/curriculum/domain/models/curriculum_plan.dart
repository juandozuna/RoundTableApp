import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_plan.freezed.dart';
part 'curriculum_plan.g.dart';

enum CurriculumEntity {
  @JsonValue('module')
  module,
  @JsonValue('value')
  value,
  @JsonValue('question')
  question,
}

enum CurriculumChangeAction {
  @JsonValue('create')
  create,
  @JsonValue('update')
  update,
  @JsonValue('reactivate')
  reactivate,
  @JsonValue('deactivate')
  deactivate,
  @JsonValue('delete')
  delete,
}

@freezed
abstract class FieldChange with _$FieldChange {
  const factory FieldChange({String? from, String? to}) = _FieldChange;

  factory FieldChange.fromJson(Map<String, dynamic> json) =>
      _$FieldChangeFromJson(json);
}

/// One row of the diff shown before an upload is applied.
@freezed
abstract class CurriculumChange with _$CurriculumChange {
  const factory CurriculumChange({
    @JsonKey(unknownEnumValue: CurriculumEntity.value)
    required CurriculumEntity entity,

    /// Module / value number, or `value/code` for a question.
    required String key,
    @Default('') String label,
    @JsonKey(unknownEnumValue: CurriculumChangeAction.update)
    required CurriculumChangeAction action,
    @Default({}) Map<String, FieldChange> fields,

    /// For deactivated questions: answers exist, so it is kept, not deleted.
    @Default(false) bool answered,
  }) = _CurriculumChange;

  factory CurriculumChange.fromJson(Map<String, dynamic> json) =>
      _$CurriculumChangeFromJson(json);
}

/// A change the server refuses because it would alter data sessions used.
@freezed
abstract class CurriculumRefusal with _$CurriculumRefusal {
  const factory CurriculumRefusal({
    required String key,
    @Default('') String label,
    @Default('') String message,
  }) = _CurriculumRefusal;

  factory CurriculumRefusal.fromJson(Map<String, dynamic> json) =>
      _$CurriculumRefusalFromJson(json);
}

@freezed
abstract class CurriculumPlan with _$CurriculumPlan {
  const CurriculumPlan._();

  const factory CurriculumPlan({
    @Default(true) bool dryRun,
    @Default(false) bool applied,
    @Default([]) List<CurriculumChange> changes,
    @Default([]) List<CurriculumRefusal> refused,
  }) = _CurriculumPlan;

  factory CurriculumPlan.fromJson(Map<String, dynamic> json) =>
      _$CurriculumPlanFromJson(json);

  bool get isEmpty => changes.isEmpty && refused.isEmpty;

  /// Can be applied: something changes and nothing is refused.
  bool get canApply => changes.isNotEmpty && refused.isEmpty;

  int countOf(CurriculumChangeAction action) =>
      changes.where((c) => c.action == action).length;
}
