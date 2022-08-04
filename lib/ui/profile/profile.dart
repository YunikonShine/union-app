// import 'dart:convert';
// import 'dart:io';

import 'package:email_validator/email_validator.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/Endpoints.dart';
// import 'package:union/client/UserClient.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:union/ui/widgets/DefaultTextField.dart';
// import 'package:union/ui/widgets/PointedSeparator.dart';
// import 'package:union/ui/widgets/custom_drawer.dart';
// import 'package:union/util/InputMask.dart';
// import 'package:http/http.dart' as http;
import 'package:union/routes_names.dart';
import 'package:union/ui/widgets/alert_dialog_message.dart';
import 'package:union/ui/widgets/custom_drawer.dart';
import 'package:union/ui/widgets/default/default_text_field.dart';
import 'package:union/ui/widgets/pointed_separator.dart';
import 'package:union/util/input_mask.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  // final User user;

  // Profile(this.user);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(screenName: ProfileRoute);
    // final dateFormat = new DateFormat('dd/MM/yyyy');
    nameController.text = "user.name";
    bornController.text = "22/10/2000";
    emailController.text = "user.email@email.com";
  }

  // final User user;

  // _ProfileState(this.user);

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  TextEditingController bornController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  final _formKeyData = GlobalKey<FormState>();

  TextEditingController oldPasswordController = TextEditingController();
  FocusNode oldPasswordFocus = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocus = FocusNode();

  final _formKeyPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            hintColor: const Color(0xffffffff),
            primaryColor: const Color(0xffffffff),
          ),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: <Widget>[
                  Form(
                    key: _formKeyData,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.03),
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
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                        ),
                        DefaultTextField(
                            title: "Nome completo",
                            maxLength: 100,
                            controller: nameController,
                            focus: nameFocus,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "O nome é obrigatório";
                              } else if (value.length > 100 ||
                                  value.length < 5) {
                                return "O nome deve ter entre 5 e 100 caracteres";
                              }
                              return null;
                            },
                            nextFocus: FocusNode(),
                            suffixIcon: const SizedBox(),
                            textInputFormatter: const []),
                        DefaultTextField(
                          title: "Data de nascimento",
                          inputType: TextInputType.datetime,
                          controller: bornController,
                          readOnly: true,
                          textInputFormatter: [
                            LengthLimitingTextInputFormatter(10),
                            InputMask.mask("00/00/0000"),
                          ],
                          nextFocus: FocusNode(),
                          focus: FocusNode(),
                          maxLength: 255,
                          suffixIcon: const SizedBox(),
                          validator: (value) {
                            return null;
                          },
                        ),
                        DefaultTextField(
                          title: "E-mail",
                          inputType: TextInputType.emailAddress,
                          controller: emailController,
                          focus: emailFocus,
                          readOnly: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O e-mail é obrigatório";
                            } else if (value.length > 100 || value.length < 5) {
                              return "O e-mail deve ter entre 5 e 100 caracteres";
                            } else if (!EmailValidator.validate(value)) {
                              return "Insira um e-email válido";
                            }
                            return null;
                          },
                          nextFocus: FocusNode(),
                          maxLength: 255,
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                            child: const Text(
                              "Atualizar dados",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff1b8dcb),
                              ),
                            ),
                            onPressed: () async {
                              // if (_formKeyData.currentState.validate()) {
                              //   User user = User();
                              //   user.name = nameController.text;
                              //   AlertDialogMessage.showLoading(context);
                              //   http.Response response = await updateUser(user);
                              //   Navigator.pop(context);
                              //   if (response.statusCode ==
                              //       HttpStatus.noContent) {
                              //     setNameUserLogged(user.name);
                              AlertDialogMessage.showDialogMessage(
                                  "Sucesso!!!",
                                  "Os seus dados foram atualizados com sucesso",
                                  "OK",
                                  context, () {
                                Navigator.pop(context);
                              });
                              //   } else if (response.statusCode ==
                              //       HttpStatus.badRequest) {
                              //     var decodedUTF = const Utf8Decoder()
                              //         .convert(response.bodyBytes);
                              //     Map jsonResponse = json.decode(decodedUTF);
                              //     String message = "";
                              //     List<dynamic> errors = jsonResponse["errors"];
                              //     for (int i = 0; i < errors.length; i++) {
                              //       Map jsonMessage = errors[i];
                              //       message +=
                              //           "${jsonMessage["defaultMessage"]}\n";
                              //     }
                              //     AlertDialogMessage.showDialogMessage(
                              //         "Opps...", message, "OK", context, () {
                              //       Navigator.pop(context);
                              //     });
                              //   } else {
                              //     AlertDialogMessage.showDialogMessage(
                              //         "Opps...",
                              //         "Nos desculpe, parece que tivemos problemas "
                              //             "com o nosso sistema, tente novamente mais tarde",
                              //         "OK",
                              //         context, () {
                              //       Navigator.pop(context);
                              //     });
                              //   }
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PointedSeparator(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Form(
                    key: _formKeyPassword,
                    child: Column(
                      children: <Widget>[
                        DefaultTextField(
                          title: "Senha antiga",
                          maxLength: 25,
                          obscureText: true,
                          controller: oldPasswordController,
                          focus: oldPasswordFocus,
                          nextFocus: passwordFocus,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "A antiga senha é obrigatória";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        DefaultTextField(
                          title: "Nova senha",
                          maxLength: 25,
                          controller: passwordController,
                          focus: passwordFocus,
                          nextFocus: confirmPasswordFocus,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "A nova senha é obrigatória";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        DefaultTextField(
                          title: "Confirmação da nova senha",
                          maxLength: 25,
                          controller: confirmPasswordController,
                          focus: confirmPasswordFocus,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "A confirmação da nova senha é obrigatória";
                            } else if (value != passwordController.text) {
                              return "As senhas devem ser iguais";
                            }
                            return null;
                          },
                          nextFocus: FocusNode(),
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(top: 5.0, bottom: 15.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                            child: const Text(
                              "Atualizar senha",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff1b8dcb),
                              ),
                            ),
                            onPressed: () async {
                              // if (_formKeyPassword.currentState.validate()) {
                              //   User user = User();
                              //   user.password = passwordController.text;
                              //   user.oldPassword = oldPasswordController.text;
                              //   AlertDialogMessage.showLoading(context);
                              //   http.Response response =
                              //       await updateUserPassword(user);
                              //   Navigator.pop(context);
                              //   if (response.statusCode ==
                              //       HttpStatus.noContent) {
                              //     setNameUserLogged(user.name);
                              AlertDialogMessage.showDialogMessage(
                                  "Sucesso!!!",
                                  "Sua senha foi atualizada com sucesso\n"
                                      "Agora você precisa realizar o login novamente",
                                  "OK",
                                  context, () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    loginRoute,
                                    (Route<dynamic> route) => false);
                              });
                              //   } else if (response.statusCode ==
                              //       HttpStatus.badRequest) {
                              //     var decodedUTF = const Utf8Decoder()
                              //         .convert(response.bodyBytes);
                              //     Map jsonResponse = json.decode(decodedUTF);
                              //     String message = "";
                              //     List<dynamic> errors = jsonResponse["errors"];
                              //     for (int i = 0; i < errors.length; i++) {
                              //       Map jsonMessage = errors[i];
                              //       message +=
                              //           "${jsonMessage["defaultMessage"]}\n";
                              //     }
                              //     AlertDialogMessage.showDialogMessage(
                              //         "Opps...", message, "OK", context, () {
                              //       Navigator.pop(context);
                              //     });
                              //   } else {
                              //     AlertDialogMessage.showDialogMessage(
                              //         "Opps...",
                              //         "Nos desculpe, parece que tivemos problemas "
                              //             "com o nosso sistema, tente novamente mais tarde",
                              //         "OK",
                              //         context, () {
                              //       Navigator.pop(context);
                              //     });
                              //   }
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
