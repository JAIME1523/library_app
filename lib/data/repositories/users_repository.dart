import '../entitis/user.dart';

abstract class UsersRepository {
  Future<User> getUser();
  Future<bool> saveUser(User newUser);
}