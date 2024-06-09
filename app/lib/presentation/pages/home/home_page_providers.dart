//vm's

import 'package:external_dependencies/external_dependencies.dart';
import 'package:my_current_weather/presentation/pages/home/home_page_state.dart';

import 'home_page_viewmodel.dart';

//vm's
IHomePageViewModel readHomeViewModel(WidgetRef ref) =>
    ref.read(homePageViewModel.notifier);

//states
IHomePageState useHomeState(WidgetRef ref) => ref.watch(homePageViewModel);
