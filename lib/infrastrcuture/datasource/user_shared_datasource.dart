import 'dart:convert';
import 'package:library_app/config/utils/utils.dart';
import 'package:library_app/data/datasource/users_datasource.dart';
import 'package:library_app/data/entitis/user.dart';
import 'package:library_app/infrastrcuture/infrastructure.dart';
import 'package:library_app/infrastrcuture/mappers/user_mapper.dart';

class UserSharedDatasource extends UsersDatasource {
  @override
  Future<List<User>> getUser() async {
    final users = LocalStorage.getStringList(PreferencesListString.users);
    final usersdb =
        users.map((userD) => UserDb.fromJson(jsonDecode(userD))).toList();
    final userMap = usersdb.map((user) => UserMapper.usermap(user)).toList();
    return userMap;
  }

  @override
  Future<bool> saveUser(User newUser) async {
    try {
      final usersList = LocalStorage.getStringList(PreferencesListString.users);
      final userdb = UserMapper.usertoDB(newUser);
      usersList.add(jsonEncode(userdb.toJson()));
      await LocalStorage.setString(PreferencesListString.users, usersList);
      return true;
    } catch (e) {
      return false;
    }
  }
}
