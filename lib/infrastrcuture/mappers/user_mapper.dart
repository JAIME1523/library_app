import 'package:intl/intl.dart';
import 'package:library_app/data/entitis/user.dart';
import 'package:library_app/infrastrcuture/models/users/user_db.dart';

class UserMapper {
  static User usermap(UserDb userdb) => User(
      name: userdb.name,
      lastName: userdb.lastName,
      email: userdb.email,
      age: userdb.age,
      birthdate: DateFormat('dd/MM/yy').parse(userdb.birthdate),
      gender: genderValues.map[userdb.gender] ?? GenderEnum.otro,
      phoneNumber: userdb.phoneNumber
      );

  static UserDb usertoDB(User user) => UserDb(
      name: user.name,
      birthdate: DateFormat("dd/MM/yy").format(user.birthdate),
      email: user.email,
      gender: user.gender.value ,
      lastName: user.lastName,
      age: user.age,
      phoneNumber: user.phoneNumber
      );
}
