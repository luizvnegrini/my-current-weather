import 'package:auth/domain/domain.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

import '../data.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  final ILocalStorageDatasource _datasource;

  LocalStorageRepository({
    required ILocalStorageDatasource datasource,
  }) : _datasource = datasource;

  @override
  Future<Either<Failure, User>> authenticate({
    required String username,
    required String password,
  }) async {
    try {
      final userModel = await _datasource.authenticate(
        username: username,
        password: password,
      );

      return Right(userModel.toEntity());
    } catch (e) {
      return Left(Failure(type: ExceptionType.serverError));
    }
  }
}
