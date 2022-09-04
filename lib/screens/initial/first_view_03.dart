import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';

import 'package:union/routes_names.dart';
import 'package:union/widgets/default/default_button.dart';
import 'package:union/widgets/default/default_container.dart';
import 'package:union/widgets/default/default_text.dart';
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
          DefaultContainer(
            childrenList: <Widget>[
              const DefaultText(
                text: "Vamos lá?",
                size: 30,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 40.0,
                ),
                width: 250.0,
                height: 65.0,
                child: DefaultButton(
                  backgroundColor: secundaryBlue,
                  text: "Login",
                  borderRadius: 15,
                  textSize: 25,
                  onPressed: () {
                    Navigator.pushNamed(context, loginRoute);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 10.0,
                ),
                child: const DefaultText(
                  text: "ou",
                  size: 30,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 250.0,
                height: 65.0,
                child: DefaultButton(
                  backgroundColor: Colors.white,
                  borderRadius: 15,
                  text: "Cadastre-se",
                  textSize: 25,
                  textColor: secundaryBlue,
                  onPressed: () {
                    Navigator.pushNamed(context, userTypeRoute);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
