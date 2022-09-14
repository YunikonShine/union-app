class Password {
  String? oldPassword;
  String? password;

  Map<String, dynamic> toMap() {
    return {
      "oldPassword": oldPassword,
      "password": password,
    };
  }
}
