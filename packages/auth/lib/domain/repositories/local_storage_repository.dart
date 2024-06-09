import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

abstract class ILocalStorageRepository {
  abstract bool isAuthenticated;

  Future<Either<Failure, Unit>> authenticate({
    required String username,
    required String password,
  });

  void clear();
}
