class User {
  final String name;
  final String lastName;
  final String email;
  final int age;
  final DateTime birthdate;
  final GenderEnum gender;

  User(
      {required this.name,
      required this.lastName,
      required this.email,
      required this.age,
      required this.birthdate,
      required this.gender});

  User copyWith(
     String? name,
     String? lastName,
     String? email,
     int? age,
     DateTime? birthdate,
     GenderEnum? gender,
  ) =>
      User(
          name: name ?? this.name,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          age: age ?? this.age,
          birthdate: birthdate ?? this.birthdate,
          gender: gender ?? this.gender);
}

enum GenderEnum {
  masculino('masculino'),
  femenino('femenino'),
  otro('otro');

  final String value;
  const GenderEnum(this.value);
}
final genderValues = EnumValues({
  "femenino"   : GenderEnum.femenino,
  "masculino"    : GenderEnum.masculino,
  "otro" : GenderEnum.otro,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}