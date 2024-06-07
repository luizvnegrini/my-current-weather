class Environments {
  static String get openWeatherBaseUrl => const String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.openweathermap.org/',
  );
}
