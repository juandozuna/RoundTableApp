import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/network/auth_token_provider.dart';
import '../../../../core/services/auth_session/auth_state_source.dart';
import '../../../../core/services/auth_session/auth_status.dart';
import '../../../../core/services/auth_session/offline_window.dart';
import '../../../../core/services/auth_session/online_verification_store.dart';
import '../../../../core/services/auth_session/session_verification_source.dart';
import '../../../../core/services/clock/clock_service.dart';
import '../../../../core/services/logging/app_log.dart';
import '../../../../core/services/session_context/session_context_service.dart';
import '../../domain/models/access_state.dart';
import '../../domain/models/account.dart';
import '../../domain/models/account_context.dart';
import '../../domain/services/access_session_service.dart';
import '../../domain/services/access_store.dart';
import '../../domain/services/account_service.dart';

@LazySingleton(as: AccessSessionService)
class AccessSessionServiceImpl implements AccessSessionService {
  AccessSessionServiceImpl(
    this._authState,
    this._tokens,
    this._accounts,
    this._store,
    this._sessionContext,
    this._verification,
    this._verifications,
    this._clock,
  ) {
    // Lives as long as the app (lazy singleton).
    // ignore: cancel_subscriptions
    _authState.statusChanges.listen(_onAuthChanged);
    // ignore: cancel_subscriptions
    _verifications.verifications.listen((_) => unawaited(_recordVerified()));
    if (_authState.status == AuthStatus.authenticated) {
      _state = const AccessState(status: AccessStatus.resolving);
      unawaited(refresh());
    }
  }

  final AuthStateSource _authState;
  final AuthTokenProvider _tokens;
  final AccountService _accounts;
  final AccessStore _store;
  final SessionContextService _sessionContext;
  final OnlineVerificationStore _verification;
  final SessionVerificationSource _verifications;
  final ClockService _clock;

  final StreamController<AccessState> _changes =
      StreamController<AccessState>.broadcast();
  AccessState _state = const AccessState();
  Future<void>? _inFlight;

  @override
  AccessState get state => _state;

  @override
  Stream<AccessState> watch() {
    StreamSubscription<AccessState>? subscription;
    late final StreamController<AccessState> controller;
    controller = StreamController<AccessState>(
      onListen: () {
        controller.add(_state);
        subscription = _changes.stream.listen(controller.add);
      },
      onCancel: () => subscription?.cancel(),
    );
    return controller.stream;
  }

  @override
  Future<void> refresh({String? preferPersonId}) {
    final running = _inFlight;
    if (running != null && preferPersonId == null) return running;
    final future = _load(preferPersonId).whenComplete(() => _inFlight = null);
    _inFlight = future;
    return future;
  }

  @override
  Future<void> selectContext(AccountContext context) async {
    final userId = _tokens.userId;
    await _sessionContext.select(context.toSessionContext());
    if (userId != null) {
      await _store.saveSelectedContextKey(userId, context.key);
    }
    _emit(
      _state.copyWith(
        status: AccessStatus.ready,
        active: context,
        failure: null,
      ),
    );
  }

  Future<void> _onAuthChanged(AuthStatus status) async {
    switch (status) {
      case AuthStatus.authenticated:
        if (_state.status == AccessStatus.signedOut) {
          _emit(const AccessState(status: AccessStatus.resolving));
        }
        await refresh();
      case AuthStatus.unauthenticated:
        await _sessionContext.clear();
        _emit(const AccessState());
      case AuthStatus.unknown:
        break;
    }
  }

  Future<void> _load(String? preferPersonId) async {
    final userId = _tokens.userId;
    if (userId == null) {
      _emit(const AccessState());
      return;
    }
    final settled =
        _state.status == AccessStatus.ready ||
        _state.status == AccessStatus.needsContext;
    if (!settled) {
      _emit(_state.copyWith(status: AccessStatus.resolving, failure: null));
    }
    try {
      final account = await _accounts.fetch();
      await _store.saveAccount(userId, account);
      await _recordVerified();
      await _apply(userId, account, preferPersonId: preferPersonId);
    } on ApiException catch (error) {
      final cached = await _store.readAccount(userId);
      if (cached != null && error.isRetryable) {
        if (await _offlineWindowExpired(userId)) {
          await _sessionContext.clear();
          _emit(const AccessState(status: AccessStatus.needsOnlineSignIn));
          return;
        }
        await _apply(
          userId,
          cached,
          preferPersonId: preferPersonId,
          fromCache: true,
        );
        return;
      }
      if (settled && error.isRetryable) return;
      AppLog.warning('auth', 'Account could not be loaded', error);
      _emit(_state.copyWith(status: AccessStatus.failed, failure: error));
    }
  }

  Future<void> _recordVerified() async {
    final userId = _tokens.userId;
    if (userId == null) return;
    await _verification.saveLastVerifiedAt(userId, _clock.nowUtc());
  }

  Future<bool> _offlineWindowExpired(String userId) async {
    final now = _clock.nowUtc();
    final lastVerifiedAt = await _verification.readLastVerifiedAt(userId);
    if (lastVerifiedAt == null) {
      // Installed before the window existed: start counting now.
      await _verification.saveLastVerifiedAt(userId, now);
    }
    return OfflineWindow.hasExpired(lastVerifiedAt: lastVerifiedAt, now: now);
  }

  Future<void> _apply(
    String userId,
    Account account, {
    String? preferPersonId,
    bool fromCache = false,
  }) async {
    final contexts = account.contexts;
    if (contexts.isEmpty) {
      await _sessionContext.clear();
      _emit(
        AccessState(
          people: account.people,
          status: account.isUnknown
              ? AccessStatus.unknownAccount
              : account.isDeactivated
              ? AccessStatus.deactivated
              : AccessStatus.noRole,
          fromCache: fromCache,
        ),
      );
      return;
    }

    final chosen = await _chooseContext(userId, contexts, preferPersonId);
    if (chosen == null) {
      await _sessionContext.clear();
      _emit(
        AccessState(
          status: AccessStatus.needsContext,
          contexts: contexts,
          people: account.people,
          fromCache: fromCache,
        ),
      );
      return;
    }
    await _sessionContext.select(chosen.toSessionContext());
    await _store.saveSelectedContextKey(userId, chosen.key);
    _emit(
      AccessState(
        status: AccessStatus.ready,
        contexts: contexts,
        people: account.people,
        active: chosen,
        fromCache: fromCache,
      ),
    );
  }

  Future<AccountContext?> _chooseContext(
    String userId,
    List<AccountContext> contexts,
    String? preferPersonId,
  ) async {
    if (preferPersonId != null) {
      for (final context in contexts) {
        if (context.personId == preferPersonId) return context;
      }
    }
    final remembered = await _store.readSelectedContextKey(userId);
    final keep = _state.active?.key ?? remembered;
    for (final context in contexts) {
      if (context.key == keep) return context;
    }
    return contexts.length == 1 ? contexts.first : null;
  }

  void _emit(AccessState next) {
    if (next == _state) return;
    _state = next;
    _changes.add(next);
  }
}
