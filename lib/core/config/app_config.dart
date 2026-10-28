import 'app_environment.dart';

/// Runtime configuration. Values reach the app only through `--dart-define`
/// (see docs/implementation/PLAN.md); nothing secret is compiled in.
class AppConfig {
  const AppConfig({
    required this.supabaseUrl,
    required this.supabaseAnonKey,
    required this.powerSyncUrl,
    required this.devAuthEnabled,
    required this.environment,
    this.firebase = const FirebaseWebConfig(),
    this.errorReportUrl = '',
  });

  factory AppConfig.fromEnvironment() => AppConfig(
    supabaseUrl: _supabaseUrl,
    supabaseAnonKey: _supabaseAnonKey,
    powerSyncUrl: _powerSyncUrl,
    devAuthEnabled: devAuthCompiledIn,
    environment: AppEnvironment.parse(_appEnv),
    errorReportUrl: _errorReportUrl,
    firebase: const FirebaseWebConfig(
      apiKey: String.fromEnvironment('FIREBASE_API_KEY'),
      appId: String.fromEnvironment('FIREBASE_APP_ID'),
      messagingSenderId: String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
      projectId: String.fromEnvironment('FIREBASE_PROJECT_ID'),
      vapidKey: String.fromEnvironment('FIREBASE_VAPID_KEY'),
    ),
  );

  static const _supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const _supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const _powerSyncUrl = String.fromEnvironment('POWERSYNC_URL');
  static const _errorReportUrl = String.fromEnvironment('ERROR_REPORT_URL');
  static const _appEnv = String.fromEnvironment(
    'APP_ENV',
    defaultValue: 'local',
  );

  /// Compile-time constant so code guarded by it is tree-shaken from builds
  /// without `--dart-define=DEV_AUTH=true`.
  static const bool devAuthCompiledIn = bool.fromEnvironment('DEV_AUTH');

  final String supabaseUrl;
  final String supabaseAnonKey;
  final String powerSyncUrl;
  final bool devAuthEnabled;
  final AppEnvironment environment;
  final FirebaseWebConfig firebase;

  /// Optional HTTP endpoint receiving error reports; empty disables it.
  final String errorReportUrl;

  bool get hasSupabase => supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;

  bool get hasErrorReporting =>
      Uri.tryParse(errorReportUrl)?.hasScheme ?? false;

  bool get hasPowerSync => powerSyncUrl.isNotEmpty;

  bool get isProduction => environment == AppEnvironment.production;

  /// Base URL for Supabase Edge Functions (`/functions/v1`).
  String get edgeFunctionsBaseUrl => '$supabaseUrl/functions/v1';

  /// Base URL for PostgREST (`/rest/v1`).
  String get postgrestBaseUrl => '$supabaseUrl/rest/v1';
}

/// Firebase options for web. Android and iOS read `google-services.json` /
/// `GoogleService-Info.plist` instead. All empty means push is disabled.
class FirebaseWebConfig {
  const FirebaseWebConfig({
    this.apiKey = '',
    this.appId = '',
    this.messagingSenderId = '',
    this.projectId = '',
    this.vapidKey = '',
  });

  final String apiKey;
  final String appId;
  final String messagingSenderId;
  final String projectId;
  final String vapidKey;

  bool get isComplete =>
      apiKey.isNotEmpty &&
      appId.isNotEmpty &&
      messagingSenderId.isNotEmpty &&
      projectId.isNotEmpty;
}
