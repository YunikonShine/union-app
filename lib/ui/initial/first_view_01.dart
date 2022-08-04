import 'package:flutter/material.dart';
import 'package:union/const/colors.dart';
import 'package:union/const/images.dart';
import 'package:union/const/text_size.dart';
import 'package:union/const/texts.dart';
import 'package:union/ui/widgets/default/default_container.dart';
import 'package:union/ui/widgets/default/default_text.dart';
import 'package:union/ui/widgets/initial_icon.dart';

class FirstView1 extends StatelessWidget {
  const FirstView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const InitialIcon(
            iconImage: appImage,
          ),
          DefaultContainer(
            childrenList: <Widget>[
              DefaultText(
                text: initialText1,
                size: TextSize.big,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
