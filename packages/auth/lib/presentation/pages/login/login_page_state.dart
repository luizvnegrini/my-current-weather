import 'package:shared/shared.dart';

abstract class ILoginPageState extends ViewModelState {
  const ILoginPageState();

  abstract final bool isLoading;
  abstract final String errorMessage;
  abstract final bool? successOnAuthenticate;

  ILoginPageState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? successOnAuthenticate,
  });
}

class LoginPageState extends ILoginPageState {
  const LoginPageState({
    this.isLoading = false,
    this.errorMessage = '',
    this.successOnAuthenticate,
  });

  factory LoginPageState.initial() => const LoginPageState();

  @override
  final bool isLoading;
  @override
  final String errorMessage;
  @override
  final bool? successOnAuthenticate;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        successOnAuthenticate,
      ];

  @override
  ILoginPageState copyWith({
    isLoading,
    errorMessage,
    successOnAuthenticate,
  }) =>
      LoginPageState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        successOnAuthenticate:
            successOnAuthenticate ?? this.successOnAuthenticate,
      );
}
