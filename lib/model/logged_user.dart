class LoggedUser {
  final String name;
  final String hash;
  final DateTime bornDate;
  final String email;
  final String avatar;
  final String gender;

  static LoggedUser _loggedUser = LoggedUser();

  LoggedUser._internal(
      this.name, this.hash, this.bornDate, this.email, this.avatar, this.gender);

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    LoggedUser loggedUser = LoggedUser._internal(
        json['name'].toString(),
        json['hash'].toString(),
        DateTime.parse(json['bornDate'].toString()),
        json['email'].toString(),
        json['avatar'].toString(),
        json['gender'].toString());
    return LoggedUser(loggedUser: loggedUser);
  }

  factory LoggedUser({LoggedUser? loggedUser}) {
    if (loggedUser != null) {
      _loggedUser = loggedUser;
    }
    return _loggedUser;
  }
}
