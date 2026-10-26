import 'package:injectable/injectable.dart';

import '../../domain/models/profile_update.dart';
import '../../domain/models/user_profile.dart';
import '../../domain/services/profile_service.dart';
import '../datasources/settings_remote_data_source.dart';

@LazySingleton(as: ProfileService)
class ProfileServiceImpl implements ProfileService {
  ProfileServiceImpl(this._remote);

  final SettingsRemoteDataSource _remote;

  @override
  Future<UserProfile?> load() async => (await _remote.me()).people.firstOrNull;

  @override
  Future<UserProfile> update(ProfileUpdate update) async {
    final account = await _remote.updateMe(update);
    final profile = account.people.firstOrNull;
    if (profile == null) {
      throw StateError('The server returned no person after the update');
    }
    return profile;
  }
}
