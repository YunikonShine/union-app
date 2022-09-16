class Psychologist {
  String name;
  String avatar;
  String hash;
  String publicKey;

  Psychologist(this.name, this.avatar, this.hash, this.publicKey);

  factory Psychologist.fromJson(Map<String, dynamic> json) {
    return Psychologist(json['name'].toString(), json['avatar'].toString(),
        json['hash'].toString(), json['publicKey'].toString());
  }
}
