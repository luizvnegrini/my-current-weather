abstract class ILocalStorageAdapter {
  Future<void> save(String key, Map<String, dynamic> data);
  Future<Map<String, dynamic>> fetch(String key);
  Future<void> reset();
}
