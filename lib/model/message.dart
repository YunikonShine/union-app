class Message {
  final String message;
  final DateTime createdAt;

  Message(this.message, this.createdAt);

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      json['message'],
      json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'createdAt': createdAt,
    };
  }
}
