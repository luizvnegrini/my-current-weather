import 'package:auth/auth.dart';

import 'core/core.dart';

abstract class IAppState {
  abstract final IAppDependencies appDependencies;
  abstract final IAuthDependencies authDependencies;
}

class AppState extends IAppState {
  AppState({
    required this.appDependencies,
    required this.authDependencies,
  });

  @override
  final IAppDependencies appDependencies;

  @override
  final IAuthDependencies authDependencies;
}
