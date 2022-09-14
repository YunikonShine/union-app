class User {
  String? name;
  DateTime? bornDate;
  String? email;
  String? avatar;
  String? gender;
  String? password;
  String? description;

  static final Map<String, User> _cache = <String, User>{};

  User();

  factory User.cached(String cacheName) {
     return _cache.putIfAbsent(cacheName, () => User());
  }

  String _getDate() {
    return bornDate.toString().split(" ")[0];
  }

  String _genderToEnum() {
    return getGenders()[gender] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "bornDate": _getDate(),
      "email": email,
      "avatar": avatar,
      "gender": _genderToEnum(),
      "password": password,
      "description": description
    };
  }

  static Map<String, String> getGenders() {
    return {
      "Masculino": "MALE",
      "Feminino": "FEMALE",
      "Não binário": "NON_BINARY",
      "Fluido": "FLUID",
      "Outro": "OTHER",
      "Prefiro não responder": "NULL_RESPONSE",
    };
  }
}
