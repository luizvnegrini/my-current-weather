import 'package:external_dependencies/external_dependencies.dart';

class User extends Equatable {
  final String username;
  final String password;

  const User({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
