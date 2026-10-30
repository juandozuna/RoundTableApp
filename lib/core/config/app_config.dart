import 'package:flutter/foundation.dart';

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
    this.firebase = const FirebaseConfig(),
    this.errorReportUrl = '',
  });

  factory AppConfig.fromEnvironment() => AppConfig(
    supabaseUrl: _supabaseUrl,
    supabaseAnonKey: _supabaseAnonKey,
    powerSyncUrl: _powerSyncUrl,
    devAuthEnabled: devAuthCompiledIn,
    environment: AppEnvironment.parse(_appEnv),
    errorReportUrl: _errorReportUrl,
    firebase: const FirebaseConfig(
      apiKey: String.fromEnvironment('FIREBASE_API_KEY'),
      appId: String.fromEnvironment('FIREBASE_APP_ID'),
      webAppId: String.fromEnvironment('FIREBASE_WEB_APP_ID'),
      androidAppId: String.fromEnvironment('FIREBASE_ANDROID_APP_ID'),
      iosAppId: String.fromEnvironment('FIREBASE_IOS_APP_ID'),
      iosBundleId: String.fromEnvironment('FIREBASE_IOS_BUNDLE_ID'),
      messagingSenderId: String.fromEnvironment('FIREBASE_MESSAGING_SENDER_ID'),
      projectId: String.fromEnvironment('FIREBASE_PROJECT_ID'),
      storageBucket: String.fromEnvironment('FIREBASE_STORAGE_BUCKET'),
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
  final FirebaseConfig firebase;

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

/// Firebase options built from `--dart-define`s, so no `google-services.json`
/// or `GoogleService-Info.plist` is needed (docs/implementation/mobile.md).
/// Every platform has its own app id; the rest identifies the project and is
/// shared. A platform whose options are incomplete runs without push.
class FirebaseConfig {
  const FirebaseConfig({
    this.apiKey = '',
    this.appId = '',
    this.webAppId = '',
    this.androidAppId = '',
    this.iosAppId = '',
    this.iosBundleId = '',
    this.messagingSenderId = '',
    this.projectId = '',
    this.storageBucket = '',
    this.vapidKey = '',
  });

  final String apiKey;

  /// Legacy single app id (`FIREBASE_APP_ID`); used for web when
  /// [webAppId] is empty.
  final String appId;
  final String webAppId;
  final String androidAppId;
  final String iosAppId;
  final String iosBundleId;
  final String messagingSenderId;
  final String projectId;
  final String storageBucket;
  final String vapidKey;

  /// The app id registered in Firebase for the running platform.
  String appIdFor({required bool isWeb, required TargetPlatform platform}) {
    if (isWeb) return webAppId.isNotEmpty ? webAppId : appId;
    return switch (platform) {
      TargetPlatform.android => androidAppId,
      TargetPlatform.iOS => iosAppId,
      _ => '',
    };
  }

  bool isCompleteFor({required bool isWeb, required TargetPlatform platform}) =>
      apiKey.isNotEmpty &&
      messagingSenderId.isNotEmpty &&
      projectId.isNotEmpty &&
      appIdFor(isWeb: isWeb, platform: platform).isNotEmpty;
}
