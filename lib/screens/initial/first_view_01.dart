import 'package:flutter/material.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/widgets/initial_icon.dart';

class FirstView1 extends StatelessWidget {
  const FirstView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const InitialIcon(
            iconImage: appImage,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
            child: Column(
              children: const <Widget>[
                Text(
                  "Olá! Somos a Union, um grupo independente que tem como objetivo ajudar as pessoas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    height: 1.3,
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
