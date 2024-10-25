part of 'user_bloc.dart';

@immutable
sealed class UserState {
  final bool isActive;
  final bool isLoading;
  final User? user;

 const UserState({required this.isActive, required this.isLoading, this.user});

  UserState copyWith(
    final bool? isActive,
    final bool? isLoading,
    final User? user,
  );
}

final class UserInitial extends UserState {
 const UserInitial() : super(isActive: false, isLoading: true, user: null);

  @override
  UserState copyWith(bool? isActive, bool? isLoading, User? user) => UserSetState(
      isActive: isActive ?? this.isActive,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user);
}


class UserSetState extends UserState {
 const UserSetState({required super.isActive, required super.isLoading, super.user});


  @override
  UserState copyWith(bool? isActive, bool? isLoading, User? user) => UserSetState(
      isActive: isActive ?? this.isActive,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user);
 
}