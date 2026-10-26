import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_update.freezed.dart';

/// Fields a person may change on their own profile. Applied to every person
/// row of the sign-in.
@freezed
abstract class ProfileUpdate with _$ProfileUpdate {
  const factory ProfileUpdate({
    required String firstName,
    required String lastName,
    String? position,

    /// E.164, unverified.
    String? phone,
  }) = _ProfileUpdate;
}
