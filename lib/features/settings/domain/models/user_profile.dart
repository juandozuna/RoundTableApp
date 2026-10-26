import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// Contact data of the signed-in person (`people` row). Phone and email are
/// stored as typed and never verified (ADR 0007).
@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String firstName,
    required String lastName,
    String? organizationId,
    String? position,
    String? email,
    String? phone,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  const UserProfile._();

  String get fullName => '$firstName $lastName'.trim();
}
