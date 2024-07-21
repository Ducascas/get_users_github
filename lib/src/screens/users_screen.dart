import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_users_github/src/core/tab_list.dart';
import 'package:get_users_github/src/cubit/user_cubit/user_cubit.dart';
import 'package:get_users_github/src/screens/widgets/widgets.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenPageState();
}

class _UsersScreenPageState extends State<UsersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    context.read<UserCubit>().getUsers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();

    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: const SearchAppBar(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: TabBarAppbar(tabController: _tabController),
          ),
        ),
        body: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
            if (state is UserLoadedState) {
              _tabController.animateTo(cubit.currentTabIndex);
            }
          },
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoadedState) {
              final users = state.users;
              return TabBarList(users: users, tabController: _tabController);
            } else if (state is UserErrorState) {
              return Center(child: Text(state.error));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
