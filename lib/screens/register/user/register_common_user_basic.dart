import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:union/model/user.dart';
import 'package:union/routes_names.dart';
import 'package:union/services/user_service.dart';
import 'package:union/util/constants/colors.dart';
import 'package:union/widgets/default/default_button.dart';
import 'package:union/widgets/default/default_text_field.dart';
import 'package:union/widgets/alert_dialog_message.dart';
import 'package:union/util/input_mask.dart';

class RegisterCommonUserBasic extends StatefulWidget {
  const RegisterCommonUserBasic({Key? key}) : super(key: key);

  @override
  _RegisterCommonUserBasicState createState() =>
      _RegisterCommonUserBasicState();
}

class _RegisterCommonUserBasicState extends State<RegisterCommonUserBasic> {
  @override
  void initState() {
    super.initState();
  }

  User user = User.cached("register");
  final UserService _userService = UserService();

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  TextEditingController bornController = TextEditingController();
  FocusNode bornFocus = FocusNode();
  DateTime bornDate = DateTime.now();

  List<String> genderOptions = User.getGenders().keys.toList();
  String genderValue = "Masculino";
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

  _setGender(String gender) {
    setState(() {
      genderValue = gender;
    });
  }

  String _toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$d/$m/$y";
  }

  _registerUser() async {
    user.name = nameController.text;
    user.bornDate = bornDate;
    user.email = emailController.text;
    user.gender = genderValue;
    user.password = passwordController.text;
    user.description = descriptionController.text;

    AlertDialogMessage.showLoading(context);

    bool userSaved = await _userService.registerUser(user);

    if (userSaved) {
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
        Navigator.pushNamedAndRemoveUntil(
            context, loginRoute, (Route<dynamic> route) => false);
      });
    } else {
      AlertDialogMessage.showDialogMessage(
          "Opps...",
          "Nos desculpe, parece que tivemos problemas "
              "com o nosso sistema, tente novamente mais tarde",
          "OK",
          context, () {
        Navigator.pushNamedAndRemoveUntil(
            context, loginRoute, (Route<dynamic> route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
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
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/${user.avatar}"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin:
                      const EdgeInsets.only(right: 25.0, left: 25.0, top: 25.0),
                  child: Column(
                    children: <Widget>[
                      DefaultTextField(
                        title: "Nome completo",
                        maxLength: 100,
                        controller: nameController,
                        focus: nameFocus,
                        nextFocus: bornFocus,
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
                        controller: bornController,
                        focus: bornFocus,
                        nextFocus: genderFocus,
                        inputType: TextInputType.datetime,
                        textInputFormatter: [
                          LengthLimitingTextInputFormatter(10),
                          InputMask.mask("00/00/0000"),
                        ],
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

                          if (value != _toOriginalFormatString(date) ||
                              date.isAfter(DateTime.now())) {
                            return "Data de nascimento inválida";
                          } else if (DateTime.now().difference(date).inDays <
                              (365 * 18)) {
                            return "Você precisa ter mais de 18 anos";
                          }
                          bornDate = date;
                          return null;
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, top: 5.0),
                              decoration: ShapeDecoration(
                                shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                    color: Colors.white70,
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
                                      return genderOptions.map((String value) {
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
                                      _setGender(text.toString());
                                    },
                                  ),
                                ),
                              ),
                            ),
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
                          if (value!.isEmpty) {
                            return "A descrição é obrigatória";
                          } else if (value.length > 100 || value.length < 5) {
                            return "A descrição deve ter entre 5 e 100 caracteres";
                          }
                          return null;
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 25.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Column(
                          children: <Widget>[
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
                      DefaultButton(
                        margin: const EdgeInsets.only(bottom: 25),
                        text: "Registrar-se",
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _registerUser();
                          } else {
                            AlertDialogMessage.showDialogMessage(
                                "Opps...",
                                "Um ou mais campos do cadastro estão incorretos\nPor favor, revise os campos",
                                "OK",
                                context, () {
                              Navigator.pop(context);
                            });
                          }
                        },
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
