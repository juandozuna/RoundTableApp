import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../client/notifications_client.dart';

@lazySingleton
class NotificationsRemoteDataSource {
  NotificationsRemoteDataSource(this._client);

  final NotificationsClient _client;

  /// Re-registering a token moves it to the current user.
  Future<void> registerToken({
    required String token,
    required String platform,
  }) => guardApiCall(
    () => _client.registerToken({'token': token, 'platform': platform}),
  );

  Future<void> removeToken(String token) =>
      guardApiCall(() => _client.removeToken({'token': token}));
}
