import 'package:injectable/injectable.dart';

import '../../domain/models/account.dart';
import '../../domain/services/account_service.dart';
import '../datasources/account_remote_data_source.dart';

@LazySingleton(as: AccountService)
class AccountServiceImpl implements AccountService {
  AccountServiceImpl(this._remote);

  final AccountRemoteDataSource _remote;

  @override
  Future<Account> fetch() => _remote.me();
}
