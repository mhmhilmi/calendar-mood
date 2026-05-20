class AppConfig {
  const AppConfig({
    required this.apiBaseUrl,
    required this.syncEnabled,
  });

  static const current = AppConfig(
    apiBaseUrl: String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'http://localhost:8000/api/v1',
    ),
    syncEnabled: bool.fromEnvironment(
      'SYNC_ENABLED',
      defaultValue: true,
    ),
  );

  final String apiBaseUrl;
  final bool syncEnabled;
}

