import 'package:flutter/material.dart';
import 'package:get_users_github/src/core/text_style.dart';
import 'package:get_users_github/src/models/user.dart';

class FollowInfo extends StatelessWidget {
  const FollowInfo({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${user.followers} / ${user.following}',
      style: TextStyleApp.mainTextStyle,
    );
  }
}
