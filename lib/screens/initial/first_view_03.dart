import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';

import 'package:union/routes_names.dart';
import 'package:union/widgets/default/default_button.dart';
import 'package:union/widgets/initial_icon.dart';

class FirstView3 extends StatelessWidget {
  const FirstView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const InitialIcon(
            iconImage: dialog,
            mini: true,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Vamos lá?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                DefaultButton(
                  margin: const EdgeInsets.only(top: 40.0),
                  width: 250.0,
                  height: 65.0,
                  backgroundColor: secundaryBlue,
                  text: "Login",
                  textSize: 25,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, loginRoute);
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                  child: const Text(
                    "ou",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      height: 1.3,
                    ),
                  ),
                ),
                DefaultButton(
                  width: 250.0,
                  height: 65.0,
                  backgroundColor: Colors.white,
                  text: "Cadastre-se",
                  textSize: 25,
                  textColor: secundaryBlue,
                  onPressed: () {
                    Navigator.pushNamed(context, registerCommonAvatarRoute);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
