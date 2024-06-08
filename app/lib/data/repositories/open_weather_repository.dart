import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/core/core.dart';

import '../../domain/domain.dart';
import '../data.dart';

class OpenWeatherRepository implements IOpenWeatherRepository {
  final IOpenWeatherDataSource _dataSource;

  OpenWeatherRepository(this._dataSource);

  @override
  Future<Either<Failure, Unit>> fetchData({
    required num lat,
    required num long,
  }) async {
    try {
      // final data = await _dataSource.fetchData(
      //   lat: lat,
      //   long: long,
      // );

      return Right(unit);
    } catch (e) {
      return Left(Failure(type: ExceptionType.serverError));
    }
  }
}
