import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:union/model/logged_user.dart';
import 'package:union/model/message.dart';

class FirebaseChat {
  static final LoggedUser _loggedUser = LoggedUser();

  static Future sendMessage(String hashUser, String textMessage) async {
    String collectionPath = "chats/$hashUser/${_loggedUser.hash}";
    CollectionReference refMessages =
        FirebaseFirestore.instance.collection(collectionPath);

    Message message = Message(textMessage, DateTime.now());

    await refMessages.add(message.toJson());
    getMessages(hashUser);
  }

  static Future getMessages(String hashUser) async {
    String collectionPath = "chats/$hashUser/${_loggedUser.hash}";
    CollectionReference refMessages =
        FirebaseFirestore.instance.collection(collectionPath);
    QuerySnapshot query = await refMessages.get();
    query.docs.forEach((doc) => {
      print(doc.data())
    });
  }
}
