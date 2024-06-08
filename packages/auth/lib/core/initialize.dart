import 'core.dart';

class Core {
  static final _instances = [];

  static Future<void> initialize() async {
    await _loadAsync();
  }

  static Future _loadAsync() async => await Future.wait([
        _initLocalStorage(),
      ]);

  static Future<void> _initLocalStorage() async {
    final localStorage = LocalStorageAdapter();
    await localStorage.init();

    _instances.add(localStorage);
  }
}

dynamic instanceOf<T>() =>
    Core._instances.firstWhere((e) => e.runtimeType == T);
