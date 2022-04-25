import 'package:flutter/material.dart';

class FirstView3 extends StatelessWidget {
  const FirstView3({Key? key}) : super(key: key);

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/dialog.png"),
                    fit: BoxFit.contain)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 25.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Vamos lá?",
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
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15.0)),
                    // color: const Color(0xff1b8dcb),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, LoginRoute);
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
                      )),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(15.0)),
                    // color: Colors.white,
                    child: const Text(
                      "Cadastre-se",
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Color(0xff1b8dcb),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, UserTypeRoute);
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
