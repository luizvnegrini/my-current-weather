class Envs {
  static get openWeatherMapBaseUrl =>
      const String.fromEnvironment('OPENWEATHERMAP_BASE_URL');
  static get openWeatherMapKey =>
      const String.fromEnvironment('OPENWEATHERMAP_KEY');
}
