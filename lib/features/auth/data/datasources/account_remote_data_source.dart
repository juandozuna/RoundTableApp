import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../../domain/models/account.dart';
import '../client/account_client.dart';

@lazySingleton
class AccountRemoteDataSource {
  AccountRemoteDataSource(this._client);

  final AccountClient _client;

  Future<Account> me() => guardApiCall(_client.me);
}
