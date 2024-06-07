import 'package:auth/domain/domain.dart';

abstract class IAuthState {
  abstract final ILocalStorageRepository localStorageRepository;
}

class AuthState extends IAuthState {
  AuthState({
    required this.localStorageRepository,
  });

  @override
  final ILocalStorageRepository localStorageRepository;
}
