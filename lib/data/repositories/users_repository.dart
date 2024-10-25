import '../entitis/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUser();
  Future<bool> saveUser(User newUser);
}