import '../../domain/domain.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) => User(
        username: json['username'],
        password: json['password'],
      );
}
