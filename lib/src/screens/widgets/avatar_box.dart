import 'package:flutter/material.dart';
import 'package:get_users_github/src/models/user.dart';

class AvatarBox extends StatelessWidget {
  const AvatarBox({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.network(
        user.avatarUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
