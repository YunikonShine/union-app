// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/PersonClient.dart';
// import 'package:union/service/CallsAndMessagesService.dart';
// import 'package:http/http.dart' as http;
// import 'package:union/ui/widgets/GodparentsRow.dart';

class DevAbout extends StatefulWidget {
  const DevAbout({Key? key}) : super(key: key);

  @override
  _DevAboutState createState() => _DevAboutState();
}

class _DevAboutState extends State<DevAbout> {
  bool hasNames = false;
  List<Widget> godparents = [];
  List<Widget> namesWidget = [];

  @override
  void initState() {
    super.initState();
    // getNames();
  }

  // getNames() async {
  //   http.Response response = await getPerson();
  //   print(response.statusCode);
  //   List<dynamic> names = json.decode(response.body);
  //   for (int i = 0; i < names.length; i++) {
  //     namesWidget.add(Container(
  //       width: MediaQuery.of(context).size.width * 0.25,
  //       child: Text(
  //         names[i]["name"],
  //         style: TextStyle(
  //           color: Colors.white,
  //           fontSize: 18.0,
  //         ),
  //         textAlign: TextAlign.center,
  //       ),
  //     ));
  //     if (i % 3 == 0 || i == names.length) {
  //       if (namesWidget.length == 1) {
  //         godparents.insert(
  //             0,
  //             GodParentsRow(
  //               one: namesWidget[0],
  //               two: Container(),
  //               three: Container(),
  //             ));
  //       } else if (namesWidget.length == 2) {
  //         godparents.insert(
  //             0,
  //             GodParentsRow(
  //               one: namesWidget[0],
  //               two: namesWidget[1],
  //               three: Container(),
  //             ));
  //       } else if (namesWidget.length == 3) {
  //         godparents.insert(
  //             0,
  //             GodParentsRow(
  //               one: namesWidget[0],
  //               two: namesWidget[1],
  //               three: namesWidget[2],
  //             ));
  //       }
  //       namesWidget.clear();
  //     }
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics().setCurrentScreen(screenName: DevReportRoute);
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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            right: MediaQuery.of(context).size.width * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: const Text(
                  "Desenvolvedores",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      150.0,
                    ),
                  ),
                  image: DecorationImage(
                    image: AssetImage("images/vinicius.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  "Vinícius Moreira Lima de Moraes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // GetIt.instance<CallsAndMessagesService>().openUrl(
                    //     "https://www.linkedin.com/in/vinicius-moreira-moraes/");
                  },
                  child: const Text(
                    "LinkedIn",
                    style: TextStyle(
                      color: Color(0xff1b8dcb),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      150.0,
                    ),
                  ),
                  image: DecorationImage(
                    image: AssetImage("images/amanda.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: const Text(
                  "Amanda Almeida Zingareli",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {
                    // GetIt.instance<CallsAndMessagesService>().openUrl(
                    //     "https://www.linkedin.com/in/amanda-zingareli/");
                  },
                  child: const Text(
                    "LinkedIn",
                    style: TextStyle(
                      color: Color(0xff1b8dcb),
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 25.0),
                child: const Text(
                  "Padrinhos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Column(children: godparents),
            ],
          ),
        ),
      ),
    );
  }
}
