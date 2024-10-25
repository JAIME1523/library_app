part of 'user_bloc.dart';

@immutable
sealed class UserState {
  final bool isActive;
  final bool isLoading;
  final ViewUserEnum viewSelect;
  final GenderEnum genderSelec;
  final List<User> users;

  const UserState(
      {required this.isActive,
      required this.isLoading,
      required this.users,
      required this.viewSelect,
      required this.genderSelec});

  UserState copyWith({
    final bool? isActive,
    final bool? isLoading,
    final List<User>? users,
    final ViewUserEnum? viewSelect,
    final GenderEnum? genderSelec,
  });
}

final class UserInitial extends UserState {
  UserInitial()
      : super(
            isActive: false,
            isLoading: true,
            users: [],
            viewSelect: ViewUserEnum.info,
            genderSelec: GenderEnum.masculino);

  @override
  UserState copyWith({
    bool? isActive,
    bool? isLoading,
    List<User>? users,
    ViewUserEnum? viewSelect,
    GenderEnum? genderSelec,
  }) =>
      UserSetState(
          isActive: isActive ?? this.isActive,
          isLoading: isLoading ?? this.isLoading,
          users: users ?? this.users,
          viewSelect: viewSelect ?? this.viewSelect,
          genderSelec: genderSelec ?? this.genderSelec);
}

class UserSetState extends UserState {
  const UserSetState(
      {required super.isActive,
      required super.isLoading,
      required super.users,
      required super.viewSelect,
      required super.genderSelec});

  @override
  UserState copyWith({
    bool? isActive,
    bool? isLoading,
    List<User>? users,
    ViewUserEnum? viewSelect,
    GenderEnum? genderSelec,
  }) =>
      UserSetState(
          isActive: isActive ?? this.isActive,
          isLoading: isLoading ?? this.isLoading,
          users: users ?? this.users,
          viewSelect: viewSelect ?? this.viewSelect,
          genderSelec: genderSelec ?? this.genderSelec);
}

enum ViewUserEnum {
  info,
  addUser,
}
