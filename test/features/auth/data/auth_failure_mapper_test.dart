import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/auth/data/services/auth_failure_mapper.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

void main() {
  AuthFailureKind kindOf(Object error) => AuthFailureMapper.from(error).kind;

  test('maps Supabase error codes to domain failures', () {
    const cases = {
      'invalid_credentials': AuthFailureKind.invalidCredentials,
      'user_already_exists': AuthFailureKind.emailAlreadyRegistered,
      'email_exists': AuthFailureKind.emailAlreadyRegistered,
      'weak_password': AuthFailureKind.weakPassword,
      'same_password': AuthFailureKind.weakPassword,
      'over_email_send_rate_limit': AuthFailureKind.rateLimited,
      'over_request_rate_limit': AuthFailureKind.rateLimited,
      'email_not_confirmed': AuthFailureKind.emailNotConfirmed,
      'otp_expired': AuthFailureKind.linkExpired,
      'session_not_found': AuthFailureKind.linkExpired,
    };
    cases.forEach((code, kind) {
      expect(
        kindOf(supabase.AuthException('x', statusCode: '400', code: code)),
        kind,
        reason: code,
      );
    });
  });

  test('falls back on the message when the server sends no code', () {
    expect(
      kindOf(const supabase.AuthException('Invalid login credentials')),
      AuthFailureKind.invalidCredentials,
    );
    expect(
      kindOf(const supabase.AuthException('access_denied')),
      AuthFailureKind.cancelled,
    );
    expect(
      kindOf(const supabase.AuthException('Something odd')),
      AuthFailureKind.unknown,
    );
  });

  test('network problems read as offline', () {
    expect(
      kindOf(supabase.AuthRetryableFetchException(message: 'boom')),
      AuthFailureKind.offline,
    );
    expect(kindOf(Exception('Failed to fetch')), AuthFailureKind.offline);
  });

  test('a missing session reads as an expired link', () {
    expect(
      kindOf(supabase.AuthSessionMissingException()),
      AuthFailureKind.linkExpired,
    );
  });

  test('an AuthFailure passes through unchanged', () {
    const failure = AuthFailure(AuthFailureKind.rateLimited);
    expect(identical(AuthFailureMapper.from(failure), failure), isTrue);
  });

  test('the raw exception text is kept for logs only', () {
    final failure = AuthFailureMapper.from(
      const supabase.AuthException('x', code: 'weak_password'),
    );
    expect(failure.message, contains('weak_password'));
  });
}
