//import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:convert';

// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:union/routes_names.dart';
// import 'package:stomp/stomp.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/Endpoints.dart';
// import 'package:union/client/MessageClient.dart';
// import 'package:union/client/PsychologistClient.dart';
// import 'package:union/db/DatabaseService.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/domain/enumerations/UserRole.dart';
// import 'package:union/service/NotificationService.dart';
// import 'package:union/service/Websocket.dart';
import 'package:union/ui/widgets/custom_drawer.dart';
// import 'package:union/util/Crypt.dart';

class ListChat extends StatefulWidget {
  const ListChat({Key? key}) : super(key: key);

  @override
  _ListChatState createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> with WidgetsBindingObserver {
  Widget listChat = const Center(
    child: CircularProgressIndicator(),
  );
  // StompClient _stompClient;
  bool allMessages = true;
  Map<String, int> messageQuantity = {};

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
    // super.dispose();
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
    if (!allMessages) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14bed8),
          centerTitle: true,
          title: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/union.png"),
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
    } else if (true) {
      // Future<http.Response> response = findAllPsychologist();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14bed8),
          centerTitle: true,
          title: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/union.png"),
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
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 131,
                padding: const EdgeInsets.only(top: 10.0),
                child:
                    // FutureBuilder<http.Response>(
                    //     future: response,
                    //     builder: (context, snapshot) {
                    //       switch (snapshot.connectionState) {
                    //         case ConnectionState.none:
                    //         case ConnectionState.waiting:
                    //           return const Center(
                    //             child: CircularProgressIndicator(),
                    //           );
                    //         default:
                    // List<dynamic> mapResponse =
                    //     json.decode(snapshot.data.body);
                    // if (_stompClient == null) {
                    //   return const Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // } else
                    // if (mapResponse.isEmpty) {
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: const <Widget>[
                    //     Text(
                    //       "Opps... Infelizmente ainda não temos psicólogos "
                    //       "cadastrados, que tal compartilhar o app para "
                    //       "ajudar na divulgação?",
                    //       style: TextStyle(
                    //         fontSize: 18.0,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ],
                    // ),
                    // } else {
                    //   return
                    ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return _chatCard();
                  },
                ),
                // }
                //   }
                // }),
//                StreamBuilder(
//                  stream: Firestore.instance.collection("users").snapshots(),
//                  builder: (context, snapshot) {
//                    switch (snapshot.connectionState) {
//                      case ConnectionState.none:
//                      case ConnectionState.waiting:
//                        return Center(
//                          child: CircularProgressIndicator(),
//                        );
//                      default:
//                        return listChat;
//                    }
//                  },
//                ),
              ),
            ],
          ),
        ),
      );
    } else {
      // _testQuery();
      // Future<List<Map<dynamic, dynamic>>> rows =
      //     GetIt.instance<DatabaseService>()
      //         .execute("SELECT * FROM _common_user");
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff14bed8),
          centerTitle: true,
          title: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/union.png"),
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
                height: MediaQuery.of(context).size.height - 131,
                padding: const EdgeInsets.only(top: 10.0),
                child:
                    // FutureBuilder<List>(
                    //     future: rows,
                    //     builder: (context, snapshot) {
                    //       switch (snapshot.connectionState) {
                    //         case ConnectionState.none:
                    //         case ConnectionState.waiting:
                    //           return const Center(
                    //             child: CircularProgressIndicator(),
                    //           );
                    //         default:
                    //           if (_stompClient == null) {
                    //             return const Center(
                    //               child: CircularProgressIndicator(),
                    //             );
                    //           } else {
                    //             if (snapshot.data.isEmpty) {
                    //               return
                    Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Você não tem nenhuma mensagem",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                //         } else {
                //           return ListView.builder(
                //             padding: const EdgeInsets.all(10.0),
                //             itemCount: snapshot.data.length,
                //             itemBuilder: (context, index) {
                //               return _chatCard(snapshot.data[index]);
                //             },
                //           );
                //         }
                //       }
                //   }
                // }),
//                StreamBuilder(
//                  stream: Firestore.instance.collection("users").snapshots(),
//                  builder: (context, snapshot) {
//                    switch (snapshot.connectionState) {
//                      case ConnectionState.none:
//                      case ConnectionState.waiting:
//                        return Center(
//                          child: CircularProgressIndicator(),
//                        );
//                      default:
//                        return listChat;
//                    }
//                  },
//                ),
              ),
            ],
          ),
        ),
      );
    }
  }

//   _testQuery() async {
//     List<Map<dynamic, dynamic>> rows = await GetIt.instance<DatabaseService>()
//         .execute("SELECT * FROM _common_user");
// //    print(rows.length);
//   }

  Widget _chatCard() {
    //bool online = map["online"];
    //TODO quantidade de mensagens do usuário
    int messageQuantityUser = 0;
    //     messageQuantity[userData["hash"].toString()] != null
    //         ? messageQuantity[userData["hash"].toString()]
    //         : 0;
    // messageQuantity[userData["hash"].toString()] = 0;
//    Color onlineColor = Colors.red;
//    switch (map["online"]) {
//      case 0:
//        onlineColor = Colors.green;
//        break;
//      case 1:
//        onlineColor = Colors.red;
//        break;
//      default:
//        onlineColor = Colors.yellow;
//        break;
//    }
//    if (index == 0) {
//      return Column(
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Expanded(
//                child: Divider(
//                  color: Colors.white,
//                ),
//              ),
//              Text(
//                "Atual",
//                style: TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//              Expanded(
//                child: Divider(
//                  color: Colors.white,
//                ),
//              ),
//            ],
//          ),
//          GestureDetector(
//            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => ChatScreen()));
//            },
//            child: Container(
//              color: Color(0xff14bed8),
//              child: Padding(
//                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
//                child: Row(
//                  children: <Widget>[
//                    Container(
//                      width: 60.0,
//                      height: 60.0,
//                      decoration: BoxDecoration(
//                        shape: BoxShape.circle,
//                        image: DecorationImage(
//                            image: AssetImage(mainPicture()),
//                            fit: BoxFit.cover),
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(left: 10.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.only(bottom: 2.0),
//                            child: Text(
//                              mainName(),
//                              style: TextStyle(
//                                  fontSize: 18.0,
//                                  fontWeight: FontWeight.bold,
//                                  color: Colors.white),
//                            ),
//                          ),
//                          Container(
//                            padding: EdgeInsets.only(top: 2.0),
//                            child: Text(
//                              "Ultima mensagem",
//                              style: TextStyle(
//                                fontSize: 16.0,
//                                color: Colors.white,
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//          Row(
//            children: <Widget>[
//              Expanded(
//                child: Divider(
//                  color: Colors.white,
//                ),
//              ),
//              Text(
//                "Outros",
//                style: TextStyle(
//                  color: Colors.white,
//                ),
//              ),
//              Expanded(
//                child: Divider(
//                  color: Colors.white,
//                ),
//              ),
//            ],
//          ),
//        ],
//      );
//    } else {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
//             Map parameter = {
//               "userAvatar": userData["avatar"],
//               "userName":
//                   utf8.decode(userData["name"].toString().runes.toList()),
//               "userHash": userData["hash"]
// //              "userIdTo": chatId,
// //              "chatId": map["hash"],
// //              "userImage": map["image"],
// //              "userName": map["name"],
//             };
            Navigator.pushNamed(context, chatRoute);
          },
          child: Container(
            color: const Color(0xff14bed8),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("images/man_person.png"),
                                    //image: AssetImage(imageList(index)),
                                    fit: BoxFit.cover),
                              ),
                            ),
//                            online
//                                ? Positioned(
//                                    child: Container(
//                                      width: 20.0,
//                                      height: 20.0,
//                                      decoration: BoxDecoration(
//                                        color: Colors.green,
//                                        borderRadius: BorderRadius.all(
//                                          Radius.circular(
//                                            150.0,
//                                          ),
//                                        ),
//                                        border: Border.all(
//                                          color: Colors.white,
//                                          width: 2.0,
//                                        ),
//                                      ),
//                                    ),
//                                  )
//                                : Container()
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: const Text(
                                  // utf8.decode(userData["name"]
                                  //     .toString()
                                  //     .runes
                                  //     .toList()),
                                  "Psicologo nome",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.fade,
                                  maxLines: 1,
                                  softWrap: false,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.09,
                    margin: const EdgeInsets.only(top: 40.0),
                    child: messageQuantityUser > 0
                        ? Container(
                            width: 50.0,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  150.0,
                                ),
                              ),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            child: Text(
                              messageQuantityUser > 99
                                  ? "+99"
                                  : messageQuantityUser.toString(),
                              style: const TextStyle(
                                color: Color(0xff1b8dcb),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
        )
      ],
    );
  }
//  }
}
