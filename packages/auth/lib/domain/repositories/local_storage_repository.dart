import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

import '../domain.dart';

abstract class ILocalStorageRepository {
  Future<Either<Failure, User>> authenticate({
    required String username,
    required String password,
  });
}
