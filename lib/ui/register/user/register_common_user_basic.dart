// import 'dart:convert';
// import 'dart:io';

import 'package:email_validator/email_validator.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
import 'package:responsive_grid/responsive_grid.dart';
import 'package:union/ui/widgets/default/default_text_field.dart';
import 'package:union/ui/widgets/alert_dialog_message.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/CommonUserClient.dart';
// import 'package:union/domain/CommonUser.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:union/ui/widgets/DefaultTextField.dart';
import 'package:union/util/input_mask.dart';

class RegisterCommonUserBasic extends StatefulWidget {
  const RegisterCommonUserBasic({Key? key}) : super(key: key);

  // final CommonUser commonUser;

  // RegisterCommonUserBasic(this.commonUser);

  @override
  _RegisterCommonUserBasicState createState() =>
      _RegisterCommonUserBasicState();
}

class _RegisterCommonUserBasicState extends State<RegisterCommonUserBasic> {
  // final CommonUser commonUser;

  // _RegisterCommonUserBasicState();

  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(screenName: RegisterCommonBasicRoute);
  }

  List<String> genderOptions = <String>[
    "Gênero",
    "Masculino",
    "Feminino",
    "Não binário"
  ];
  String genderValue = "Gênero";

  bool nameLock = false;
  bool bornLock = false;
  bool genderError = false;

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  TextEditingController bornController = TextEditingController();
  FocusNode bornFocus = FocusNode();
  DateTime bornDateTime = DateTime.now();

  FocusNode genderFocus = FocusNode();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocus = FocusNode();

  TextEditingController descriptionController = TextEditingController();
  FocusNode descriptionFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.07),
                        width: 160.0,
                        height: 100.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("images/man_person.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
                  child: Theme(
                    data: ThemeData(
                      hintColor: const Color(0xffffffff),
                      primaryColor: const Color(0xffffffff),
                      // cursorColor: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        DefaultTextField(
                          title: "Nome completo",
                          maxLength: 100,
                          controller: nameController,
                          focus: nameFocus,
                          nextFocus: bornFocus,
//                          suffixIcon: GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                nameLock = !nameLock;
//                              });
//                            },
//                            child: Icon(
//                              nameLock ? Icons.lock_outline : Icons.lock_open,
//                              color: Colors.white,
//                            ),
//                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O nome é obrigatório";
                            } else if (value.length > 100 || value.length < 5) {
                              return "O nome deve ter entre 5 e 100 caracteres";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        DefaultTextField(
                          title: "Data de nascimento",
                          inputType: TextInputType.datetime,
//                          suffixIcon: GestureDetector(
//                            onTap: () {
//                              setState(() {
//                                bornLock = !bornLock;
//                              });
//                            },
//                            child: Icon(
//                              bornLock ? Icons.lock_outline : Icons.lock_open,
//                              color: Colors.white,
//                            ),
//                          ),
                          textInputFormatter: [
                            LengthLimitingTextInputFormatter(10),
                            InputMask.mask("00/00/0000"),
                          ],
                          controller: bornController,
                          focus: bornFocus,
                          nextFocus: genderFocus,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "A data de nascimento é obrigatória";
                            }
                            if (value.length < 10) {
                              return "Data de nascimento inválida";
                            }
                            List<String> values = value.split("/");
                            String dateTemp =
                                "${values[2]}-${values[1]}-${values[0]}";
                            DateTime date = DateTime.parse(dateTemp);

                            if (value != toOriginalFormatString(date) ||
                                date.isAfter(DateTime.now())) {
                              return "Data de nascimento inválida";
                            } else if (DateTime.now().difference(date).inDays <
                                (365 * 18)) {
                              return "Você precisa ter mais de 18 anos";
                            }
                            bornDateTime = date;
                            return null;
                          },
                          maxLength: 255,
                          suffixIcon: const SizedBox(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: genderError ? 15.0 : 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(
                                    bottom: 5.0, top: 5.0),
                                decoration: ShapeDecoration(
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: genderError
                                          ? const Color(0xFFD32F2F)
                                          : Colors.white70,
                                    ),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton(
                                      iconDisabledColor: Colors.white,
                                      iconEnabledColor: Colors.white,
                                      value: genderValue,
                                      items: genderOptions.map((String value) {
                                        return DropdownMenuItem(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      selectedItemBuilder: (context) {
                                        return genderOptions
                                            .map((String value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        }).toList();
                                      },
                                      onChanged: (text) {
                                        // setGender(text);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              genderError
                                  ? Container(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 10.0),
                                      child: const Text(
                                        "O gênero é obrigatório",
                                        style: TextStyle(
                                          color: Color(0xFFD32F2F),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                        DefaultTextField(
                          title: "E-mail",
                          maxLength: 100,
                          controller: emailController,
                          focus: emailFocus,
                          nextFocus: passwordFocus,
                          inputType: TextInputType.emailAddress,
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
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        DefaultTextField(
                          title: "Senha",
                          maxLength: 25,
                          controller: passwordController,
                          focus: passwordFocus,
                          nextFocus: confirmPasswordFocus,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "A senha é obrigatória";
                            } else if (value.length > 25 || value.length < 8) {
                              return "A senha deve ter entre 8 e 25 caracteres";
                            } else if (!RegExp(r'\d').hasMatch(value) ||
                                !RegExp('[a-zA-Z]').hasMatch(value)) {
                              return "A senha deve ter letras e números";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        DefaultTextField(
                          title: "Confirmação de senha",
                          maxLength: 25,
                          controller: confirmPasswordController,
                          focus: confirmPasswordFocus,
                          nextFocus: descriptionFocus,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "A confirmação de senha é obrigatória";
                            } else if (value != passwordController.text) {
                              return "As senhas devem ser iguais";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        DefaultTextField(
                          title: "Uma breve descrição sobre você",
                          maxLength: 100,
                          controller: descriptionController,
                          focus: descriptionFocus,
                          minLines: 2,
                          maxLines: 5,
                          actionButton: TextInputAction.send,
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                (value.length > 100 || value.length < 5)) {
                              return "A descrição deve ter entre 5 e 100 caracteres";
                            }
                            return null;
                          },
                          nextFocus: FocusNode(),
                          suffixIcon: const SizedBox(),
                          textInputFormatter: const [],
                        ),
                        Container(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 50.0),
                          //  height: 180.0,
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Column(
                            children: <Widget>[
//                              Row(
//                                children: <Widget>[
//                                  Container(
//                                    margin: EdgeInsets.only(right: 10.0),
//                                    child: Icon(
//                                      Icons.lock_outline,
//                                      color: Colors.white,
//                                    ),
//                                  ),
//                                  Flexible(
//                                    child: Text(
//                                      "Estes campos serão substituídos por "
//                                      "campos fícticios",
//                                      style: TextStyle(
//                                        color: Colors.white,
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                              Container(
//                                padding: EdgeInsets.only(top: 10.0),
//                                child: Row(
//                                  children: <Widget>[
//                                    Container(
//                                      margin: EdgeInsets.only(right: 10.0),
//                                      child: Icon(
//                                        Icons.lock_outline,
//                                        color: Colors.white,
//                                      ),
//                                    ),
//                                    Flexible(
//                                      child: Text(
//                                        "Estes campos serão visualizados da "
//                                        "forma que foram inseridos",
//                                        style: TextStyle(
//                                          color: Colors.white,
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
                              Row(
                                children: const <Widget>[
                                  Flexible(
                                    child: Text(
                                      "Não se preocupe, os seus dados são "
                                      "guardados com muito cuidado, para "
                                      "que ninguém consiga nenhuma de suas "
                                      "informações, não se preocupe!",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 250.0,
                          height: 50.0,
                          margin: const EdgeInsets.only(bottom: 15.0),
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
                              "Registrar-se",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff1b8dcb),
                              ),
                            ),
                            onPressed: () async {
                              if (genderValue == genderOptions[0]) {
                                setState(() {
                                  genderError = true;
                                });
                              } else {
                                setState(() {
                                  genderError = false;
                                });
                              }
                              if (_formKey.currentState!.validate() &&
                                  !genderError) {
                                // commonUser.name = nameController.text;
                                // commonUser.nameLock = nameLock;
                                // commonUser.bornDate = bornDateTime;
                                // commonUser.bornLock = bornLock;
                                // commonUser.gender = genderValue;
                                // commonUser.email = emailController.text;
                                // commonUser.password = passwordController.text;
                                // commonUser.description =
                                //     descriptionController.text;

                                // AlertDialogMessage.showLoading(context);

                                // http.Response response =
                                //     await saveCommonUser(commonUser);

                                Navigator.pop(context);

                                // if (response.statusCode == HttpStatus.created) {
                                AlertDialogMessage.showDialogMessage(
                                    "Parabéns!!!",
                                    "Você se cadastrou com succeso no projeto "
                                        "Union, agora apenas precisamos que você "
                                        "clique no botão do e-mail que acabamos "
                                        "de enviar, só para garantir que você "
                                        "não é um robô :) e não se esqueça "
                                        "de olhar a caixa de spam\nMuito "
                                        "obrigado por se cadastrar",
                                    "OK",
                                    context, () {
                                  // Navigator.pushNamed(context, LoginRoute);
                                });
                                // } else if (response.statusCode ==
                                //     HttpStatus.badRequest) {
                                //   var decodedUTF = const Utf8Decoder()
                                //       .convert(response.bodyBytes);
                                //   Map jsonResponse = json.decode(decodedUTF);
                                //   String message = "";
                                //   List<dynamic> errors = jsonResponse["errors"];
                                //   for (int i = 0; i < errors.length; i++) {
                                //     Map jsonMessage = errors[i];
                                //     message +=
                                //         "${jsonMessage["defaultMessage"]}\n";
                                //   }
                                //   AlertDialogMessage.showDialogMessage(
                                //       "Opps...", message, "OK", context, () {
                                //     Navigator.pop(context);
                                //   });
                                // } else {
                                //   print(response.statusCode);
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
                              } else {
                                AlertDialogMessage.showDialogMessage(
                                    "Oops...",
                                    "Alguns campos não foram preenchidos "
                                        "corretamente, por favor, revise os seus dados",
                                    "OK",
                                    context, () {
                                  Navigator.pop(context);
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  setGender(String gender) {
    setState(() {
      genderValue = gender;
    });
  }

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$d/$m/$y";
  }
}
