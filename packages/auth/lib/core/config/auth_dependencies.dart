import 'package:auth/core/initialize.dart';
import 'package:auth/domain/domain.dart';

import '../../data/data.dart';
import '../core.dart';

abstract class IAuthDependencies {
  //datasources
  abstract final ILocalStorageDatasource localStorageDatasource;

  //repositories
  abstract final ILocalStorageRepository localStorageRepository;

  //infa
  abstract final ILocalStorageAdapter localStorageAdapter;
}

class AuthDependencies implements IAuthDependencies {
  //datasources
  @override
  final ILocalStorageDatasource localStorageDatasource;

  //repositories
  @override
  final ILocalStorageRepository localStorageRepository;

  //infa
  @override
  final ILocalStorageAdapter localStorageAdapter;

  @override
  AuthDependencies({
    required this.localStorageAdapter,
    required this.localStorageRepository,
    required this.localStorageDatasource,
  });

  static Future<IAuthDependencies> load() async {
    await Core.initialize();

    final localStorageAdapter = LocalStorageAdapter();
    final localStorageDatasource =
        LocalStorageDatasource(localStorageAdapter: localStorageAdapter);

    return AuthDependencies(
      localStorageAdapter: localStorageAdapter,
      localStorageDatasource: localStorageDatasource,
      localStorageRepository: LocalStorageRepository(
        datasource: localStorageDatasource,
      ),
    );
  }
}
