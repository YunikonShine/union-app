import 'package:flutter/material.dart';
import 'package:union/model/psychologist.dart';
import 'package:union/routes_names.dart';
import 'package:union/services/psychologist_service.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/widgets/custom_drawer.dart';
import 'package:union/widgets/psychologist_card/psychologist_card.dart';

class ListChat extends StatefulWidget {
  const ListChat({Key? key}) : super(key: key);

  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> with WidgetsBindingObserver {
  // Widget listChat = const Center(
  //   child: CircularProgressIndicator(),
  // );
  // StompClient _stompClient;
  // bool allMessages = true;
  // Map<String, int> messageQuantity = {};
  List<Psychologist> psychologists = [];
  bool findingPsychologist = true;
  final PsychologistService _psychologistService = PsychologistService();

  // _findAllMessages() async {
  //   http.Response response = await findAllMessages();
  //   if (response.body.isNotEmpty) {
  //     List<dynamic> messages = json.decode(response.body);
  //     for (var i = 0; i < messages.length; i++) {
  //       try {
  //         String messageDecrypted =
  //             Crypt.decryptMessage(messages[i]["messageText"]);
  //         List rows = await GetIt.instance<DatabaseService>().execute(
  //             "SELECT * FROM _common_user WHERE hash = '${messages[i]["hashFrom"]}'");
  //         if (rows.length == 0) {
  //           await GetIt.instance<DatabaseService>().execute(
  //               "INSERT INTO _common_user(name, avatar, hash) VALUES (?, '${messages[i]["avatar"]}', '${messages[i]["hashFrom"]}')",
  //               arguments: [messages[i]["name"]]);
  //         }
  //         await GetIt.instance<DatabaseService>().execute(
  //             "INSERT INTO _message(message, hash_from, hash_to, creation_date) VALUES(?, '${messages[i]["hashFrom"]}', '${getUserLogged().hash}', ${int.parse(messages[i]["date"])});",
  //             arguments: [messageDecrypted]);
  //         print(messages[i]["hashFrom"]);
  //         if (messageQuantity[messages[i]["hashFrom"]] != null) {
  //           messageQuantity[messages[i]["hashFrom"]] =
  //               messageQuantity[messages[i]["hashFrom"]] + 1;
  //         } else {
  //           messageQuantity[messages[i]["hashFrom"]] = 1;
  //         }
  //       } catch (e) {}
  //       await deleteMessage(messages[i]["id"].toString());
  //     }
  //   }
  //   setState(() {
  //     allMessages = true;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(this);
    // FirebaseAnalytics().setCurrentScreen(screenName: PsychologistListRoute);
    // setClient();
    // _findAllMessages();
    _findPsychologists();
  }

  _findPsychologists() async {
    List<Psychologist> tempList =
        await _psychologistService.getPsychologistList();
    setState(() {
      psychologists = tempList;
      findingPsychologist = false;
    });
  }

  // void setClient() async {
  //   if (_stompClient == null) {
  //     _stompClient = await connect(wsEndpoint);
  //     setState(() {});
  //     _stompClient.subscribeString(
  //         getUserLogged().hash, "/chat/message/${getUserLogged().hash}",
  //         (Map<String, String> headers, String message) async {
  //       try {
  //         String messageDecrypted = Crypt.decryptMessage(message);
  //         List rows = await GetIt.instance<DatabaseService>().execute(
  //             "SELECT * FROM _common_user WHERE hash = '${headers["from"]}'");
  //         if (rows.length == 0) {
  //           await GetIt.instance<DatabaseService>().execute(
  //               "INSERT INTO _common_user(name, avatar, hash) VALUES (?, '${headers["avatar"]}', '${headers["from"]}')",
  //               arguments: [headers["name"]]);
  //         }
  //         await GetIt.instance<DatabaseService>().execute(
  //             "INSERT INTO _message(message, hash_from, hash_to, creation_date) VALUES(?, '${headers["from"]}', '${getUserLogged().hash}', ${int.parse(headers["date"])});",
  //             arguments: [messageDecrypted]);
  //         await deleteMessage(headers["message-id"]);
  //         await GetIt.instance<NotificationService>().sendNotification(
  //             headers["name"], messageDecrypted, headers["avatar"]);
  //         if (messageQuantity[headers["from"]] != null) {
  //           messageQuantity[headers["from"]] =
  //               messageQuantity[headers["from"]] + 1;
  //         } else {
  //           messageQuantity[headers["from"]] = 1;
  //         }
  //         setState(() {});
  //       } catch (e) {}
  //     });
  //   }
  // }

  @override
  void dispose() {
    // WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //TODO Usuário online
//    if (state == null || GetIt
//        .instance<GoogleService>()
//        .currentUser == null) {
//      return;
//    }
//    switch (state) {
//      case AppLifecycleState.paused:
//      case AppLifecycleState.inactive:
//      case AppLifecycleState.detached:
//        GetIt.instance<FirestoreService>().updateStatus(false);
//        break;
//      case AppLifecycleState.resumed:
//        GetIt.instance<FirestoreService>().updateStatus(true);
//        break;
//    }
  }

  getUsersForList() async {
    //TODO lista de psicologos
//    Firestore.instance
//        .collection("users")
//        .orderBy("name")
//        .snapshots()
//        .listen((data) {
//      List<DocumentSnapshot> documents = data.documents;
//      Map<String, DocumentSnapshot> mapIdChat = Map();
//      documents.forEach((document) async {
//        if (document.data['uid'] ==
//            GetIt
//                .instance<GoogleService>()
//                .currentUser
//                ?.uid) {
//          return;
//        }
//        List row = await GetIt.instance<DatabaseService>().execute(
//            "SELECT chat_id FROM _chat WHERE conversation_user = '${document
//                .data['uid']}'");
//        String chatId;
//        if (row != null && row.length > 0) {
//          chatId = row[0]["chat_id"];
//        } else {
//          chatId = new Uuid().v1();
//          GetIt.instance<DatabaseService>().execute(
//              "INSERT INTO _chat(chat_id, conversation_user) VALUES ('$chatId', '${document
//                  .data['uid']}')");
//        }
//
//        mapIdChat[chatId] = document;
//        if (mapIdChat.length == (documents.length - 1)) {
//    setState(() {
//      listChat = ListView.builder(
//        padding: EdgeInsets.all(10.0),
//        itemCount: mapIdChat.length,
//        itemBuilder: (context, index) {
//          return _chatCard(mapIdChat.keys.elementAt(index),
//              mapIdChat.values.elementAt(index).data);
//        },
//      );
//    });
//        }
//      });
//    });
  }

  @override
  Widget build(BuildContext context) {
    if (findingPsychologist) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14bed8),
          centerTitle: true,
          title: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: appImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff14bed8),
        drawer: const CustomDrawer(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else if (psychologists.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14bed8),
          centerTitle: true,
          title: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: appImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff14bed8),
        drawer: const CustomDrawer(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                child: const Text(
                  "Psicologos da Union",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 131,
                padding: const EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: psychologists.length,
                  itemBuilder: (context, index) {
                    return PsychologistCard(
                      online: false,
                      messageNumber: 1,
                      avatar: psychologists[index].avatar,
                      name: psychologists[index].name,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14bed8),
          centerTitle: true,
          title: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: appImage,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        backgroundColor: const Color(0xff14bed8),
        drawer: const CustomDrawer(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Opps... Infelizmente ainda não temos psicólogos "
              "cadastrados, que tal compartilhar o app para "
              "ajudar na divulgação?",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
  }
}

// Map parameter = {
//   "userAvatar": userData["avatar"],
//   "userName":
//       utf8.decode(userData["name"].toString().runes.toList()),
//   "userHash": userData["hash"]
//   "userIdTo": chatId,
//   "chatId": map["hash"],
//   "userImage": map["image"],
//   "userName": map["name"],
// };
// Navigator.pushNamed(context, chatRoute);