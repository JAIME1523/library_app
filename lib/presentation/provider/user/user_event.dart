part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class GetUsers extends UserEvent {}

class SaveUser extends UserEvent {}

class ChagngeView extends UserEvent {
  final ViewUserEnum newView;

  ChagngeView({required this.newView});
}

class ChangeGender extends UserEvent {
  final GenderEnum newGender;

  ChangeGender(this.newGender);
}


class DeleteAllUser extends UserEvent{
  
}