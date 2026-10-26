import 'package:freezed_annotation/freezed_annotation.dart';

import 'person_status.dart';

part 'account_person.freezed.dart';
part 'account_person.g.dart';

/// One `people` row bound to the signed-in identity (one per organization).
@freezed
abstract class AccountPerson with _$AccountPerson {
  const factory AccountPerson({
    required String id,
    String? organizationId,
    required String firstName,
    required String lastName,
    String? position,
    String? email,
    String? phone,
    @JsonKey(unknownEnumValue: PersonStatus.active)
    @Default(PersonStatus.active)
    PersonStatus status,
    @Default(true) bool linked,
  }) = _AccountPerson;

  factory AccountPerson.fromJson(Map<String, dynamic> json) =>
      _$AccountPersonFromJson(json);
}
