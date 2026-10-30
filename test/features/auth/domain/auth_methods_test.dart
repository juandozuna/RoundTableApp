import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_methods.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';

void main() {
  test('email only is the default', () {
    final methods = EnabledAuthMethods.parse('email');
    expect(methods.email, isTrue);
    expect(methods.providers, isEmpty);
  });

  test('parses a comma list ignoring case, spaces and unknown names', () {
    final methods = EnabledAuthMethods.parse(' Email, facebook ,google,sms');
    expect(methods.email, isTrue);
    expect(methods.providers, [AuthProvider.google, AuthProvider.facebook]);
  });

  test('social only turns email off', () {
    final methods = EnabledAuthMethods.parse('google,apple');
    expect(methods.email, isFalse);
    expect(methods.hasProviders, isTrue);
  });

  test('an empty or unusable list falls back to email only', () {
    for (final raw in ['', ' , ', 'sms,phone']) {
      final methods = EnabledAuthMethods.parse(raw);
      expect(methods.email, isTrue, reason: raw);
      expect(methods.providers, isEmpty, reason: raw);
    }
  });
}
