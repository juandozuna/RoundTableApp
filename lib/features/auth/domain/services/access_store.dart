import '../models/account.dart';

/// Device-local memory of an identity's choices, so the app can start and
/// work offline: the account last seen and the context last chosen.
abstract interface class AccessStore {
  Future<String?> readSelectedContextKey(String userId);

  Future<void> saveSelectedContextKey(String userId, String contextKey);

  Future<Account?> readAccount(String userId);

  Future<void> saveAccount(String userId, Account account);
}
