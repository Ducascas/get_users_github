import 'package:flutter/material.dart';
import 'package:get_users_github/src/core/tab_list.dart';

class TabBarAppbar extends StatelessWidget {
  const TabBarAppbar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        TabBar(
          controller: tabController,
          tabs: tabList,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          labelStyle: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
