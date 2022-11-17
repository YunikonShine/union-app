import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:union/routes_names.dart';
import 'package:union/services/user_service.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/widgets/initial_icon.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final storage = const FlutterSecureStorage();
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    _start();
  }

  _start() async {
    await _initializeFirebase();
    _checkLogin();
  }

  _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  _checkLogin() async {
    String? token = await storage.read(key: "token");

    if (token == null || token.isEmpty) {
      _checkFirstOpen();
    } else {
      _getUserData();
    }
  }

  _checkFirstOpen() async {
    String? firstOpen = await storage.read(key: "firstOpen");
    if (firstOpen == null || firstOpen.isEmpty) {
      Navigator.pushReplacementNamed(context, firstViewRoute);
    } else {
      Navigator.pushReplacementNamed(context, loginRoute);
    }
  }

  _getUserData() async {
    bool userData = await userService.getUserData();
    if (userData) {
      Navigator.pushReplacementNamed(context, psychologistListRoute);
    } else {
      Navigator.pushReplacementNamed(context, loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryBlue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InitialIcon(
            iconImage: appImage,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 40,
            ),
            child: Center(
              child: LinearProgressIndicator(
                color: primaryBlue,
                backgroundColor: secundaryBlue,
                minHeight: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
