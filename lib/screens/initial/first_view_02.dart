import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/util/constants/text_size.dart';
import 'package:union/util/constants/texts.dart';
import 'package:union/widgets/default/default_container.dart';
import 'package:union/widgets/default/default_text.dart';
import 'package:union/widgets/initial_icon.dart';

class FirstView2 extends StatelessWidget {
  const FirstView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const InitialIcon(
            iconImage: hands,
          ),
          DefaultContainer(
            childrenList: <Widget>[
              DefaultText(
                text: initialText2,
                size: TextSize.big,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
