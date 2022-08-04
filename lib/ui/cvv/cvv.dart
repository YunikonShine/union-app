// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/widgets/custom_drawer.dart';

// import 'package:get_it/get_it.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/service/CallsAndMessagesService.dart';
// import 'package:union/ui/widgets/custom_drawer.dart';
import 'package:union/util/no_glow_behavior.dart';

class Cvv extends StatelessWidget {
  const Cvv({Key? key}) : super(key: key);

  // final User user;
  // Cvv(this.user);

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics().setCurrentScreen(screenName: CvvRoute);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14bed8),
        centerTitle: true,
        title: Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/union.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff14bed8),
      drawer: const CustomDrawer(),
      body: ScrollConfiguration(
        behavior: NoGlowBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // GetIt.instance<CallsAndMessagesService>()
                        //     .openUrl("https://www.cvv.org.br/");
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
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "O CVV – Centro de Valorização da Vida realiza apoio "
                        "emocional e prevenção do suicídio, atendendo voluntária "
                        "e gratuitamente todas as pessoas que querem e precisam "
                        "conversar, sob total sigilo por telefone, email e "
                        "chat 24 horas todos os dias.",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 100.0,
                        margin: const EdgeInsets.only(top: 25.0),
                        child: GestureDetector(
                            onTap: () {
                              // GetIt.instance<CallsAndMessagesService>()
                              //     .call("188");
                            },
                            child: Column(
                              children: const <Widget>[
                                Icon(
                                  FontAwesomeIcons.phone,
                                  size: 50.0,
                                  color: Color(0xFF662C96),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    "Telefone",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ))),
                    Container(
                      width: 100.0,
                      margin: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                          onTap: () {
                            // GetIt.instance<CallsAndMessagesService>()
                            //     .openUrl("https://www.cvv.org.br/chat/");
                          },
                          child: Column(
                            children: const <Widget>[
                              Icon(
                                FontAwesomeIcons.solidComments,
                                size: 50.0,
                                color: Color(0xFF915CA7),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Text(
                                  "Mensagem",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Container(
                      width: 100.0,
                      margin: const EdgeInsets.only(top: 25.0),
                      child: GestureDetector(
                        onTap: () {
                          // GetIt.instance<CallsAndMessagesService>()
                          //     .openUrl("https://www.cvv.org.br/e-mail/");
                        },
                        child: Column(
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.solidEnvelope,
                              size: 50.0,
                              color: Color(0xFFC9B1D9),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text(
                                "E-mail",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        // GetIt.instance<CallsAndMessagesService>().openUrl(
                        //     "https://www.cvv.org.br/postos-de-atendimento/");
                      },
                      child: Column(
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.mapLocation,
                            size: 50.0,
                            color: Color(0xff1B8DCB),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Postos de atendimento",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "Nestes canais, são realizados mais de 2 milhões de "
                        "atendimentos anuais, por aproximadamente 3.400 "
                        "voluntários, localizados em 24 estados mais o "
                        "Distrito Federal. Além dos atendimentos, o "
                        "CVV desenvolve, em todo o país, outras atividades "
                        "relacionadas a apoio emocional, com ações abertas "
                        "à comunidade que estimulam o autoconhecimento e "
                        "melhor convivência em grupo e consigo mesmo. "
                        "Cada vez mais o CVV está precisando de voluntários "
                        "para poder ajudar esta causa, que tal doar um "
                        "pouco do seu tempo para um bem maior?",
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      width: 300.0,
                      height: 65.0,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff1B8DCB),
                          ),
                        ),
                        child: const Text(
                          "Quero ser voluntário",
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          // GetIt.instance<CallsAndMessagesService>()
                          //     .openUrl("https://www.cvv.org.br/voluntario/");
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
