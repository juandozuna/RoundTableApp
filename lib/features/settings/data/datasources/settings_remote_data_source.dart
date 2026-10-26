import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../../domain/models/my_account.dart';
import '../../domain/models/profile_update.dart';
import '../client/settings_client.dart';

@lazySingleton
class SettingsRemoteDataSource {
  SettingsRemoteDataSource(this._client);

  final SettingsClient _client;

  Future<MyAccount> me() => guardApiCall(_client.me);

  Future<MyAccount> updateMe(ProfileUpdate update) => guardApiCall(
    () => _client.updateMe({
      'first_name': update.firstName,
      'last_name': update.lastName,
      'position': update.position,
      'phone': update.phone,
    }),
  );
}
