/// Deployment environment selected with `--dart-define=APP_ENV=...`.
enum AppEnvironment {
  local('local'),
  staging('staging'),
  production('production');

  const AppEnvironment(this.wireValue);

  final String wireValue;

  static AppEnvironment parse(String raw) => AppEnvironment.values.firstWhere(
    (environment) => environment.wireValue == raw.trim().toLowerCase(),
    orElse: () => AppEnvironment.local,
  );
}
