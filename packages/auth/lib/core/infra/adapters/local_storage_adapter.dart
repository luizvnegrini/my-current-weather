import 'dart:async';

import 'package:external_dependencies/external_dependencies.dart';

abstract class ILocalStorageAdapter {
  String? fetch(String key);
  void delete(String key);
  Future<void> save({required String key, required String value});
  void clear();
}

class LocalStorageAdapter implements ILocalStorageAdapter {
  Future<void> init() async {
    await initLocalStorage();
  }

  @override
  Future<void> save({
    required String key,
    required String value,
  }) async {
    localStorage.removeItem(key);
    localStorage.setItem(key, value);
  }

  @override
  void delete(String key) => localStorage.removeItem(key);

  @override
  String? fetch(String key) => localStorage.getItem(key);

  @override
  void clear() => localStorage.clear();
}
