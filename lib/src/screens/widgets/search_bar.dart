import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_users_github/src/cubit/user_cubit/user_cubit.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({super.key});

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = context.read<UserCubit>();
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(border: InputBorder.none),
            onSubmitted: (query) {
              if (query.isNotEmpty) {
                searchCubit.searchUsers(query);
              }
            },
          ),
        ),
        IconButton(
          onPressed: () {
            final query = _searchController.text;
            if (query.isNotEmpty) {
              searchCubit.searchUsers(query);
            }
          },
          icon: Transform.rotate(
            angle: 90 * pi / 180,
            child: const Icon(
              Icons.search,
              size: 36,
            ),
          ),
        ),
      ],
    );
  }
}
