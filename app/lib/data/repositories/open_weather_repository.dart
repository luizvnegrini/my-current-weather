import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

import '../../domain/domain.dart';
import '../data.dart';

class OpenWeatherRepository implements IOpenWeatherRepository {
  final IOpenWeatherDataSource _dataSource;

  OpenWeatherRepository(this._dataSource);

  @override
  Future<Either<Failure, Unit>> fetchData() async {
    try {
      final response = await _dataSource.fetchData();
      throw UnimplementedError();
      // return Right(response.toEntity());
    } catch (e) {
      return Left(Failure(type: ExceptionType.serverError));
    }
  }
}
