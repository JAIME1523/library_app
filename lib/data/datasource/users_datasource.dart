import 'package:library_app/data/entitis/user.dart';

abstract class UsersDatasource {
  Future<List<User>> getUser();
  Future<bool> saveUser(User newUser);
  Future<bool> deleteAll();

}
