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
  late MemoryVerificationStore verification;
  late FakeVerifications verifications;
  late TestClock clock;

  AccessSessionServiceImpl build() => AccessSessionServiceImpl(
    auth,
    auth,
    accounts,
    store,
    sessionContext,
    verification,
    verifications,
    clock,
  );

  Future<void> settle() => Future<void>.delayed(Duration.zero);

  setUp(() {
    auth = FakeAuthState();
    accounts = FakeAccountService();
    store = MemoryAccessStore();
    sessionContext = InMemorySessionContextService();
    verification = MemoryVerificationStore();
    verifications = FakeVerifications();
    clock = TestClock(DateTime.utc(2026, 10, 1, 8));
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
    final restarted = build();
    await settle();

    expect(restarted.state.status, AccessStatus.ready);
    expect(restarted.state.fromCache, isTrue);
    expect(sessionContext.current?.tableId, 'table-fe');
  });

  group('offline window (ADR 0005)', () {
    Future<void> signInOnline() async {
      accounts.account = accountWith([memberContext]);
      build();
      auth.signIn('user-1');
      await settle();
      expect(verification.verified['user-1'], clock.now);
    }

    Future<AccessSessionServiceImpl> restartOffline() async {
      sessionContext = InMemorySessionContextService();
      accounts.error = const ApiException(kind: ApiErrorKind.network);
      final restarted = build();
      await settle();
      return restarted;
    }

    test('keeps working from the cache on day 7', () async {
      await signInOnline();
      clock.now = clock.now.add(const Duration(days: 7));

      final restarted = await restartOffline();

      expect(restarted.state.status, AccessStatus.ready);
      expect(restarted.state.fromCache, isTrue);
    });

    test('needs an online sign-in after more than 7 days', () async {
      await signInOnline();
      clock.now = clock.now.add(const Duration(days: 7, minutes: 1));

      final restarted = await restartOffline();

      expect(restarted.state.status, AccessStatus.needsOnlineSignIn);
      expect(sessionContext.current, isNull);
    });

    test('a token refresh restarts the window', () async {
      await signInOnline();
      clock.now = clock.now.add(const Duration(days: 6));
      verifications.controller.add(null);
      await settle();
      clock.now = clock.now.add(const Duration(days: 6));

      final restarted = await restartOffline();

      expect(restarted.state.status, AccessStatus.ready);
    });

    test('coming back online lifts the block', () async {
      await signInOnline();
      clock.now = clock.now.add(const Duration(days: 9));
      final restarted = await restartOffline();
      expect(restarted.state.status, AccessStatus.needsOnlineSignIn);

      accounts.error = null;
      await restarted.refresh();

      expect(restarted.state.status, AccessStatus.ready);
      expect(verification.verified['user-1'], clock.now);
    });

    test('a device without a record starts its window now', () async {
      accounts.account = accountWith([memberContext]);
      final first = build();
      auth.signIn('user-1');
      await settle();
      expect(first.state.status, AccessStatus.ready);
      verification.verified.clear();
      clock.now = clock.now.add(const Duration(days: 30));

      final restarted = await restartOffline();

      expect(restarted.state.status, AccessStatus.ready);
      expect(verification.verified['user-1'], clock.now);
    });
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
