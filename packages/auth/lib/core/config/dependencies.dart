abstract class IAuthDependencies {
  //repositories

  //usecases

  //datasources

  //data
}

class AuthDependencies implements IAuthDependencies {
  //repositories

  //usecases

  //datasources

  //data

  @override
  AuthDependencies();

  static IAuthDependencies load() => AuthDependencies();
}
