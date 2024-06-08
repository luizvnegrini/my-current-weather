import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

abstract class IOpenWeatherRepository {
  Future<Either<Failure, Unit>> fetchData({
    required num lat,
    required num long,
  });
}
