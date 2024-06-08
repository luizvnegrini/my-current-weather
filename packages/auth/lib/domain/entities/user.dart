import 'package:external_dependencies/external_dependencies.dart';

class User extends Equatable {
  final String username;

  User({required this.username});

  @override
  List<Object?> get props => [username];
}
