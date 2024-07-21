import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_users_github/src/data/repositories/user_repository.dart';
import 'package:get_users_github/src/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  int currentTabIndex = 0;

  UserCubit({required this.userRepository}) : super(UserLoadingState());

  Future<void> getUsers() async {
    emit(UserLoadingState());

    try {
      final users = await userRepository.getUsers();
      await userRepository.updateUsersInfo(users);
      emit(UserLoadedState(users: users));
    } catch (error) {
      emit(UserErrorState(error: error.toString()));
    }
  }

  Future<void> searchUsers(String query) async {
    emit(UserLoadingState());
    try {
      final users = await userRepository.searchUsers(query);
      await userRepository.updateUsersInfo(users);
      _setTabIndex(users);
      emit(UserLoadedState(users: users));
    } catch (error) {
      emit(UserErrorState(error: error.toString()));
    }
  }

  void _setTabIndex(List<User> users) {
    if (users.isNotEmpty) {
      final firstLetter = users.first.login[0].toUpperCase();
      if (firstLetter.compareTo('I') < 0) {
        currentTabIndex = 0;
      } else if (firstLetter.compareTo('Q') < 0) {
        currentTabIndex = 1;
      } else {
        currentTabIndex = 2;
      }
    }
  }
}
