import 'dart:async';

import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/network/auth_token_provider.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_state_source.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';
import 'package:gold_roundtables/features/auth/domain/models/account.dart';
import 'package:gold_roundtables/features/auth/domain/models/account_context.dart';
import 'package:gold_roundtables/features/auth/domain/models/account_person.dart';
import 'package:gold_roundtables/features/auth/domain/models/person_status.dart';
import 'package:gold_roundtables/features/auth/domain/services/access_store.dart';
import 'package:gold_roundtables/features/auth/domain/services/account_service.dart';

class FakeAuthState implements AuthStateSource, AuthTokenProvider {
  FakeAuthState({
    AuthStatus status = AuthStatus.unauthenticated,
    String? userId,
  }) : _status = status,
       _userId = userId;

  AuthStatus _status;
  String? _userId;
  final StreamController<AuthStatus> _changes =
      StreamController<AuthStatus>.broadcast();

  @override
  AuthStatus get status => _status;

  @override
  Stream<AuthStatus> get statusChanges => _changes.stream;

  @override
  String? get accessToken => _userId == null ? null : 'token';

  @override
  String? get userId => _userId;

  @override
  Future<String?> refreshAccessToken() async => accessToken;

  void signIn(String userId) {
    _userId = userId;
    _status = AuthStatus.authenticated;
    _changes.add(_status);
  }

  void signOut() {
    _userId = null;
    _status = AuthStatus.unauthenticated;
    _changes.add(_status);
  }
}

class FakeAccountService implements AccountService {
  Account? account;
  ApiException? error;
  int calls = 0;

  @override
  Future<Account> fetch() async {
    calls++;
    final failure = error;
    if (failure != null) throw failure;
    return account!;
  }
}

class MemoryAccessStore implements AccessStore {
  final Map<String, String> selected = {};
  final Map<String, Account> accounts = {};

  @override
  Future<String?> readSelectedContextKey(String userId) async =>
      selected[userId];

  @override
  Future<void> saveSelectedContextKey(String userId, String contextKey) async =>
      selected[userId] = contextKey;

  @override
  Future<Account?> readAccount(String userId) async => accounts[userId];

  @override
  Future<void> saveAccount(String userId, Account account) async =>
      accounts[userId] = account;
}

const memberContext = AccountContext(
  kind: UserRole.member,
  personId: 'p-member',
  organizationId: 'org-luz',
  organizationName: 'Fundación Luz',
  roundTableId: 'table-fe',
  roundTableName: 'Mesa Fe 01',
  label: 'Miembro · Mesa Fe 01',
);

const coordinatorContext = AccountContext(
  kind: UserRole.coordinator,
  personId: 'p-coord',
  organizationId: 'org-luz',
  organizationName: 'Fundación Luz',
  label: 'Coordinador · Fundación Luz',
);

AccountPerson person(
  String id, {
  PersonStatus status = PersonStatus.active,
  String first = 'Julia',
}) =>
    AccountPerson(id: id, firstName: first, lastName: 'Ferrer', status: status);

Account accountWith(
  List<AccountContext> contexts, {
  List<AccountPerson>? people,
}) => Account(
  authUserId: 'user-1',
  people: people ?? [person('p-member')],
  contexts: contexts,
);
