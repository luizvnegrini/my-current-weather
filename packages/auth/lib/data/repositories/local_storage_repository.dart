import 'package:auth/domain/domain.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

import '../../core/core.dart';
import '../data.dart';

class LocalStorageRepository implements ILocalStorageRepository {
  final ILocalStorageAdapter _localStorageAdapter;
  static const String _userKey = 'user';

  @override
  bool isAuthenticated = false;

  LocalStorageRepository({
    required ILocalStorageAdapter localStorageAdapter,
  }) : _localStorageAdapter = localStorageAdapter;

  @override
  Future<Either<Failure, Unit>> authenticate({
    required String username,
    required String password,
  }) async {
    try {
      final userData = _localStorageAdapter.fetch(_userKey);

      //first call to this method will save the user
      if (userData == null) {
        final user = User(username: username, password: password);
        await _localStorageAdapter.save(
          key: _userKey,
          value: UserMapper.toJson(user),
        );
        isAuthenticated = true;
        return right(unit);
      }

      final user = UserMapper.fromJson(userData);
      if (user.password == password && user.username == username) {
        isAuthenticated = true;
        return right(unit);
      }

      return left(Failure(type: ExceptionType.unauthorized));
    } catch (e) {
      return Left(Failure(type: ExceptionType.serverError));
    }
  }

  @override
  void clear() {
    _localStorageAdapter.clear();
  }
}
