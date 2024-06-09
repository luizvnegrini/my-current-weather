import 'package:external_dependencies/external_dependencies.dart';
import 'package:my_current_weather/core/core.dart';
import 'package:shared/core/core.dart';

import '../../domain/domain.dart';
import '../data.dart';

class OpenWeatherRepository implements IOpenWeatherRepository {
  static const String api = '/data/2.5';
  final IHttpClient _client;

  OpenWeatherRepository(this._client);

  @override
  Future<Either<Failure, CurrentWeather>> currentWeather({
    required num lat,
    required num long,
    required String date,
  }) async {
    try {
      final data = await _client.get(
        '$api/weather',
        options: HttpOptions(
          queryParameters: {
            'lat': lat,
            'lon': long,
          },
        ),
      );

      return data.fold(
        (failure) => left(Failure(type: ExceptionType.serverError)),
        (response) => right(CurrentWeatherMapper.fromJson(response.body)),
      );
    } catch (e) {
      return Left(Failure(type: ExceptionType.serverError));
    }
  }
}
