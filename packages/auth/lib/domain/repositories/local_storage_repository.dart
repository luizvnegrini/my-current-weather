import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

abstract class ILocalStorageRepository {
  Future<Either<Failure, Unit>> authenticate();
}
