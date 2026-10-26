import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../auth/domain/models/person_status.dart';

part 'invite_person.freezed.dart';
part 'invite_person.g.dart';

/// The pre-registered person an invite is for.
@freezed
abstract class InvitePerson with _$InvitePerson {
  const factory InvitePerson({
    required String id,
    String? organizationId,
    required String firstName,
    required String lastName,
    String? position,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: PersonStatus.invited)
    @Default(PersonStatus.invited)
    PersonStatus status,
    @Default(false) bool linked,
  }) = _InvitePerson;

  const InvitePerson._();

  factory InvitePerson.fromJson(Map<String, dynamic> json) =>
      _$InvitePersonFromJson(json);

  String get fullName => '$firstName $lastName'.trim();
}
