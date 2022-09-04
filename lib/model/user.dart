class User {
  final String name;
  final DateTime bornDate;
  final String email;
  final String avatar;
  final String gender;

  static User _cache = User();

  User._internal(
      this.name, this.bornDate, this.email, this.avatar, this.gender);

  factory User.fromJson(Map<String, dynamic> json, {int id = 0}) {
    User user = User._internal(
        json['name'].toString(),
        DateTime.parse(json['bornDate'].toString()),
        json['email'].toString(),
        json['avatar'].toString(),
        json['gender'].toString());
    return User(user: user);
  }

  factory User({User? user}) {
    if (user != null) {
      _cache = user;
    }
    return _cache;
  }
}
