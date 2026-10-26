import 'package:freezed_annotation/freezed_annotation.dart';

import 'membership_role.dart';
import 'person_status.dart';

part 'admin_person.freezed.dart';
part 'admin_person.g.dart';

@freezed
abstract class AdminPersonRole with _$AdminPersonRole {
  const factory AdminPersonRole({
    required String id,
    required String role,
    String? organizationId,
  }) = _AdminPersonRole;

  factory AdminPersonRole.fromJson(Map<String, dynamic> json) =>
      _$AdminPersonRoleFromJson(json);
}

@freezed
abstract class AdminPersonTable with _$AdminPersonTable {
  const factory AdminPersonTable({
    required String tableMemberId,
    required String roundTableId,
    String? roundTableName,
    @JsonKey(unknownEnumValue: MembershipRole.member)
    @Default(MembershipRole.member)
    MembershipRole role,
  }) = _AdminPersonTable;

  factory AdminPersonTable.fromJson(Map<String, dynamic> json) =>
      _$AdminPersonTableFromJson(json);
}

/// A row of the `admin_people` view.
@freezed
abstract class AdminPerson with _$AdminPerson {
  const AdminPerson._();

  const factory AdminPerson({
    required String id,
    String? organizationId,
    required String firstName,
    required String lastName,
    String? position,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: PersonStatus.inactive)
    @Default(PersonStatus.active)
    PersonStatus status,
    @Default(false) bool linked,
    @Default([]) List<AdminPersonRole> roles,
    @Default([]) List<AdminPersonTable> tables,
  }) = _AdminPerson;

  factory AdminPerson.fromJson(Map<String, dynamic> json) =>
      _$AdminPersonFromJson(json);

  String get fullName => '$firstName $lastName'.trim();

  bool get isCoordinator => roles.any((r) => r.role == 'coordinator');

  /// Platform staff have no organization.
  bool get isStaff => organizationId == null;

  bool get isFacilitator =>
      tables.any((t) => t.role == MembershipRole.facilitator);

  AdminPersonTable? get facilitatedTable {
    for (final table in tables) {
      if (table.role == MembershipRole.facilitator) return table;
    }
    return null;
  }

  AdminPersonTable? get currentTable => tables.firstOrNull;
}
