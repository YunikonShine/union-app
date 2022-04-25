import 'package:flutter/material.dart';

class FirstView1 extends StatelessWidget {
  const FirstView1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              width: 260.0,
              height: 200.0,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/union.png"),
                      fit: BoxFit.contain)),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
              child: Column(
                children: const <Widget>[
                  Text(
                    "Olá! Somos a Union",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "um grupo independente",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "que tem como objetivo",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "ajudar as pessoas",
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
      ),
    );
  }
}
