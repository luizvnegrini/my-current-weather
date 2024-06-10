import 'package:shared/shared.dart';

import '../../../domain/domain.dart';

abstract class IHomePageState extends ViewModelState {
  const IHomePageState();

  abstract final bool isLoading;
  abstract final String errorMessage;
  abstract final Position? position;
  abstract final CurrentWeather? currentWeather;

  IHomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    Position? position,
    CurrentWeather? currentWeather,
  });
}

class HomePageState extends IHomePageState {
  const HomePageState({
    this.isLoading = true,
    this.errorMessage = '',
    this.position,
    this.currentWeather,
  });

  factory HomePageState.initial() => const HomePageState();

  @override
  final bool isLoading;
  @override
  final String errorMessage;
  @override
  final Position? position;
  @override
  final CurrentWeather? currentWeather;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        position,
        currentWeather,
      ];

  @override
  IHomePageState copyWith({
    isLoading,
    errorMessage,
    position,
    currentWeather,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        position: position ?? this.position,
        currentWeather: currentWeather ?? this.currentWeather,
      );
}
