//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:union/model/holder/object_holder.dart';
import 'package:union/model/psychologist.dart';
import 'package:union/services/firebase_chat.dart';
import 'package:union/util/constants/images.dart';
// import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
// import 'package:stomp/stomp.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/Endpoints.dart';
// import 'package:union/client/MessageClient.dart';
// import 'package:union/client/UserClient.dart';
// import 'package:union/db/DatabaseService.dart';
// import 'package:union/service/Websocket.dart';
// import 'package:union/util/Crypt.dart';
// import 'package:union/util/Example_crype.dart';
// import 'package:http/http.dart' as http;

//import 'package:get_it/get_it.dart';
//import 'package:union/firebase/Firestore.dart';
//import 'package:union/firebase/GoogleService.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
//  String userIdTo;
//  String chatId;
  final AssetImage userAvatar = manPerson;
  final String userName = "Nome";
  final String userHash = "123123123";

//   ChatScreen(Map<dynamic, dynamic> map) {
// //    this.userIdTo = map["userIdTo"];
// //    this.chatId = map["chatId"];
//     this.userAvatar = map["userAvatar"];
//     this.userName = map["userName"];
//     this.userHash = map["userHash"];
//   }

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final Psychologist psychologist = ObjectHolder.currentChat!;

  // final AssetImage userAvatar = manPerson;
  // final String userName = "Nome";
  // String userPublicKey = "key";
  // final String userHash = "123123123";
  List<Widget> chatMessages = [];

//  final String chatId;
//  final String userIdTo;

  // _ChatScreenState(this.userAvatar, this.userName, this.userHash);

  // _getPublicKey() async {
  //   http.Response response = await getPublicKey(userHash);
  //   print(response.body);
  //   setState(() {
  //     userPublicKey = response.body;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(screenName: ChatRoute);
    getMessages();
    // _getPublicKey();
    // connect(wsEndpoint).then((stompClient) {
    //   setState(() {
    //     _stompClient = stompClient;
    //   });
    //   stompClient
    //       .subscribeString(userHash, "/chat/message/${getUserLogged().hash}",
    //           (Map<String, String> headers, String message) {
    //     if (headers["from"] == userHash) {
    //       try {
    //         String messageDecrypted = Crypt.decryptMessage(message);
    //         setState(() {
    //           chatMessages
    //               .add(_chatMessages(messageDecrypted, headers["from"]));
    //           scrollController
    //               .jumpTo(scrollController.position.maxScrollExtent);
    //         });
    //       } catch (e) {}
    //     }
    //   });
    // }, onError: (error) {
    //   print("connect failed");
    // });
  }

  FocusNode inputFieldNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  // StompClient _stompClient;
  bool allMessages = false;
  ScrollController scrollController = ScrollController();

  void getMessages() async {
    // List<
    //     Map<String,
    //         dynamic>> rows = await GetIt.instance<DatabaseService>().execute(
    //     "SELECT * FROM _message WHERE (hash_from = '${getUserLogged().hash}' AND hash_to = '$userHash') OR (hash_from = '$userHash' AND hash_to = '${getUserLogged().hash}') ORDER BY creation_date ASC;");
    // for (int i = 0; i < rows.length; i++) {
    //   chatMessages.add(_chatMessages(rows[i]["message"], rows[i]["hash_from"]));
    // }
    setState(() {
      allMessages = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom > 0) {
      Timer(
          const Duration(milliseconds: 100),
          () => scrollController
              .jumpTo(scrollController.position.maxScrollExtent));
    }

    if (allMessages) {
      Timer(
          const Duration(milliseconds: 100),
          () => scrollController
              .jumpTo(scrollController.position.maxScrollExtent + 1));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14bed8),
        title: Row(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage("assets/images/${psychologist.avatar}"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                psychologist.name,
                overflow: TextOverflow.fade,
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body:
          // _stompClient == null || !allMessages || userPublicKey == null
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom > 0
                  ? MediaQuery.of(context).size.height * 0.78 -
                      MediaQuery.of(context).viewInsets.bottom
                  : MediaQuery.of(context).size.height * 0.78,
              child: ListView.builder(
                controller: scrollController,
                reverse: false,
                padding:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                itemCount: chatMessages.length,
                itemBuilder: (context, index) {
                  return chatMessages[index];
                },
              ),
            ),
            Container(
              //height: 60.0,
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffdbdbdb),
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(50.0),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Theme(
                      data: ThemeData(
                        hintColor: Colors.black,
                        primaryColor: Colors.black,
                      ),
                      child: TextField(
                        controller: textEditingController,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Digite sua mensagem aqui...",
                        ),
                        focusNode: inputFieldNode,
                        onSubmitted: (text) async {
                          inputFieldNode.requestFocus();
                          await _sendMessage(text);
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.subdirectory_arrow_right,
                      color: Color(0xffdbdbdb),
                    ),
                    onPressed: () async {
                      await _sendMessage(textEditingController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    inputFieldNode.dispose();
    // if (_stompClient != null) {
    //   _stompClient.disconnect();
    // }
    // FocusScope.of(context).unfocus();
    super.dispose();
  }

  Future _sendMessage(String text) async {
    await FirebaseChat.sendMessage(psychologist.hash, text);
    // setState(() {
    //   chatMessages.add(_chatMessages(text, getUserLogged().hash));
    //   scrollController.jumpTo(scrollController.position.maxScrollExtent);
    //   textEditingController.clear();
    // });
    // int date = DateTime.now().millisecondsSinceEpoch;
    // String cryptedMessage = Crypt.encryptMessage(text, userPublicKey);
    // GetIt.instance<DatabaseService>().execute(
    //     "INSERT INTO _message(message, hash_from, hash_to, creation_date) VALUES(?, '${getUserLogged().hash}', '$userHash', $date);",
    //     arguments: [text]);
    // http.Response response = await sendMessage(userHash, cryptedMessage,
    //     date.toString(), getUserLogged().name, getUserLogged().avatar);
    // Map<String, String> headers = Map();
    // headers["from"] = getUserLogged().hash;
    // headers["date"] = date.toString();
    // headers["name"] = getUserLogged().name;
    // headers["avatar"] = getUserLogged().avatar;
    // headers["jwt-token"] = getJWT();
    // headers["message-id"] = response.body;
    // _stompClient.sendString("/chat/message/$userHash", cryptedMessage,
    //     headers: headers);
  }

  Widget _chatMessages(String message, String from) {
    Alignment align = Alignment.centerLeft;
    MainAxisAlignment alignRow = MainAxisAlignment.end;
    Color backColor = const Color(0xff14bed8);
    Color textColor = Colors.white;

    // if (from == getUserLogged().hash) {
    //   backColor = const Color(0xff14bed8);
    //   textColor = Colors.white;
    //   align = Alignment.centerRight;
    //   alignRow = MainAxisAlignment.end;
    // } else {
    backColor = const Color(0xffdbdbdb);
    textColor = Colors.black;
    align = Alignment.centerLeft;
    alignRow = MainAxisAlignment.start;
    // }

    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            alignment: align,
            padding: const EdgeInsets.only(top: 10.0),
            child: Wrap(
              children: <Widget>[
                Container(
                  constraints: const BoxConstraints(maxWidth: 250.0),
                  decoration: BoxDecoration(
                    color: backColor,
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  //width: 250.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          message != null ? message : "",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
//          Row(
//            mainAxisAlignment: alignRow,
//            children: <Widget>[
//              Text(
//                map["hour"] != null ? map["hour"] : "",
//                style: TextStyle(
//                  fontSize: 12.0,
//                  color: Colors.grey,
//                ),
//                textAlign: TextAlign.end,
//              ),
//            ],
//          )
        ],
      ),
    );
  }
}
