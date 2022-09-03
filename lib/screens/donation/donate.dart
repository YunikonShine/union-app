// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/widgets/custom_drawer.dart';
import 'package:union/util/no_glow_behavior.dart';
// import 'package:get_it/get_it.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/service/CallsAndMessagesService.dart';
// import 'package:union/ui/widgets/custom_drawer.dart';
// import 'package:union/util/NoGlowBehavior.dart';

class Donate extends StatelessWidget {
  const Donate({Key? key}) : super(key: key);

  // final User user;

  // Donate(this.user);

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics().setCurrentScreen(screenName: DonateRoute);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff14bed8),
        centerTitle: true,
        title: Container(
          width: 50.0,
          height: 50.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: appImage,
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
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: const Text(
                    "Doações",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                ),
                rowItens(
                    "1,00",
                    "3,00",
                    "5,00",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-5a0d5dfc-f68e-44f0-9803-cbcdc1adc896",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-9e92eedb-effa-4067-b13e-bf2e9405214e",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-a1226f00-3086-4f0c-8551-817c8e605a6b"),
                rowItens(
                    "10,00",
                    "15,00",
                    "20,00",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-f64b36d1-0956-41dd-9551-81252fe677ee",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-af61aa08-b836-4801-90ae-0e0c910da43d",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-b8033c1f-7ff8-4eb1-9de3-5411ad92d016"),
                rowItens(
                    "25,00",
                    "50,00",
                    "100,00",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-bbf33aef-b8fc-4b73-9e09-9f5e8cf28576",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-cafa22bd-6699-4694-ad10-c62b9b145e97",
                    "https://www.mercadopago.com.br/checkout/v1/redirect?pref_id=587559414-1a23208c-9a95-4c92-8b0d-715cac64e801"),
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: const Text(
                    "Para valores diferentes, envie um e-mail para byron.codes@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10.0,
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  child: const Text(
                    "O objetivo das doações não é ganhar dinheiro com o aplicativo, "
                    "mas sim mante-lô no ar, existem inúmeros gastos que temos "
                    "para manter o aplicativo funcionando para você e para todos, "
                    "caso não consiga ajudar financeiramente, você pode ajudar "
                    "compartilhando o aplicativo para amigos e familiares, e "
                    "isso já é de grande ajuda, pois assim atingiremos nosso "
                    "objetivo, ajudar o máximo de pessoas possíveis.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget rowItens(String value1, String value2, String value3, String link1,
      String link2, String link3) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            child: SizedBox(
              width: 88.0,
              child: Column(
                children: <Widget>[
                  const Icon(
                    FontAwesomeIcons.moneyBill,
                    color: Color(0xff1b8dcb),
                  ),
                  Text(
                    "R\$ $value1",
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff1b8dcb),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () async {
              // GetIt.instance<CallsAndMessagesService>().openUrl(link1);
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            child: SizedBox(
              width: 88.0,
              child: Column(
                children: <Widget>[
                  const Icon(
                    FontAwesomeIcons.moneyBill,
                    color: Color(0xff1b8dcb),
                  ),
                  Text(
                    "R\$ $value2",
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff1b8dcb),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () async {
              // GetIt.instance<CallsAndMessagesService>().openUrl(link2);
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
            ),
            child: SizedBox(
              width: 88.0,
              child: Column(
                children: <Widget>[
                  const Icon(
                    FontAwesomeIcons.moneyBill,
                    color: Color(0xff1b8dcb),
                  ),
                  Text(
                    "R\$ $value3",
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff1b8dcb),
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () async {
              // GetIt.instance<CallsAndMessagesService>().openUrl(link3);
            },
          ),
        ],
      ),
    );
  }
}
