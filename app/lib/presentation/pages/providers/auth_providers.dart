import 'package:external_dependencies/external_dependencies.dart';
import 'package:my_current_weather/core/infra/geo_location_service_adapter/geo_location_service_adapter.dart';
import 'package:my_current_weather/domain/domain.dart';

final openWeatherRepository = Provider.autoDispose<IOpenWeatherRepository>((_) {
  throw UnimplementedError('openWeatherRepository must be overridden');
});
final geoLocatorServiceAdapter =
    Provider.autoDispose<IGeoLocationServiceAdapter>((_) {
  throw UnimplementedError('geoLocatorServiceAdapter must be overridden');
});
