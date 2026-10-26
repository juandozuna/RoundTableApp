import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_constants.dart';
import 'round_table_status.dart';

part 'admin_table.freezed.dart';
part 'admin_table.g.dart';

/// A row of the `admin_tables` view.
@freezed
abstract class AdminTable with _$AdminTable {
  const AdminTable._();

  const factory AdminTable({
    required String id,
    required String organizationId,
    required String organizationName,
    String? locationId,
    String? locationName,
    required String name,
    required String code,
    @Default(1) int weekday,
    @Default('00:00:00') String startTime,
    @Default('UTC') String timezone,
    @Default(30) int durationMinutes,
    @JsonKey(unknownEnumValue: RoundTableStatus.closed)
    @Default(RoundTableStatus.active)
    RoundTableStatus status,
    String? currentValueId,
    int? currentValueSequence,
    String? currentValueName,
    String? facilitatorPersonId,
    String? facilitatorName,
    @Default(0) int activePeople,
    @Default(AppLimits.maxTableSeats) int maxPeople,
    String? pendingSessionId,
    String? pendingSessionStatus,
    DateTime? pendingSessionAt,
  }) = _AdminTable;

  factory AdminTable.fromJson(Map<String, dynamic> json) =>
      _$AdminTableFromJson(json);

  /// `HH:MM` of [startTime].
  String get startTimeShort =>
      startTime.length >= 5 ? startTime.substring(0, 5) : startTime;

  bool get isFull => activePeople >= maxPeople;

  bool get hasFacilitator => facilitatorPersonId != null;
}
