part of 'user_bloc.dart';

@immutable
sealed class UserState {
  final bool isActive;
  final bool isLoading;
  final List<User> users;

 const UserState({required this.isActive, required this.isLoading, required this.users});

  UserState copyWith(
    final bool? isActive,
    final bool? isLoading,
    final List<User>? users,
  );
}

final class UserInitial extends UserState {
  UserInitial() : super(isActive: false, isLoading: true, users: []);

  @override
  UserState copyWith(bool? isActive, bool? isLoading, List<User>? users) => UserSetState(
      isActive: isActive ?? this.isActive,
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users);
}


class UserSetState extends UserState {
 const UserSetState({required super.isActive, required super.isLoading,required super.users});


  @override
  UserState copyWith(bool? isActive, bool? isLoading,List<User>? users) => UserSetState(
      isActive: isActive ?? this.isActive,
      isLoading: isLoading ?? this.isLoading,
      users: users ?? this.users);
 
}