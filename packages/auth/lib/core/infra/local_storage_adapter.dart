import 'package:auth/core/core.dart';

class LocalStorageAdapter implements ILocalStorageAdapter {
  @override
  Future<Map<String, dynamic>> fetch(String key) {
    // TODO: implement fetch
    throw UnimplementedError();
  }

  @override
  Future<void> reset() {
    // TODO: implement reset
    throw UnimplementedError();
  }

  @override
  Future<void> save(String key, Map<String, dynamic> data) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
