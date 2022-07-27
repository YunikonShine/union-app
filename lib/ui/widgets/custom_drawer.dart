// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get_it/get_it.dart';
// import 'package:share/share.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/ShareClient.dart';
// import 'package:union/db/DatabaseService.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/domain/enumerations/UserRole.dart';
// import 'package:union/client/Endpoints.dart';

import 'alert_dialog_message.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  // final User user;

  // CustomDrawer(this.user);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerColor(),
          Container(
            color: const Color(0xff14bed8),
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
                        // GetIt.instance<DatabaseService>().execute(
                        //     "UPDATE _auth SET enabled = 0 WHERE enabled = 1");
                        // cleanJWT();
                        AlertDialogMessage.showDialogMessage(
                          "Obrigado!",
                          "Muito obrigado por utilizar a Union, esperamos ter "
                              "alcançado as suas espectativas, esperamos que volte logo, até mais :)",
                          "OK",
                          context,
                          () {
                            // Navigator.pushNamedAndRemoveUntil(context, LoginRoute,
                            //     (Route<dynamic> route) => false);
                          },
                        );
                      },
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.pushNamed(
                      //   context,
                      //   ProfileRoute,
                      //   arguments: user,
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Center(
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/man_person.png"),
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
              const Padding(
                padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Text(
                  "Nome do usuário",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
//              Container(
//                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
//                width: 250.0,
//                height: 50.0,
//                child: RaisedButton(
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0)),
//                  color: Colors.white,
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.only(right: 10.0),
//                        child: Icon(
//                          FontAwesomeIcons.solidHeart,
//                          color: Colors.red,
//                        ),
//                      ),
//                      Text(
//                        "Compartilhar app",
//                        style: TextStyle(
//                          color: Color(0xff1b8dcb),
//                          fontSize: 18.0,
//                        ),
//                      ),
//                      Container(
//                        margin: EdgeInsets.only(left: 10.0),
//                        child: Icon(
//                          FontAwesomeIcons.solidHeart,
//                          color: Colors.red,
//                        ),
//                      ),
//                    ],
//                  ),
//                  onPressed: () {
//
//                  },
//                ),
//              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0, top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    // Share.share(
                    //     'Olá, nós somos a Union, que tal fazer parte desse novo projeto? ❤️❤️❤️ https://play.google.com/store/apps/details?id=br.com.byron.union');
                    // shareUpdate();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        FontAwesomeIcons.heart,
                        color: Color(0xff1b8dcb),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20.0),
                        child: const Text(
                          "Compartilhar app",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                child: GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.pushNamed(context, DonateRoute,
                      //     arguments: user);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Icon(
                          FontAwesomeIcons.moneyBill1,
                          color: Color(0xff1b8dcb),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20.0),
                          child: const Text(
                            "Doações",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              // user.userRole == UserRole.USER
              // ?
              Column(
                children: <Widget>[
                  const Text(
                    "Precisa de ajuda?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.pushNamed(context, CvvRoute,
                      //     arguments: user);
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/cvv.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              )
              // : Column(),
//              Padding(
//                padding: EdgeInsets.only(top: 10.0),
//                child: Text(
//                  "Encontrou algum erro, problema, ou tem alguma sugestão?",
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                  ),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 15.0),
//                width: 250.0,
//                height: 50.0,
//                child: RaisedButton(
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0)),
//                  color: Colors.white,
//                  child: Text(
//                    "Reporte de erros",
//                    style: TextStyle(
//                      color: Color(0xff1b8dcb),
//                      fontSize: 18.0,
//                    ),
//                  ),
//                  onPressed: () {
//                    Navigator.pushNamed(context, ErrorReportRoute,
//                        arguments: user);
//                  },
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 10.0),
//                child: GestureDetector(
//                  onTap: () {
//                    Navigator.pushNamed(context, ErrorReportRoute,
//                        arguments: user);
//                  },
//                  child: Text(
//                    "Reporte de erros",
//                    style: TextStyle(
//                      color: Color(0xff1b8dcb),
//                      fontSize: 18.0,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 10.0),
//                child: Text(
//                  "Gostaria de saber mais sobre os desenvolvedores?",
//                  style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 20.0,
//                  ),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 15.0),
//                width: 250.0,
//                height: 50.0,
//                child: RaisedButton(
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0)),
//                  color: Colors.white,
//                  child: Text(
//                    "Sobre o aplicativo",
//                    style: TextStyle(
//                      color: Color(0xff1b8dcb),
//                      fontSize: 18.0,
//                    ),
//                    textAlign: TextAlign.center,
//                  ),
//                  onPressed: () {
//                    Navigator.pushNamed(context, DevReportRoute,
//                        arguments: user);
//                  },
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 10.0),
//                child: GestureDetector(
//                  onTap: () {
//                    Navigator.pushNamed(context, DevReportRoute,
//                        arguments: user);
//                  },
//                  child: Text(
//                    "Sobre o aplicativo",
//                    style: TextStyle(
//                      color: Color(0xff1b8dcb),
//                      fontSize: 18.0,
//                      decoration: TextDecoration.underline,
//                    ),
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 15.0),
//                width: 75.0,
//                height: 30.0,
//                child: RaisedButton(
//                  shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(15.0)),
//                  color: Colors.red,
//                  child: Text(
//                    "Sair",
//                    style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 18.0,
//                    ),
//                  ),
//                  onPressed: () async {
//                    GetIt.instance<DatabaseService>().execute(
//                        "UPDATE _auth SET enabled = 0 WHERE enabled = 1");
//                    AlertDialogMessage.showDialogMessage(
//                        "Obrigado!",
//                        "Muito obrigado por utilizar a Union, esperamos ter "
//                            "alcançado as suas espectativas, esperamos que volte logo, até mais :)",
//                        "OK",
//                        context, () {
//                      Navigator.pushNamedAndRemoveUntil(
//                          context, LoginRoute, (Route<dynamic> route) => false);
//                    });
//                  },
//                ),
//              ),
//              GestureDetector(
//                onTap: (){
//                  Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => ThemeList()));
//                },
//                child: Padding(
//                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
//                  child: Row(
//                    children: <Widget>[
//                      Icon(
//                        FontAwesomeIcons.cogs,
//                        color: Colors.white,
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(left: 15.0),
//                        child: Text(
//                          "Configurações",
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 18.0,
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
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
            Color(0xff14bed8),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
