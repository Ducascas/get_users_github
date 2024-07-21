import 'package:dio/dio.dart';
import 'package:get_users_github/src/core/api_url.dart';
import 'package:get_users_github/src/models/user.dart';

class UsersApi {
  final Dio dio;

  UsersApi(this.dio);

  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        var data = response.data as List;
        final users = data.map((user) => User.fromMap(user)).toList();
        for (var user in users) {
          user.followers = await _getFollowCount(user.followersUrl);
          user.following = await _getFollowCount(user.followingUrl);
        }
        return users;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception('Failed to get users: $e');
    }
  }

  Future<List<User>> searchUsers(String query) async {
    final response = await dio.get('$searchUrl$query');
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['items'];
      final users = data.map((user) => User.fromMap(user)).toList();
      for (var user in users) {
        user.followers = await _getFollowCount(user.followersUrl);
        user.following = await _getFollowCount(user.followingUrl);
      }
      return users;
    } else {
      throw Exception();
    }
  }

  Future<int> _getFollowCount(String url) async {
    try {
      final trimmedUrl = trimUrl(url);
      final response = await dio.get(trimmedUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.length;
      } else {
        throw Exception('Failed to get count');
      }
    } catch (e) {
      throw Exception('Failed to get count: $e');
    }
  }
}
