import 'package:auth/core/core.dart';

import '../data.dart';

abstract class ILocalStorageDatasource {
  Future<UserModel> authenticate({
    required String username,
    required String password,
  });
}

class LocalStorageDatasource implements ILocalStorageDatasource {
  final ILocalStorageAdapter _localStorageAdapter;
  static const String _userKey = 'user';

  LocalStorageDatasource({
    required ILocalStorageAdapter localStorageAdapter,
  }) : _localStorageAdapter = localStorageAdapter;

  @override
  Future<UserModel> authenticate({
    required String username,
    required String password,
  }) async {
    final user = await _localStorageAdapter.fetch(_userKey);
    throw UnimplementedError();
  }
}
