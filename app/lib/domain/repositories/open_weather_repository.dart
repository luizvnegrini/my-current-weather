import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

import '../domain.dart';

abstract class IOpenWeatherRepository {
  Future<Either<Failure, CurrentWeather>> currentWeather({
    required num lat,
    required num long,
    required String date,
  });
}
