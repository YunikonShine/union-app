import 'package:flutter/material.dart';
import 'package:union/constants/border_radius_size.dart';
import 'package:union/constants/colors.dart';
import 'package:union/constants/images.dart';
import 'package:union/constants/text_size.dart';
import 'package:union/constants/texts.dart';

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
              DefaultText(
                text: initialText3,
                size: TextSize.big,
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
                  borderRadius: BorderRadiusSize.normal,
                  textSize: TextSize.normal,
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
                child: DefaultText(
                  text: "ou",
                  size: TextSize.big,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 250.0,
                height: 65.0,
                child: DefaultButton(
                  backgroundColor: white,
                  borderRadius: BorderRadiusSize.normal,
                  text: "Cadastre-se",
                  textSize: TextSize.normal,
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
