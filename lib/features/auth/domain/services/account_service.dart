import '../models/account.dart';

/// Reads what the backend knows about the signed-in identity.
abstract interface class AccountService {
  /// Throws `ApiException`.
  Future<Account> fetch();
}
