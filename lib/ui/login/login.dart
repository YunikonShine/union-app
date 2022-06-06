import 'package:email_validator/email_validator.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/Endpoints.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/domain/enumerations/UserRole.dart';
// import 'package:union/firebase/GoogleService.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:union/ui/widgets/DefaultTextField.dart';
// import 'package:union/util/Crypt.dart';
import 'package:union/ui/widgets/default_text_field.dart';
import 'package:union/routes_names.dart';
import 'package:union/ui/widgets/alert_dialog_message.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(screenName: LoginRoute);
    // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    // _prefs.then((prefs) {
    //   prefs.setBool("welcome", false);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.20),
                width: 260.0,
                height: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/union.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 70.0, right: 50.0, left: 50.0),
                child: Theme(
                  data: ThemeData(
                    hintColor: const Color(0xffffffff),
                    primaryColor: const Color(0xffffffff),
                  ),
                  child: Column(
                    children: <Widget>[
                      DefaultTextField(
                        title: "E-mail",
                        controller: emailController,
                        focus: emailFocus,
                        nextFocus: passwordFocus,
                        inputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "O e-mail é obrigatório";
                          } else if (!EmailValidator.validate(value)) {
                            return "Insira um e-email válido";
                          }
                          return null;
                        },
                        suffixIcon: const SizedBox(),
                        textInputFormatter: const [],
                        maxLength: 100,
                      ),
                      DefaultTextField(
                        title: "Senha",
                        controller: passwordController,
                        focus: passwordFocus,
                        obscureText: true,
                        actionButton: TextInputAction.send,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "A senha é obrigatória";
                          }
                          return null;
                        },
                        suffixIcon: const SizedBox(),
                        textInputFormatter: const [],
                        maxLength: 100,
                        nextFocus: FocusNode(),
                      ),
                    ],
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
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff1b8dcb),
                    ),
                  ),
                  onPressed: () async {
                    //await googleService.getUser();
                    if (_formKey.currentState!.validate()) {
                      AlertDialogMessage.showLoading(context);
                      // int status = await login(
                      //     emailController.text, passwordController.text);
                      Navigator.pop(context);
                      // if (status == HttpStatus.ok) {
                      // await GetIt.instance<GoogleService>().getUser();
                      Navigator.pop(context);
                      Navigator.pushNamed(context, psychologistListRoute);
                      // } else if (status == HttpStatus.unauthorized) {
                      //   AlertDialogMessage.showDialogMessage(
                      //       "Oops...",
                      //       "E-mail e/ou senha incorretos\nLembrando que você "
                      //           "só pode efetuar o login depois de confirmar "
                      //           "o e-mail :) e caso seja um psicólogo deverá "
                      //           "esperar o e-mail de autorização",
                      //       "OK",
                      //       context, () {
                      //     Navigator.pop(context);
                      //   });
                      // } else {
                      //   AlertDialogMessage.showDialogMessage(
                      //       "Opps...",
                      //       "Nos desculpe, parece que tivemos problemas "
                      //           "com o nosso sistema, tente novamente mais tarde",
                      //       "OK",
                      //       context, () {
                      //     Navigator.pop(context);
                      //     //Navigator.pushNamed(context, LoginRoute);
                      //   });
                      // }
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, userTypeRoute);
                    },
                    child: Container(
                      //alignment: Alignment(0, 0),
                      height: 50.0,
                      width: 150.0,
                      padding: const EdgeInsets.only(top: 30.0, right: 20.0),
                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, passwordRecoveryRoute);
                    },
                    child: Container(
                      //alignment: Alignment(0, 0),
                      height: 50.0,
                      width: 150.0,
                      padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                      child: const Text(
                        "Recuperar senha",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, errorReportRoute);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                      child: const Text(
                        "Reporte de erros",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, devReportRoute);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
                        child: const Text(
                          "Sobre o aplicativo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
