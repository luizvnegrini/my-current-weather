import 'package:my_current_weather/core/core.dart';
import 'package:my_current_weather/core/infra/client_adapter/interceptors/api_key_interceptor.dart';
import 'package:my_current_weather/domain/domain.dart';

import '../../data/data.dart';

abstract class IAppDependencies {
  //repositories
  abstract final IOpenWeatherRepository openWeatherRepository;

  //adapters
  abstract final IGeoLocationServiceAdapter geoLocationService;
}

class AppDependencies implements IAppDependencies {
  //repositories
  @override
  final IOpenWeatherRepository openWeatherRepository;

  //adapters
  @override
  final IGeoLocationServiceAdapter geoLocationService;

  AppDependencies({
    required this.openWeatherRepository,
    required this.geoLocationService,
  });

  static Future<IAppDependencies> load() async {
    final client = DioAdapter(
      baseUrl: Envs.openWeatherMapBaseUrl,
      interceptors: _getInterceptors(),
    );

    return AppDependencies(
      geoLocationService: GeoLocationServiceImpl(),
      openWeatherRepository: OpenWeatherRepository(client),
    );
  }

  static List<HttpInterceptor> _getInterceptors() {
    return [APIKeyInterceptor()];
  }
}
