abstract class IAppDependencies {
  //repositories

  //usecases

  //datasources
}

class AppDependencies implements IAppDependencies {
  //repositories

  //usecases

  //datasources

  AppDependencies();

  static IAppDependencies load() {
    return AppDependencies();
  }
}
