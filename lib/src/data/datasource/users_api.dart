import 'package:dio/dio.dart';
import 'package:get_users_github/src/core/api_url.dart';
import 'package:get_users_github/src/models/user.dart';

class UsersApi {
  final Dio dio;

  UsersApi({required this.dio});

  Future<List<User>> getUsers() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        var data = response.data as List;
        return data.map((user) => User.fromMap(user)).toList();
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw Exception(
            'Request failed with status: ${e.response?.statusCode}. Rate limit exceeded or access forbidden.');
      } else {
        throw Exception('Failed to get users: $e');
      }
    }
  }

  Future<User> getUserInfo(String login) async {
    try {
      final response = await dio.get('$baseUrl/$login');
      if (response.statusCode == 200) {
        var data = response.data;
        return User.fromMap(data);
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw Exception(
            'Request failed with status: ${e.response?.data}. Rate limit exceeded or access forbidden.');
      } else {
        throw Exception('Failed to update info users: $e');
      }
    }
  }

  Future<List<User>> searchUsers(String query) async {
    try {
      final response = await dio.get('$searchUrl$query');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['items'];
        return data.map((user) => User.fromMap(user)).toList();
      } else {
        throw Exception();
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 403) {
        throw Exception(
            'Request failed with status: ${e.response?.data}. Rate limit exceeded or access forbidden.');
      } else {
        throw Exception('Failed to search users: $e');
      }
    }
  }
}
