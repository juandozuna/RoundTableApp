import 'package:injectable/injectable.dart';

import '../../models/user_profile.dart';
import '../../services/profile_service.dart';

@injectable
class LoadProfileUseCase {
  const LoadProfileUseCase(this._profiles);

  final ProfileService _profiles;

  Future<UserProfile?> call() => _profiles.load();
}
