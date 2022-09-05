import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:union/model/user.dart';
import 'package:union/routes_names.dart';
import 'package:union/util/constants/images.dart';
import 'package:union/widgets/alert_dialog_message.dart';
import 'package:union/widgets/custom_drawer.dart';
import 'package:union/widgets/default/default_text_field.dart';
import 'package:union/widgets/pointed_separator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final User user = User();
  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    nameController.text = user.name;
    bornController.text = dateFormat.format(user.bornDate);
    emailController.text = user.email;
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  TextEditingController bornController = TextEditingController();
  FocusNode bornFocus = FocusNode();

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
              image: appImage,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xff14bed8),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
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
                                image: manPerson,
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
                          } else if (value.length > 100 || value.length < 5) {
                            return "O nome deve ter entre 5 e 100 caracteres";
                          }
                          return null;
                        },
                      ),
                      DefaultTextField(
                        title: "Data de nascimento",
                        readOnly: true,
                        controller: bornController,
                      ),
                      DefaultTextField(
                        title: "E-mail",
                        readOnly: true,
                        controller: emailController,
                        removeDefaultMargin: true,
                      ),
                      SizedBox(
                        width: 250.0,
                        height: 50.0,
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
                      ),
                      DefaultTextField(
                        title: "Nova senha",
                        maxLength: 25,
                        obscureText: true,
                        controller: passwordController,
                        focus: passwordFocus,
                        nextFocus: confirmPasswordFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "A nova senha é obrigatória";
                          }
                          return null;
                        },
                      ),
                      DefaultTextField(
                        title: "Confirmação da nova senha",
                        maxLength: 25,
                        obscureText: true,
                        controller: confirmPasswordController,
                        focus: confirmPasswordFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "A confirmação da nova senha é obrigatória";
                          } else if (value != passwordController.text) {
                            return "As senhas devem ser iguais";
                          }
                          return null;
                        },
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
                              Navigator.pushNamedAndRemoveUntil(context,
                                  loginRoute, (Route<dynamic> route) => false);
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
    );
  }
}
