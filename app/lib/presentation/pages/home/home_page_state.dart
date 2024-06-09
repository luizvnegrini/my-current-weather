import 'package:shared/shared.dart';

import '../../../domain/domain.dart';

abstract class IHomePageState extends ViewModelState {
  const IHomePageState();

  abstract final bool isLoading;
  abstract final String errorMessage;
  abstract final Position? position;
  abstract final CurrentWeather? dailyAggregation;

  IHomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    Position? position,
    CurrentWeather? dailyAggregation,
  });
}

class HomePageState extends IHomePageState {
  const HomePageState({
    this.isLoading = true,
    this.errorMessage = '',
    this.position,
    this.dailyAggregation,
  });

  factory HomePageState.initial() => const HomePageState();

  @override
  final bool isLoading;
  @override
  final String errorMessage;
  @override
  final Position? position;
  @override
  final CurrentWeather? dailyAggregation;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        position,
        dailyAggregation,
      ];

  @override
  IHomePageState copyWith({
    isLoading,
    errorMessage,
    position,
    dailyAggregation,
  }) =>
      HomePageState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        position: position ?? this.position,
        dailyAggregation: dailyAggregation ?? this.dailyAggregation,
      );
}
