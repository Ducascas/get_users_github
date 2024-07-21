import 'package:flutter/material.dart';
import 'package:get_users_github/src/models/user.dart';
import 'package:get_users_github/src/screens/widgets/widgets.dart';

class UserList extends StatelessWidget {
  const UserList({
    super.key,
    required this.users,
    required this.start,
    required this.end,
  });

  final List<User> users;
  final String start, end;

  @override
  Widget build(BuildContext context) {
    /*
      Cоздаем список пользователей,ники которых попадают
      в выборку между входящими данными
    */
    final filteredUsers = users.where((user) {
      final firstLetter = user.login[0].toUpperCase();

      return firstLetter.compareTo(start) >= 0 &&
          firstLetter.compareTo(end) <= 0;
    }).toList();

    return ListView.separated(
      itemCount: filteredUsers.length,
      separatorBuilder: (context, _) => const Divider(),
      itemBuilder: (context, index) => ItemList(user: filteredUsers[index]),
    );
  }
}
