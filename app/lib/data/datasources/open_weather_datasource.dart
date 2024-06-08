import '../../core/core.dart';

abstract class IOpenWeatherDataSource {
  Future<Object> fetchData({
    required num lat,
    required num long,
  });
}

class OpenWeatherDataSource implements IOpenWeatherDataSource {
  final IHttpClient client;

  OpenWeatherDataSource({
    required this.client,
  });

  @override
  Future<Object> fetchData({
    required num lat,
    required num long,
  }) async {
    return await client.get(
      '',
      options: HttpOptions(
        queryParameters: {
          'lat': lat,
          'long': long,
        },
      ),
    );
  }
}
