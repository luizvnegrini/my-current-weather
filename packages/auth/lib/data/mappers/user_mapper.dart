import 'dart:convert';

import '../../domain/domain.dart';

class UserMapper {
  static User fromJson(String json) {
    final map = jsonDecode(json) as Map<String, dynamic>;

    return User(
      username: map['username'],
      password: map['password'],
    );
  }

  static String toJson(User user) => jsonEncode({
        'username': user.username,
        'password': user.password,
      });
}
