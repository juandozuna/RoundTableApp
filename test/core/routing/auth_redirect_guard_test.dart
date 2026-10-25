import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/routing/auth_redirect_guard.dart';
import 'package:gold_roundtables/core/routing/feature_router.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_state_source.dart';
import 'package:gold_roundtables/core/services/auth_session/auth_status.dart';

class FakeAuth implements AuthStateSource {
  FakeAuth(this.status);

  @override
  AuthStatus status;

  @override
  Stream<AuthStatus> get statusChanges => const Stream.empty();
}

void main() {
  AuthRedirectGuard guard(AuthStatus status, {String? signIn = '/ingresar'}) =>
      AuthRedirectGuard(
        auth: FakeAuth(status),
        signInLocation: signIn,
        homeLocation: '/',
        publicLocations: const ['/invitacion', '/dev/galeria'],
      );

  String? redirect(AuthRedirectGuard g, String location) =>
      g.redirect(Uri.parse(location));

  group('signed out', () {
    final g = guard(AuthStatus.unauthenticated);

    test('private location goes to sign-in and remembers it', () {
      expect(
        redirect(g, '/mesas/42?tab=1'),
        '/ingresar?from=%2Fmesas%2F42%3Ftab%3D1',
      );
      expect(redirect(g, '/'), '/ingresar?from=%2F');
    });

    test('public locations and their sub-paths stay', () {
      expect(redirect(g, '/invitacion'), isNull);
      expect(redirect(g, '/invitacion/ABC123'), isNull);
      expect(redirect(g, '/ingresar'), isNull);
    });

    test('prefix match respects path boundaries', () {
      expect(redirect(g, '/invitaciones-admin'), startsWith('/ingresar'));
    });
  });

  group('signed in', () {
    final g = guard(AuthStatus.authenticated);

    test('private locations stay', () {
      expect(redirect(g, '/mesas/42'), isNull);
    });

    test('sign-in returns to the remembered location', () {
      expect(redirect(g, '/ingresar?from=%2Fmesas%2F42'), '/mesas/42');
    });

    test('sign-in without from, or with an external from, goes home', () {
      expect(redirect(g, '/ingresar'), '/');
      expect(redirect(g, '/ingresar?from=https%3A%2F%2Fevil.example'), '/');
      expect(redirect(g, '/ingresar?from=%2F%2Fevil.example'), '/');
      expect(redirect(g, '/ingresar?from=%2Fingresar'), '/');
    });
  });

  test('unknown auth state never redirects', () {
    expect(redirect(guard(AuthStatus.unknown), '/mesas'), isNull);
  });

  test('no sign-in feature registered → guard is inactive', () {
    expect(
      redirect(guard(AuthStatus.unauthenticated, signIn: null), '/mesas'),
      isNull,
    );
  });

  group('FeatureRouterRegistry', () {
    test('rejects two sign-in locations', () {
      const registry = FeatureRouterRegistry(
        routers: [_SignIn('/a'), _SignIn('/b')],
        homeLocation: '/',
      );
      expect(() => registry.signInLocation, throwsStateError);
    });

    test('sorts destinations by order', () {
      final registry = FeatureRouterRegistry(
        routers: [_Dest('/b', 20), _Dest('/a', 10)],
        homeLocation: '/',
      );
      expect(registry.destinations.map((d) => d.location), ['/a', '/b']);
    });
  });
}

class _SignIn extends FeatureRouter {
  const _SignIn(this.location);

  final String location;

  @override
  String? get signInLocation => location;
}

class _Dest extends FeatureRouter {
  _Dest(this.location, this.order);

  final String location;
  final int order;

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: location,
      icon: Icons.circle,
      selectedIcon: Icons.circle,
      label: (l10n) => location,
      order: order,
    ),
  ];
}
