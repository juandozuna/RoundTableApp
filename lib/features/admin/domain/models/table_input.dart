import 'package:freezed_annotation/freezed_annotation.dart';

import 'round_table_status.dart';

part 'table_input.freezed.dart';
part 'table_input.g.dart';

/// Schedule and identity of a table; absent fields are left unchanged on
/// update. [startTime] is `HH:MM`, [weekday] ISO 1 = Monday.
@freezed
abstract class TableInput with _$TableInput {
  const factory TableInput({
    String? locationId,
    String? name,
    String? code,
    int? weekday,
    String? startTime,
    String? timezone,
    int? durationMinutes,
    RoundTableStatus? status,
  }) = _TableInput;

  factory TableInput.fromJson(Map<String, dynamic> json) =>
      _$TableInputFromJson(json);
}
