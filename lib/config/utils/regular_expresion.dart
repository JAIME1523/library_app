class RegularExpressions {
  static const String _email =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  static const String _names = r'^[a-zA-Z\s]+$';
  static const String _phone = r'^[0-9]+$';

  static String? validateEmail(value) {
    RegExp regExp = RegExp(_email);
    return regExp.hasMatch(value ?? '') ? null : 'Correo electrónico no válido';
  }

  static String? validateNames(value) {
    RegExp regExp = RegExp(_names);
    return regExp.hasMatch(value ?? '') ? null : 'Este dato no es válido';
  }

  static String? validatePhone(value) {
    RegExp regExp = RegExp(_phone);
    return regExp.hasMatch(value ?? '') ? null : 'El numero no es válido';
  }
}
