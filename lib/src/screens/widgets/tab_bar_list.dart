import 'package:flutter/material.dart';
import 'package:get_users_github/src/models/user.dart';
import 'package:get_users_github/src/screens/widgets/widgets.dart';

class TabBarList extends StatelessWidget {
  const TabBarList({
    super.key,
    required this.users,
    required this.tabController,
  });

  final List<User> users;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        UserList(users: users, start: 'A', end: 'H'),
        UserList(users: users, start: 'I', end: 'P'),
        UserList(users: users, start: 'Q', end: 'Z'),
      ],
    );
  }
}
