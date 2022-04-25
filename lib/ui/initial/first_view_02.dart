import 'package:flutter/material.dart';

class FirstView2 extends StatelessWidget {
  const FirstView2({Key? key}) : super(key: key);

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
            width: 260.0,
            height: 250.0,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/hands.png"),
                    fit: BoxFit.contain)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Column(
              children: const <Widget>[
                Text(
                  "A Union conecta",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "psicólogos voluntários",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "com pessoas que",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "precisam de auxílio",
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
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
