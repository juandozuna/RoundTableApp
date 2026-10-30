import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../domain/models/auth_failure.dart';

/// Turns auth SDK errors into [AuthFailure]s so no raw exception reaches a
/// widget. Supabase error codes:
/// https://supabase.com/docs/guides/auth/debugging/error-codes
abstract final class AuthFailureMapper {
  static AuthFailure from(Object error) {
    if (error is AuthFailure) return error;
    final kind = _kindOf(error);
    return AuthFailure(kind, message: '$error');
  }

  static AuthFailureKind _kindOf(Object error) {
    if (error is supabase.AuthException) {
      final byCode = _byCode[error.code];
      if (byCode != null) return byCode;
      if (error is supabase.AuthRetryableFetchException) {
        return AuthFailureKind.offline;
      }
      if (error is supabase.AuthSessionMissingException) {
        return AuthFailureKind.linkExpired;
      }
    }
    final text = error is supabase.AuthException
        ? '${error.message} ${error.code ?? ''}'.toLowerCase()
        : error.toString().toLowerCase();
    if (text.contains('invalid login credentials')) {
      return AuthFailureKind.invalidCredentials;
    }
    if (text.contains('access_denied') ||
        text.contains('cancel') ||
        text.contains('denied')) {
      return AuthFailureKind.cancelled;
    }
    if (text.contains('socket') ||
        text.contains('network') ||
        text.contains('failed to fetch') ||
        text.contains('failed host lookup')) {
      return AuthFailureKind.offline;
    }
    return AuthFailureKind.unknown;
  }

  static const Map<String, AuthFailureKind> _byCode = {
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
    'bad_jwt': AuthFailureKind.linkExpired,
    'access_denied': AuthFailureKind.cancelled,
  };
}
