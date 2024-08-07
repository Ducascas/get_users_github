import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_users_github/src/core/di.dart';
import 'package:get_users_github/src/cubit/user_cubit/user_cubit.dart';
import 'package:get_users_github/src/screens/users_screen.dart';

class GetUsersApp extends StatelessWidget {
  const GetUsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserCubit>(),
      child: const MaterialApp(
        title: 'Github Users',
        home: UsersScreen(),
      ),
    );
  }
}
