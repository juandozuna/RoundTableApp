import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_value.freezed.dart';

/// One of the program's 48 values.
@freezed
abstract class CurriculumValue with _$CurriculumValue {
  const factory CurriculumValue({
    required String id,
    required String name,

    /// Position in the whole program (1..48).
    required int sequence,
  }) = _CurriculumValue;
}
