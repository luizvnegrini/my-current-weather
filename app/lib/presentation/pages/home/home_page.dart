import 'package:design_system/design_system.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:my_current_weather/core/core.dart';

import '../../../domain/domain.dart';
import 'home_page_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  SizedBox get defaultSpacer => const SizedBox(height: 16);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = readHomeViewModel(ref);

    return HookConsumer(
      builder: (_, ref, __) {
        Widget? loadingWidget;
        final state = useHomeState(ref);
        final currentWeather = state.currentWeather;

        if (state.isLoading) {
          loadingWidget = const Center(child: CircularProgressIndicator());
        }

        if (state.currentWeather == null) {
          return ErrorWidget(onTryAgain: vm.getWeatherData);
        }

        return ScaffoldWidget(
          appBar: AppBar(
            title: Text('Weather in ${currentWeather!.name}'),
          ),
          body: RefreshIndicator(
            onRefresh: vm.getWeatherData,
            child: loadingWidget ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    WeatherMainInfo(currentWeather: currentWeather),
                    const Spacer(),
                    WeatherDetails(currentWeather: currentWeather),
                    defaultSpacer,
                    WeatherWind(currentWeather: currentWeather),
                    defaultSpacer,
                    WeatherOtherInfo(currentWeather: currentWeather),
                    const Spacer(),
                    const Spacer(),
                  ],
                ),
          ),
        );
      },
    );
  }
}

class WeatherMainInfo extends StatelessWidget {
  final CurrentWeather currentWeather;

  const WeatherMainInfo({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    var weather = currentWeather.weather[0];
    var iconUrl = "http://openweathermap.org/img/w/${weather.icon}.png";

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(iconUrl),
            const SizedBox(width: 10),
            Text(
              '${currentWeather.main.temp}°C',
              style: const TextStyle(fontSize: 48),
            ),
          ],
        ),
        Text(
          weather.description,
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class WeatherDetails extends StatelessWidget {
  final CurrentWeather currentWeather;

  const WeatherDetails({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Feels like: ${currentWeather.main.feelsLike}°C'),
        Text(
            'Min: ${currentWeather.main.tempMin}°C, Max: ${currentWeather.main.tempMax}°C'),
        Text('Pressure: ${currentWeather.main.pressure} hPa'),
        Text('Humidity: ${currentWeather.main.humidity}%'),
      ],
    );
  }
}

class WeatherWind extends StatelessWidget {
  final CurrentWeather currentWeather;

  const WeatherWind({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Wind speed: ${currentWeather.wind.speed} m/s'),
        Text('Wind direction: ${currentWeather.wind.deg}°'),
        Text('Wind gust: ${currentWeather.wind.gust} m/s'),
      ],
    );
  }
}

class WeatherOtherInfo extends StatelessWidget {
  final CurrentWeather currentWeather;

  const WeatherOtherInfo({super.key, required this.currentWeather});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Visibility: ${currentWeather.visibility} meters'),
        Text('Cloudiness: ${currentWeather.clouds.all}%'),
        if (currentWeather.rain != null)
          Text('Rain (last hour): ${currentWeather.rain!.d1h} mm'),
        Text(
            'Sunrise: ${DateTime.fromMillisecondsSinceEpoch(currentWeather.sys.sunrise * 1000).time}'),
        Text(
            'Sunset: ${DateTime.fromMillisecondsSinceEpoch(currentWeather.sys.sunset * 1000).time}'),
      ],
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final VoidCallback onTryAgain;

  const ErrorWidget({super.key, required this.onTryAgain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onTryAgain,
        child: const Text('Try again'),
      ),
    );
  }
}
