import 'package:flutter/material.dart';
import 'package:get_users_github/src/core/di.dart';
import 'package:get_users_github/src/get_users_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const GetUsersApp());
}
