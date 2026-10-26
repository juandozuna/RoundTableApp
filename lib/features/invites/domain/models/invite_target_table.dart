import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/constants/app_constants.dart';

part 'invite_target_table.freezed.dart';
part 'invite_target_table.g.dart';

/// A table an invite can add someone to, with its seat count (`admin_tables`).
@freezed
abstract class InviteTargetTable with _$InviteTargetTable {
  const factory InviteTargetTable({
    required String id,
    required String organizationId,
    String? organizationName,
    required String name,
    String? code,
    String? status,
    @Default(0) int activePeople,
    @Default(AppLimits.maxTableSeats) int maxPeople,
    String? facilitatorPersonId,
    String? facilitatorName,
  }) = _InviteTargetTable;

  const InviteTargetTable._();

  factory InviteTargetTable.fromJson(Map<String, dynamic> json) =>
      _$InviteTargetTableFromJson(json);

  /// Seats held by members and by pending invites; the facilitator counts.
  bool get isFull => activePeople >= maxPeople;

  int get freeSeats => (maxPeople - activePeople).clamp(0, maxPeople);

  bool get hasFacilitator => facilitatorPersonId != null;

  bool get acceptsInvites =>
      status == null || status == 'active' || status == 'paused';
}
