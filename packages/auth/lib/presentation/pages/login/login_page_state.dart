import 'package:shared/shared.dart';

abstract class ILoginPageState extends ViewModelState {
  const ILoginPageState();

  abstract final bool isLoading;
  abstract final String errorMessage;

  ILoginPageState copyWith({
    bool? isLoading,
    String? errorMessage,
  });
}

class LoginPageState extends ILoginPageState {
  const LoginPageState({
    this.isLoading = false,
    this.errorMessage = '',
  });

  factory LoginPageState.initial() => const LoginPageState();

  @override
  final bool isLoading;
  @override
  final String errorMessage;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
      ];

  @override
  ILoginPageState copyWith({
    isLoading,
    errorMessage,
  }) =>
      LoginPageState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
