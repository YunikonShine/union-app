// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/routes_names.dart';
import 'package:union/util/constants/images.dart';
// import 'package:union/domain/CommonUser.dart';

class RegisterCommonUserAvatar extends StatefulWidget {
  const RegisterCommonUserAvatar({Key? key}) : super(key: key);

  @override
  _RegisterCommonUserAvatarState createState() =>
      _RegisterCommonUserAvatarState();
}

class _RegisterCommonUserAvatarState extends State<RegisterCommonUserAvatar> {
  @override
  void initState() {
    super.initState();
  }

  List<AssetImage> images = [manPerson, womanPerson];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
          child: Column(
            children: <Widget>[
              const Text(
                "Olá, tudo bem?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.red,
                    ),
                  ),
                  const Text(
                    "Agradecemos por usar a Union",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: const Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Text(
                "Vamos começar?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              const Text(
                "Que tal escolher um avatar?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: index == 0 ? Colors.white : Colors.transparent,
                          width: 5.0,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            150.0,
                          ),
                        ),
                        image: DecorationImage(
                          image: images[0],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 50.0),
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: index == 1 ? Colors.white : Colors.transparent,
                          width: 5.0,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            150.0,
                          ),
                        ),
                        image: DecorationImage(
                          image: images[1],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 250.0,
                height: 50.0,
                margin: const EdgeInsets.only(top: 50.0),
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
                  child: const Text(
                    "Próxima etapa >>",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff1b8dcb),
                    ),
                  ),
                  onPressed: () {
                    // CommonUser commonUser = CommonUser();
                    // commonUser.avatar = images[index];
                    Navigator.pushNamed(
                      context,
                      registerCommonBasicRoute,
                      // arguments: commonUser,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
