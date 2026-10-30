import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';
import 'package:gold_roundtables/features/auth/domain/models/access_state.dart';
import 'package:gold_roundtables/features/auth/domain/models/account_context.dart';
import 'package:gold_roundtables/features/auth/domain/services/access_session_service.dart';
import 'package:gold_roundtables/features/auth/presentation/routing/access_redirect_guard.dart';

import '../helpers/fakes.dart';

class FakeAccess implements AccessSessionService {
  FakeAccess(this.state);

  @override
  AccessState state;

  @override
  Stream<AccessState> watch() => const Stream.empty();

  @override
  Future<void> refresh({String? preferPersonId}) async {}

  @override
  Future<void> selectContext(AccountContext context) async {}
}

void main() {
  const home = '/';

  String? redirect(
    AccessStatus status,
    String location, {
    AuthStatus auth = AuthStatus.authenticated,
    bool recovering = false,
  }) {
    final guard = AccessRedirectGuard(
      FakeAuthState(status: auth),
      FakeAccess(AccessState(status: status)),
      FakeEmailAuth()..recoveryPending = recovering,
    );
    return guard.redirect(Uri.parse(location), homeLocation: home);
  }

  test('signed-out users are left to the core guard', () {
    expect(
      redirect(
        AccessStatus.signedOut,
        '/mesas',
        auth: AuthStatus.unauthenticated,
      ),
      isNull,
    );
  });

  test('a session whose account has not loaded yet waits on /acceso', () {
    expect(redirect(AccessStatus.signedOut, '/mesas'), '/acceso?from=%2Fmesas');
    expect(redirect(AccessStatus.resolving, '/'), '/acceso');
    expect(redirect(AccessStatus.failed, '/mesas'), '/acceso?from=%2Fmesas');
  });

  test('several contexts without a choice go to the picker', () {
    expect(
      redirect(AccessStatus.needsContext, '/mesas'),
      '/contexto?from=%2Fmesas',
    );
    expect(redirect(AccessStatus.needsContext, '/contexto'), isNull);
  });

  test('blocked identities are held on /acceso', () {
    for (final status in [
      AccessStatus.noRole,
      AccessStatus.deactivated,
      AccessStatus.unknownAccount,
      AccessStatus.needsOnlineSignIn,
    ]) {
      expect(redirect(status, '/'), '/acceso');
      expect(redirect(status, '/acceso'), isNull);
    }
  });

  test('ready users leave the gate pages for where they were going', () {
    expect(redirect(AccessStatus.ready, '/acceso?from=%2Fmesas'), '/mesas');
    expect(redirect(AccessStatus.ready, '/contexto'), home);
    expect(redirect(AccessStatus.ready, '/mesas'), isNull);
  });

  test('never returns to an external or gate location', () {
    expect(
      redirect(AccessStatus.ready, '/acceso?from=https%3A%2F%2Fevil.example'),
      home,
    );
    expect(redirect(AccessStatus.ready, '/acceso?from=%2F%2Fevil'), home);
    expect(redirect(AccessStatus.ready, '/acceso?from=%2Fcontexto'), home);
  });

  test('the invitation flow is never interrupted', () {
    for (final status in AccessStatus.values) {
      expect(redirect(status, '/invitacion/ABC234'), isNull);
      expect(redirect(status, '/invitacion'), isNull);
    }
  });

  test('keeps the wanted location while moving between gate pages', () {
    expect(
      redirect(AccessStatus.needsContext, '/acceso?from=%2Fmesas'),
      '/contexto?from=%2Fmesas',
    );
  });

  test('a recovery link sends the signed-in person to the new password page', () {
    expect(
      redirect(AccessStatus.ready, '/mesas', recovering: true),
      '/nueva-contrasena',
    );
    expect(
      redirect(AccessStatus.resolving, '/', recovering: true),
      '/nueva-contrasena',
    );
    expect(
      redirect(AccessStatus.ready, '/nueva-contrasena', recovering: true),
      isNull,
    );
  });

  test('the new password page is never bounced to the access gate', () {
    expect(redirect(AccessStatus.resolving, '/nueva-contrasena'), isNull);
    expect(redirect(AccessStatus.unknownAccount, '/nueva-contrasena'), isNull);
  });
}
