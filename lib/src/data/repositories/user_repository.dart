import 'package:get_users_github/src/data/datasource/users_api.dart';
import 'package:get_users_github/src/models/user.dart';

class UserRepository {
  final UsersApi usersApi;

  UserRepository({required this.usersApi});

  Future<List<User>> getUsers() async => await usersApi.getUsers();

  Future<List<User>> searchUsers(String query) async =>
      await usersApi.searchUsers(query);

  Future<User> getUserInfo(String login) async =>
      await usersApi.getUserInfo(login);

  Future<void> updateUsersInfo(List<User> users) async {
    for (var user in users) {
      final userInfo = await getUserInfo(user.login);
      user.followers = userInfo.followers;
      user.following = userInfo.following;
    }
  }
}
