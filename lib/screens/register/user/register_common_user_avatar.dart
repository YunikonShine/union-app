import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/model/user.dart';
import 'package:union/routes_names.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/widgets/default/default_button.dart';

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

  User user = User();

  List<String> images = ["man_person.png", "woman_person.png"];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
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
                          image: AssetImage("assets/images/${images[0]}"),
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
                          image: AssetImage("assets/images/${images[1]}"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DefaultButton(
                text: "Próxima etapa >>",
                margin: const EdgeInsets.only(top: 50),
                onPressed: () {
                  user.avatar = images[index];
                  // CommonUser commonUser = CommonUser();
                  // commonUser.avatar = images[index];
                  Navigator.pushNamed(
                    context,
                    registerCommonBasicRoute,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
