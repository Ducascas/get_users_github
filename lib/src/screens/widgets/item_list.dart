import 'package:flutter/material.dart';
import 'package:get_users_github/src/models/user.dart';
import 'package:get_users_github/src/screens/widgets/widgets.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: AvatarBox(user: user),
      title: NameUserText(name: user.login),
      subtitle: FollowInfo(user: user),
    );
  }
}
