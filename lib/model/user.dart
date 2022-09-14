class User {
  String? name;
  DateTime? bornDate;
  String? email;
  String? avatar;
  String? gender;
  String? password;
  String? description;

  static final User _user = User._internal();

  User._internal();

  factory User() {
    return _user;
  }

  String _getDate() {
    return bornDate.toString().split(" ")[0];
  }

  String _genderToEnum() {
    switch (gender) {
      case "Masculino":
        return "M";
      case "Feminino":
        return "F";
      case "Não binário":
        return "N";
      case "Fluido":
        return "F";
    }
    return "";
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
}
