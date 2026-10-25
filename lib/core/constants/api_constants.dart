/// Identifiers shared between the HTTP layer and the Supabase backend.
abstract final class ApiHeaders {
  static const String apiKey = 'apikey';
  static const String authorization = 'Authorization';
  static const String bearerPrefix = 'Bearer ';
}

/// Keys stored in `RequestOptions.extra`.
abstract final class ApiRequestExtras {
  /// Marks a request that was already retried after a token refresh.
  static const String retriedAfterRefresh = 'retriedAfterRefresh';
}

/// Keys of the Edge Function error envelope `{ "error": { "code", "message" } }`.
abstract final class ApiErrorEnvelope {
  static const String error = 'error';
  static const String code = 'code';
  static const String message = 'message';

  /// PostgREST returns `{ code, message, details, hint }` at the top level.
  static const String details = 'details';
}

/// Names of the Dio instances registered in DI.
abstract final class DioNames {
  /// Base URL `<SUPABASE_URL>/functions/v1`.
  static const String edgeFunctions = 'edgeFunctionsDio';

  /// Base URL `<SUPABASE_URL>/rest/v1`.
  static const String postgrest = 'postgrestDio';
}
