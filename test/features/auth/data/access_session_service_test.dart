import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/session_context/in_memory_session_context_service.dart';
import 'package:gold_roundtables/features/auth/data/services/access_session_service_impl.dart';
import 'package:gold_roundtables/features/auth/domain/models/access_state.dart';
import 'package:gold_roundtables/features/auth/domain/models/account.dart';
import 'package:gold_roundtables/features/auth/domain/models/person_status.dart';

import '../helpers/fakes.dart';

void main() {
  late FakeAuthState auth;
  late FakeAccountService accounts;
  late MemoryAccessStore store;
  late InMemorySessionContextService sessionContext;

  AccessSessionServiceImpl build() =>
      AccessSessionServiceImpl(auth, auth, accounts, store, sessionContext);

  Future<void> settle() => Future<void>.delayed(Duration.zero);

  setUp(() {
    auth = FakeAuthState();
    accounts = FakeAccountService();
    store = MemoryAccessStore();
    sessionContext = InMemorySessionContextService();
  });

  test('starts signed out', () {
    expect(build().state.status, AccessStatus.signedOut);
  });

  test('a single context becomes active without asking', () async {
    accounts.account = accountWith([memberContext]);
    final service = build();
    auth.signIn('user-1');
    await settle();

    expect(service.state.status, AccessStatus.ready);
    expect(service.state.active, memberContext);
    expect(sessionContext.current?.role, UserRole.member);
    expect(sessionContext.current?.personId, 'p-member');
    expect(sessionContext.current?.tableId, 'table-fe');
    expect(store.selected['user-1'], memberContext.key);
  });

  test(
    'several contexts without a remembered choice need the picker',
    () async {
      accounts.account = accountWith([coordinatorContext, memberContext]);
      final service = build();
      auth.signIn('user-1');
      await settle();

      expect(service.state.status, AccessStatus.needsContext);
      expect(service.state.contexts, hasLength(2));
      expect(sessionContext.current, isNull);

      await service.selectContext(memberContext);
      expect(service.state.status, AccessStatus.ready);
      expect(service.state.active, memberContext);
      expect(sessionContext.current?.role, UserRole.member);
    },
  );

  test('a remembered choice skips the picker on the next sign-in', () async {
    store.selected['user-1'] = coordinatorContext.key;
    accounts.account = accountWith([coordinatorContext, memberContext]);
    final service = build();
    auth.signIn('user-1');
    await settle();

    expect(service.state.status, AccessStatus.ready);
    expect(service.state.active, coordinatorContext);
  });

  test('a remembered choice that no longer exists asks again', () async {
    store.selected['user-1'] = 'gone';
    accounts.account = accountWith([coordinatorContext, memberContext]);
    final service = build();
    auth.signIn('user-1');
    await settle();

    expect(service.state.status, AccessStatus.needsContext);
  });

  test(
    'preferPersonId selects the context of the newly joined person',
    () async {
      accounts.account = accountWith([coordinatorContext, memberContext]);
      final service = build();
      auth.signIn('user-1');
      await settle();

      await service.refresh(preferPersonId: 'p-member');
      expect(service.state.active, memberContext);
    },
  );

  test('explains why an identity cannot enter', () async {
    final service = build();
    auth.signIn('user-1');

    accounts.account = const Account(authUserId: 'user-1');
    await service.refresh();
    expect(service.state.status, AccessStatus.unknownAccount);

    accounts.account = accountWith(const []);
    await service.refresh();
    expect(service.state.status, AccessStatus.noRole);

    accounts.account = accountWith(
      const [],
      people: [person('p1', status: PersonStatus.inactive)],
    );
    await service.refresh();
    expect(service.state.status, AccessStatus.deactivated);
    expect(sessionContext.current, isNull);
  });

  test('offline falls back to the account cached on this device', () async {
    accounts.account = accountWith([memberContext]);
    final first = build();
    auth.signIn('user-1');
    await settle();
    expect(first.state.status, AccessStatus.ready);

    // New app run: still signed in, server unreachable.
    sessionContext = InMemorySessionContextService();
    accounts.error = const ApiException(kind: ApiErrorKind.network);
    final restarted = AccessSessionServiceImpl(
      auth,
      auth,
      accounts,
      store,
      sessionContext,
    );
    await settle();

    expect(restarted.state.status, AccessStatus.ready);
    expect(restarted.state.fromCache, isTrue);
    expect(sessionContext.current?.tableId, 'table-fe');
  });

  test('offline with nothing cached fails with the reason', () async {
    accounts.error = const ApiException(kind: ApiErrorKind.network);
    final service = build();
    auth.signIn('user-1');
    await settle();

    expect(service.state.status, AccessStatus.failed);
    expect(service.state.failure?.kind, ApiErrorKind.network);
  });

  test('signing out clears the active context', () async {
    accounts.account = accountWith([memberContext]);
    final service = build();
    auth.signIn('user-1');
    await settle();

    auth.signOut();
    await settle();

    expect(service.state.status, AccessStatus.signedOut);
    expect(sessionContext.current, isNull);
  });

  test('a background refresh that fails keeps the current context', () async {
    accounts.account = accountWith([memberContext]);
    final service = build();
    auth.signIn('user-1');
    await settle();

    accounts.error = const ApiException(kind: ApiErrorKind.timeout);
    await service.refresh();
    expect(service.state.status, AccessStatus.ready);
    expect(service.state.active, memberContext);
  });
}
