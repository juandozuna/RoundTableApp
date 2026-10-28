import 'package:freezed_annotation/freezed_annotation.dart';

import 'round_table_status.dart';

part 'table_input.freezed.dart';
part 'table_input.g.dart';

/// Schedule, identity and program position of a table; absent fields are
/// left unchanged on update. [startTime] is `HH:MM`, [weekday] ISO 1 = Monday.
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

    /// Create only: value the program starts at (default: value 1).
    String? startValueId,

    /// Edit only: value the table works next (RF-28).
    String? currentValueId,

    /// Edit only: the admin confirmed moving back past completed history.
    bool? confirmRewind,
  }) = _TableInput;

  factory TableInput.fromJson(Map<String, dynamic> json) =>
      _$TableInputFromJson(json);
}
