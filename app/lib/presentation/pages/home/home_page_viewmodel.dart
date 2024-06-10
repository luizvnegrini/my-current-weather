import 'package:external_dependencies/external_dependencies.dart';
import 'package:my_current_weather/presentation/presentation.dart';
import 'package:shared/shared.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import 'home_page_state.dart';

final homePageViewModel =
    StateNotifierProvider.autoDispose<IHomePageViewModel, IHomePageState>(
  (ref) => HomePageViewModel(
    openWeatherRepository: ref.read(openWeatherRepository),
    geoLocationServiceAdapter: ref.read(geoLocatorServiceAdapter),
  ),
);

abstract class IHomePageViewModel extends ViewModel<IHomePageState> {
  IHomePageViewModel(super.state);

  abstract final IOpenWeatherRepository openWeatherRepository;
  abstract final IGeoLocationServiceAdapter geoLocationServiceAdapter;

  Future<void> getWeatherData();
}

class HomePageViewModel extends IHomePageViewModel {
  @override
  final IOpenWeatherRepository openWeatherRepository;
  @override
  final IGeoLocationServiceAdapter geoLocationServiceAdapter;

  HomePageViewModel({
    required this.geoLocationServiceAdapter,
    required this.openWeatherRepository,
  }) : super(HomePageState.initial());

  @override
  void initViewModel() {
    super.initViewModel();

    getWeatherData();
  }

  @override
  Future<void> getWeatherData() async {
    state = state.copyWith(isLoading: true);

    final position = await geoLocationServiceAdapter.getCurrentPosition();
    final response = await openWeatherRepository.currentWeather(
      lat: position.latitude,
      long: position.longitude,
    );

    final newState = response.fold(
      (failure) => throw UnimplementedError(),
      (currWeather) => state.copyWith(currentWeather: currWeather),
    );

    state = newState.copyWith(
      isLoading: false,
      position: position,
    );
  }
}
