import 'package:auth/domain/domain.dart';

import '../../data/data.dart';
import '../core.dart';

abstract class IAuthDependencies {
  IAuthDependencies({
    required this.localStorageAdapter,
    required this.localStorageDatasource,
    required this.localStorageRepository,
  });

  //datasources
  final ILocalStorageDatasource localStorageDatasource;

  //repositories
  final ILocalStorageRepository localStorageRepository;

  //usecases

  //infa
  final ILocalStorageAdapter localStorageAdapter;
}

class AuthDependencies implements IAuthDependencies {
  //datasources
  @override
  final ILocalStorageDatasource localStorageDatasource;

  //repositories
  @override
  final ILocalStorageRepository localStorageRepository;

  //usecases

  //infa
  @override
  final ILocalStorageAdapter localStorageAdapter;

  @override
  AuthDependencies({
    required this.localStorageAdapter,
    required this.localStorageRepository,
    required this.localStorageDatasource,
  });

  static IAuthDependencies load() {
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
