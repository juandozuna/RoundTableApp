import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_input.freezed.dart';
part 'person_input.g.dart';

/// Contact data of a person to register (phone is E.164, unverified).
@freezed
abstract class PersonInput with _$PersonInput {
  const factory PersonInput({
    required String firstName,
    required String lastName,
    String? position,
    String? email,
    String? phone,
  }) = _PersonInput;

  factory PersonInput.fromJson(Map<String, dynamic> json) =>
      _$PersonInputFromJson(json);
}

/// An existing person (by id) or a new one to register.
@freezed
sealed class PersonRef with _$PersonRef {
  const PersonRef._();

  const factory PersonRef.existing(String personId) = ExistingPersonRef;
  const factory PersonRef.registered(PersonInput person) = NewPersonRef;

  /// Request fragment: `{person_id}` or `{person: {...}}`.
  Map<String, dynamic> toRequest() => switch (this) {
    ExistingPersonRef(:final personId) => {'person_id': personId},
    NewPersonRef(:final person) => {'person': person.toJson()},
  };
}
