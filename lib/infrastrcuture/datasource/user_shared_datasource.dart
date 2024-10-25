import 'package:library_app/data/datasource/users_datasource.dart';
import 'package:library_app/data/entitis/user.dart';

class UserSharedDatasource extends UsersDatasource{
  @override
  Future<User> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUser(User newUser) {
    // TODO: implement saveUser
    throw UnimplementedError();
  }
}