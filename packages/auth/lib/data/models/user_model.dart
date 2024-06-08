import 'package:external_dependencies/external_dependencies.dart';

import '../../domain/domain.dart';

class UserModel extends Equatable {
  final String username;

  const UserModel({required this.username});

  @override
  List<Object?> get props => [username];

  User toEntity() => User(username: username);
}
