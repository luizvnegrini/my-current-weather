import 'package:auth/domain/domain.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/core/faults/failure.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  @override
  Future<Either<Failure, Unit>> authenticate() {
    throw UnimplementedError();
  }
}
