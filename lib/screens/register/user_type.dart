// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:union/routes_names.dart';

class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(screenName: UserTypeRoute);
    // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // _prefs.then((prefs) {
    //   prefs.setBool("welcome", false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
            width: 130.0,
            height: 130.0,
            child: const Icon(
              FontAwesomeIcons.users,
              size: 100.0,
              color: Colors.white,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Qual seu tipo de usuário?",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40.0),
                  width: 250.0,
                  height: 65.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff1b8dcb),
                      ),
                    ),
                    child: const Text(
                      "Comum",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, registerCommonAvatarRoute);
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                  child: const Text(
                    "ou",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  width: 250.0,
                  height: 65.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: const Text(
                      "Psicólogo",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xff1b8dcb),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, registerPsychologistAvatarRoute);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
