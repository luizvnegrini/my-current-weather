import 'package:external_dependencies/external_dependencies.dart';

import '../../presentation/presentation.dart';

class AuthRoutes {
  static String get _source => '/auth';
  static String get login => '$_source/login';
}

class AuthModule {
  static List<GoRoute> get routes => [
        GoRoute(
          name: 'login',
          path: AuthRoutes.login,
          builder: (context, state) => const LoginPage(),
        ),
      ];
}
