import 'package:external_dependencies/external_dependencies.dart';

import '../../presentation/presentation.dart';

class Routes {
  static String get _source => '/home';
  static String get home => _source;
}

class AppModule {
  static List<GoRoute> get routes => [
        GoRoute(
          name: 'home',
          path: Routes.home,
          builder: (context, state) => const HomePage(),
        ),
      ];
}
