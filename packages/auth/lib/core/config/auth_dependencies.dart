import 'package:auth/core/initialize.dart';
import 'package:auth/domain/domain.dart';

import '../../data/data.dart';
import '../core.dart';

abstract class IAuthDependencies {
  //repositories
  abstract final ILocalStorageRepository localStorageRepository;

  //infa
  abstract final ILocalStorageAdapter localStorageAdapter;
}

class AuthDependencies implements IAuthDependencies {
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
  });

  static Future<IAuthDependencies> load() async {
    await Core.initialize();

    final localStorageAdapter = LocalStorageAdapter();

    return AuthDependencies(
      localStorageAdapter: localStorageAdapter,
      localStorageRepository: LocalStorageRepository(
        localStorageAdapter: localStorageAdapter,
      ),
    );
  }
}
