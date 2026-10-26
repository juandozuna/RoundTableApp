import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_draft.freezed.dart';
part 'person_draft.g.dart';

/// Pre-registration data of the person being invited (PC-15).
@freezed
abstract class PersonDraft with _$PersonDraft {
  const factory PersonDraft({
    required String firstName,
    required String lastName,
    String? position,
    String? email,

    /// E.164, unverified.
    String? phone,
  }) = _PersonDraft;

  factory PersonDraft.fromJson(Map<String, dynamic> json) =>
      _$PersonDraftFromJson(json);
}
