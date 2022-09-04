// import 'dart:async';
// import 'dart:math';

// import 'package:firebase_analytics/firebase_analytics.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:union/model/user.dart';
import 'package:union/routes_names.dart';
import 'package:union/screens/initial/dots_indicator.dart';
import 'package:union/screens/initial/first_view_01.dart';
import 'package:union/screens/initial/first_view_02.dart';
import 'package:union/screens/initial/first_view_03.dart';
import 'package:union/services/user_service.dart';
// import 'package:get_it/get_it.dart';
// import 'package:permissions_plugin/permissions_plugin.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/Endpoints.dart';
// import 'package:union/db/DatabaseService.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/domain/enumerations/UserRole.dart';
// import 'package:union/firebase/GoogleService.dart';
// import 'package:union/service/Websocket.dart';
// import 'package:union/ui/inicial/first_view_01.dart';
// import 'package:union/ui/inicial/first_view_02.dart';
// import 'package:union/ui/inicial/first_view_03.dart';
// import 'package:union/ui/list/list_chat.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:union/util/Example_crype.dart';

// import 'Login.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    super.initState();

    // FirebaseAnalytics().setCurrentScreen(screenName: FirstViewRoute);
    //databaseService.dropDatabase();
    //ThemeUtil.preencherThemeColor();
    // Future<SharedPreferences> _prefsFuture = SharedPreferences.getInstance();
    // _prefsFuture.then((prefs) {
    //   setState(() {
    //     _prefs = prefs;
    //   });
    // });
    // initDB();
    // cleanJWT();
    //final pair = generateRSAkeyPair(getSecureRandom(), context);
  }

  // void initDB() async {
  //   await GetIt.instance<DatabaseService>().initDB();
  //   setState(() {});
  //   _isLogged();
  // }

  final _controller = PageController();

  // SharedPreferences _prefs;

  static const _kDuration = Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  bool permission = true;

  bool first = true;

  bool isLogged = false;

  bool isLoggedCheck = false;

  // void _isLogged() async {
  //   List<
  //       Map<String,
  //           dynamic>> rows = await GetIt.instance<DatabaseService>().execute(
  //       "SELECT * FROM _auth WHERE enabled = 1 ORDER BY creation_date DESC");
  //   if (rows.length > 0) {
  //     await login("", "", jwtDatabase: rows[0]["jwt"]);
  //     setState(() {
  //       isLogged = true;
  //       isLoggedCheck = true;
  //     });
  //   } else {
  //     setState(() {
  //       isLoggedCheck = true;
  //     });
  //   }
  // }

  // void configPermission() {
  //   if (permission || !first) return;
  //   first = false;
  //   PermissionsPlugin.checkPermissions([
  //     Permission.WRITE_EXTERNAL_STORAGE,
  //     Permission.READ_EXTERNAL_STORAGE,
  //   ]).then((permissionChecked) {
  //     if (permissionChecked[Permission.WRITE_EXTERNAL_STORAGE] !=
  //             PermissionState.GRANTED ||
  //         permissionChecked[Permission.READ_EXTERNAL_STORAGE] !=
  //             PermissionState.GRANTED) {
  //       PermissionsPlugin.requestPermissions([
  //         Permission.WRITE_EXTERNAL_STORAGE,
  //         Permission.READ_EXTERNAL_STORAGE,
  //       ]).then((permission) {
  //         if (permission[Permission.WRITE_EXTERNAL_STORAGE] ==
  //                 PermissionState.GRANTED &&
  //             permission[Permission.READ_EXTERNAL_STORAGE] ==
  //                 PermissionState.GRANTED) {
  //           setState(() {
  //             this.permission = true;
  //           });
  //         } else {
  //           AlertDialogMessage.showDialogMessage(
  //               "Oops...",
  //               "Para continuar você precisa dar essa permissão :(",
  //               "OK",
  //               context, () {
  //             Navigator.pop(context);
  //             setState(() {
  //               first = true;
  //             });
  //           });
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         this.permission = true;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // if (!permission) {
    //   configPermission();
    //   return Scaffold(
    //     backgroundColor: Color(0xff14bed8),
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: const <Widget>[
    //             CircularProgressIndicator(),
    //           ],
    //         )
    //       ],
    //     ),
    //   );
    // } else if (GetIt.instance<DatabaseService>().databaseIsNull() ||
    //     _prefs == null) {
    //   return Scaffold(
    //     backgroundColor: Color(0xff14bed8),
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: const <Widget>[
    //             CircularProgressIndicator(),
    //           ],
    //         )
    //       ],
    //     ),
    //   );
    // } else if (!isLoggedCheck) {
    //   return Scaffold(
    //     backgroundColor: Color(0xff14bed8),
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: const <Widget>[
    //             CircularProgressIndicator(),
    //           ],
    //         )
    //       ],
    //     ),
    //   );
    // } else if (isLogged) {
    //   return ListChat(getUserLogged());
    // } else if (_prefs.getBool("welcome") != null &&
    //     !_prefs.getBool("welcome")) {
    //   return Login();
    // }
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: Stack(
        children: <Widget>[
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: _controller,
            children: const <Widget>[
              FirstView1(),
              FirstView2(),
              FirstView3(),
            ],
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: DotsIndicator(
                  controller: _controller,
                  itemCount: 3,
                  onPageSelected: (int page) {
                    _controller.animateToPage(
                      page,
                      duration: _kDuration,
                      curve: _kCurve,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
