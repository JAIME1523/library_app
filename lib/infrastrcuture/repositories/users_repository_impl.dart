import 'package:library_app/data/datasource/users_datasource.dart';
import 'package:library_app/data/entitis/user.dart';
import 'package:library_app/data/repositories/users_repository.dart';

class UsersRepositoryImpl extends UsersRepository {
  final UsersDatasource datasource;

  UsersRepositoryImpl(this.datasource);

  @override
  Future<List<User>> getUser() async => datasource.getUser();

  @override
  Future<bool> saveUser(User newUser) async => datasource.saveUser(newUser);
}
