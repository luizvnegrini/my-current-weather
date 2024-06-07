import 'package:external_dependencies/external_dependencies.dart';

import '../../core/core.dart';

abstract class IOpenWeatherDataSource {
  Future<Unit> fetchData();
}

class OpenWeatherDataSource implements IOpenWeatherDataSource {
  final IRemoteDataSourceAdapter dataSource;

  OpenWeatherDataSource(this.dataSource);

  @override
  Future<Unit> fetchData() async {
    throw UnimplementedError();
  }
}
