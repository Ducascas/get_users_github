import 'package:get_users_github/src/data/datasource/users_api.dart';
import 'package:get_users_github/src/models/user.dart';

class UserRepository {
  final UsersApi usersApi;

  UserRepository({required this.usersApi});

  Future<List<User>> getUsers() => usersApi.getUsers();
  Future<List<User>> searchUsers(String query) => usersApi.searchUsers(query);
}
