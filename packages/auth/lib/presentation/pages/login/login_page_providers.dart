//vm's

import 'package:auth/presentation/pages/login/login_page_state.dart';
import 'package:external_dependencies/external_dependencies.dart';

import 'login_page_viewmodel.dart';

//vm's
ILoginPageViewModel readHomeViewModel(WidgetRef ref) =>
    ref.read(loginPageViewModel.notifier);

//states
ILoginPageState useHomeState(WidgetRef ref) => ref.watch(loginPageViewModel);
