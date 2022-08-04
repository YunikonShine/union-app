// import 'dart:io';

import 'package:email_validator/email_validator.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/UserClient.dart';
import 'package:union/widgets/alert_dialog_message.dart';
import 'package:union/widgets/default/default_text_field.dart';
// import 'package:http/http.dart' as http;

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  _PasswordRecoveryState createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(screenName: PasswordRecoveryRoute);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
                right: 20.0,
                left: 20.0,
                top: MediaQuery.of(context).size.height * 0.1),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 80.0),
                  width: 130.0,
                  height: 130.0,
                  child: const Icon(
                    FontAwesomeIcons.key,
                    size: 100.0,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "É normal as vezes esquecermos das coisas",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Mas é só escrever o seu e-mail aqui e mandaremos "
                  "uma nova senha pra você",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Theme(
                  data: ThemeData(
                    hintColor: const Color(0xffffffff),
                    primaryColor: const Color(0xffffffff),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: DefaultTextField(
                      title: "E-mail",
                      controller: emailController,
                      focus: emailFocus,
                      inputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "O e-mail é obrigatório";
                        } else if (!EmailValidator.validate(value)) {
                          return "Insira um e-email válido";
                        }
                        return null;
                      },
                      maxLength: 255,
                      nextFocus: FocusNode(),
                      suffixIcon: const SizedBox(),
                      textInputFormatter: const [],
                    ),
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    child: const Text(
                      "Recuperar senha",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff1b8dcb),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        AlertDialogMessage.showLoading(context);
                        // http.Response response =
                        //     await passwordRecovery(emailController.text);
                        // Navigator.pop(context);
                        // if (response.statusCode == HttpStatus.noContent) {
                        AlertDialogMessage.showDialogMessage(
                            "Sucesso!!!",
                            "Caso este e-mail exista em nosso sistema, "
                                "enviaremos um conteúdo para recuperação",
                            "OK",
                            context, () {
                          // Navigator.pushNamedAndRemoveUntil(context,
                          //     LoginRoute, (Route<dynamic> route) => false);
                        });
                        // } else {
                        //   AlertDialogMessage.showDialogMessage(
                        //       "Opps...",
                        //       "Nos desculpe, parece que tivemos problemas "
                        //           "com o nosso sistema, tente novamente mais tarde",
                        //       "OK",
                        //       context, () {
                        //     Navigator.pop(context);
                        //   });
                      }
                      // }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
