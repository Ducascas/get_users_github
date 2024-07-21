part of 'user_cubit.dart';

abstract class UserState extends Equatable {}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoadedState extends UserState {
  final List<User> users;

  UserLoadedState({required this.users});

  @override
  List<Object?> get props => [users];
}

class UserErrorState extends UserState {
  final String error;

  UserErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
