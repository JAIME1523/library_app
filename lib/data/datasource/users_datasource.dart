import 'package:library_app/data/entitis/user.dart';

abstract class UsersDatasource {
  Future<User> getUser();
  Future<bool> saveUser(User newUser);
}
