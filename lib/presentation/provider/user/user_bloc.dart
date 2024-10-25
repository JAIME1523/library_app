import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:library_app/infrastrcuture/infrastructure.dart';
import 'package:nav_service/nav_service.dart';

import '../../../data/data.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final datasource = UsersRepositoryImpl(UserSharedDatasource());
  final GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController lastNameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  int ageControl = 0;
  DateTime? birthdateControl;
  final TextEditingController numberControl = TextEditingController();

  ExpansionTileController controllerExpand = ExpansionTileController();
  UserBloc() : super(UserInitial()) {
    on<GetUsers>(_onGeuser);
    on<ChangeGender>(_changeGender);
    on<SaveUser>(_saveUser);
    on<ChagngeView>(_changeView);
    on<DeleteAllUser>(_deleteAll);
  }
  _deleteAll(DeleteAllUser event, Emitter<UserState> emit) async {
    final isDelete = await datasource.deleteAll();
    if (isDelete) {
      emit(state.copyWith(users: [], viewSelect: ViewUserEnum.addUser));
      SnackService.showSnackbar("Se elimino datos");
      return;
    }
    SnackService.showSnackbarError("no se elimino datos");
  }

  _changeView(ChagngeView event, Emitter<UserState> emit) =>
      emit(state.copyWith(viewSelect: event.newView));

  _onGeuser(GetUsers event, Emitter<UserState> emit) async {
    final users = await datasource.getUser();
    emit(state.copyWith(
        users: users,
        viewSelect: users.isEmpty ? ViewUserEnum.addUser : ViewUserEnum.info));
  }

  _changeGender(ChangeGender event, Emitter<UserState> emit) {
    controllerExpand.collapse();
    emit(state.copyWith(genderSelec: event.newGender));
  }

  _saveUser(SaveUser event, Emitter<UserState> emit) async {
    if (!(keyForm.currentState?.validate() ?? false)) {
      SnackService.showSnackbarError("Revise sus datos para poder continuar");
      return;
    }
    if (birthdateControl == null) return;
    final newUser = User(
        name: nameControl.text,
        lastName: lastNameControl.text,
        email: emailControl.text,
        age: ageControl,
        birthdate: birthdateControl!,
        gender: state.genderSelec,
        phoneNumber: numberControl.text);
    final isSave = await datasource.saveUser(newUser);
    if (isSave) {
      final newList = await datasource.getUser();
      emit(state.copyWith(users: newList, viewSelect: ViewUserEnum.info));
      clerdata();

      return;
    }
    SnackService.showSnackbarError("No se pudo registrar ");
    emit(state.copyWith(viewSelect: ViewUserEnum.info));
    clerdata();
  }

  void slelectDate(DateTime? date) {
    if (date == null) {
      birthdateControl = null;
      ageControl = 0;
      return;
    }
    DateTime dateNow = DateTime.now();

    int edad = dateNow.year - date.year;
    if (dateNow.month < date.month ||
        (dateNow.month == date.month && dateNow.day < date.day)) {
      edad--;
    }
    ageControl = edad;
    birthdateControl = date;
  }

  void clerdata() {
    ageControl = 0;
    nameControl.clear();
    emailControl.clear();
    lastNameControl.clear();
    numberControl.clear();
    birthdateControl = null;
  }
}
