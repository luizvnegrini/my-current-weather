import 'dart:async';

import 'package:auth/auth.dart';
import 'package:auth/presentation/pages/login/login_page_state.dart';
import 'package:external_dependencies/external_dependencies.dart';
import 'package:shared/shared.dart';

import '../../../domain/domain.dart';

final loginPageViewModel =
    StateNotifierProvider.autoDispose<ILoginPageViewModel, ILoginPageState>(
  (ref) => LoginPageViewModel(
    localStorageRepository: ref.read(localStorageRepository),
  ),
);

abstract class ILoginPageViewModel extends ViewModel<ILoginPageState> {
  ILoginPageViewModel(LoginPageState super.state);

  abstract final ILocalStorageRepository localStorageRepository;

  Future<void> authenticate({
    required String username,
    required String password,
  });
}

class LoginPageViewModel extends ILoginPageViewModel {
  LoginPageViewModel({
    required this.localStorageRepository,
  }) : super(LoginPageState.initial());

  @override
  final ILocalStorageRepository localStorageRepository;

  // @override
  // void initViewModel() {
  //   super.initViewModel();
  // }

  @override
  Future<void> authenticate({
    required String username,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true);

    // state = newState.copyWith(isLoading: false);
  }
}
