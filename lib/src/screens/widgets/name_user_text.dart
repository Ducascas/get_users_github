import 'package:flutter/material.dart';
import 'package:get_users_github/src/core/textstyle.dart';

class NameUserText extends StatelessWidget {
  const NameUserText({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name.replaceFirst(
        name[0],
        name[0].toUpperCase(),
      ),
      style: TextStyleApp.mainTextStyle,
    );
  }
}
