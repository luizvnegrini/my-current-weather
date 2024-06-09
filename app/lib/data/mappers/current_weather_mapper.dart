import 'package:my_current_weather/domain/domain.dart';

class CurrentWeatherMapper {
  static CurrentWeather fromJson(Map<String, dynamic> json) => CurrentWeather(
        coord: _coordFromJson(json['coord']),
        weather: (json['weather'] as List)
            .map((weather) => _weatherFromJson(weather))
            .toList(),
        base: json['base'],
        main: _mainFromJson(json['main']),
        visibility: json['visibility'],
        wind: _windFromJson(json['wind']),
        rain: json['rain'] != null ? _rainFromJson(json['rain']) : null,
        clouds: _cloudsFromJson(json['clouds']),
        dt: json['dt'],
        sys: _sysFromJson(json['sys']),
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod'],
      );

  static Coord _coordFromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'],
        lat: json['lat'],
      );

  static Weather _weatherFromJson(Map<String, dynamic> json) => Weather(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );

  static Main _mainFromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'],
        feelsLike: json['feels_like'],
        tempMin: json['temp_min'],
        tempMax: json['temp_max'],
        pressure: json['pressure'],
        humidity: json['humidity'],
        seaLevel: json['sea_level'],
        grndLevel: json['grnd_level'],
      );

  static Wind _windFromJson(Map<String, dynamic> json) => Wind(
        speed: json['speed'],
        deg: json['deg'],
        gust: json['gust'],
      );

  static Rain _rainFromJson(Map<String, dynamic> json) => Rain(
        d1h: json['1h'],
      );

  static Clouds _cloudsFromJson(Map<String, dynamic> json) => Clouds(
        all: json['all'],
      );

  static Sys _sysFromJson(Map<String, dynamic> json) => Sys(
        type: json['type'],
        id: json['id'],
        country: json['country'],
        sunrise: json['sunrise'],
        sunset: json['sunset'],
      );
}
