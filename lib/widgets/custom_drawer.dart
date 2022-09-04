import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/model/user.dart';
import 'package:union/routes_names.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/util/constants/text_size.dart';
import 'package:union/widgets/default/default_drawer_button.dart';
import 'package:union/widgets/default/default_text.dart';

import 'alert_dialog_message.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final storage = const FlutterSecureStorage();

  final User user = User();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerColor(),
          Container(
            color: primaryBlue,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(right: 25.0),
                    margin: const EdgeInsets.only(top: 15.0),
                    width: 75.0,
                    height: 30.0,
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.arrowRightFromBracket),
                      color: Colors.red,
                      onPressed: () async {
                        storage.delete(key: "token");
                        storage.delete(key: "refreshToken");
                        AlertDialogMessage.showDialogMessage(
                          "Obrigado!",
                          "Muito obrigado por utilizar a Union, esperamos ter "
                              "alcançado as suas espectativas, esperamos que volte logo, até mais :)",
                          "OK",
                          context,
                          () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                loginRoute, (Route<dynamic> route) => false);
                          },
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, profileRoute);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/${user.avatar}"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 25.0),
                    margin: const EdgeInsets.only(top: 15.0),
                    width: 75.0,
                    height: 30.0,
                    child: IconButton(
                      icon: const Icon(FontAwesomeIcons.gear),
                      onPressed: () async {
                        // Navigator.pop(context);
                        // Navigator.pushNamed(
                        //   context,
                        //   ConfigRoute,
                        //   arguments: user,
                        // );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              DefaultDrawerButton(
                text: "Compartilhar App",
                icon: FontAwesomeIcons.heart,
                onTap: () {
                  // Share.share(
                  //     'Olá, nós somos a Union, que tal fazer parte desse novo projeto? ❤️❤️❤️ https://play.google.com/store/apps/details?id=br.com.byron.union');
                  // shareUpdate();
                },
              ),
              const DefaultDrawerButton(
                text: "Doações",
                icon: FontAwesomeIcons.moneyBill1,
                route: donateRoute,
              ),
              const DefaultDrawerButton(
                text: "Reporte de erros",
                icon: FontAwesomeIcons.exclamation,
                route: errorReportRoute,
              ),
              const DefaultDrawerButton(
                text: "Sobre o aplicativo",
                icon: FontAwesomeIcons.info,
                route: devAboutRoute,
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 25,
                ),
                child: Column(
                  children: [
                    DefaultText(
                      text: "Precisa de ajuda?",
                      size: TextSize.small,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, cvvRoute);
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: cvv,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDrawerColor() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryBlue,
            white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
