import '../models/profile_update.dart';
import '../models/user_profile.dart';

/// The signed-in person's own contact data. Online-only (ADR 0003).
abstract interface class ProfileService {
  /// `null` when the sign-in is not bound to a person yet.
  Future<UserProfile?> load();

  Future<UserProfile> update(ProfileUpdate update);
}
