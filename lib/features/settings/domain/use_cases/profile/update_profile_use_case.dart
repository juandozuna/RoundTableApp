import 'package:injectable/injectable.dart';

import '../../models/profile_update.dart';
import '../../models/user_profile.dart';
import '../../services/profile_service.dart';

@injectable
class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._profiles);

  final ProfileService _profiles;

  Future<UserProfile> call(ProfileUpdate update) => _profiles.update(update);
}
