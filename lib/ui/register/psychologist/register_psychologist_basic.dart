import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:email_validator/email_validator.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:union/ui/widgets/default/default_text_field.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/domain/Psychologist.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:union/ui/widgets/DefaultTextField.dart';
// import 'package:union/util/InputMask.dart';
import 'package:union/ui/widgets/alert_dialog_message.dart';
import 'package:union/util/input_mask.dart';
import 'package:union/routes_names.dart';

class RegisterPsychologistBasic extends StatefulWidget {
  const RegisterPsychologistBasic({Key? key}) : super(key: key);

  // final Psychologist psychologist;

  // RegisterPsychologistBasic(this.psychologist);

  @override
  _RegisterPsychologistBasicState createState() =>
      _RegisterPsychologistBasicState();
}

class _RegisterPsychologistBasicState extends State<RegisterPsychologistBasic> {
  // final Psychologist psychologist;

  // _RegisterPsychologistBasicState(this.psychologist);

  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics()
    //     .setCurrentScreen(screenName: RegisterPsychologistBasicRoute);
  }

  List<String> crpRegionOptions = <String>[
    "Região do registro do CRP",
    "01ª Região - DF",
    "02ª Região - PE",
    "03ª Região - BA",
    "04ª Região - MG",
    "05ª Região - RJ",
    "06ª Região - SP",
    "07ª Região - RS",
    "08ª Região - PR",
    "09ª Região - GO",
    "10ª Região - PA/AP",
    "11ª Região - CE",
    "12ª Região - SC",
    "13ª Região - PB",
    "14ª Região - MS",
    "15ª Região - AL",
    "16ª Região - ES",
    "17ª Região - RN",
    "18ª Região - MT",
    "19ª Região - SE",
    "20ª Região - AM/AC/RO/RR",
    "21º Região - PI",
    "22º Região - MA",
    "23ª Região - TO",
  ];
  String crpRegionValue = 'Região do registro do CRP';
  bool crpRegionError = false;

  List<String> genderOptions = <String>[
    "Gênero",
    "Masculino",
    "Feminino",
    "Não binário"
  ];
  String genderValue = "Gênero";
  bool genderError = false;

  TextEditingController nameController = TextEditingController();
  FocusNode nameFocus = FocusNode();

  TextEditingController cpfController = TextEditingController();
  FocusNode cpfFocus = FocusNode();

  TextEditingController bornController = TextEditingController();
  FocusNode bornFocus = FocusNode();
  DateTime bornDateTime = DateTime.now();

  TextEditingController crpNumberController = TextEditingController();
  FocusNode crpNumberFocus = FocusNode();

  FocusNode crpRegionFocus = FocusNode();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocus = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocus = FocusNode();

  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode confirmPasswordFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  void onMonthChange(String item) {
    setState(() {
      crpRegionValue = item;
    });
  }

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
                        textSelectionTheme: const TextSelectionThemeData(
                            cursorColor: Colors.white)),
                    child: Column(
                      children: <Widget>[
                        DefaultTextField(
                          title: "Nome completo",
                          maxLength: 100,
                          controller: nameController,
                          focus: nameFocus,
                          nextFocus: cpfFocus,
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
                          title: "CPF",
                          inputType: TextInputType.number,
                          textInputFormatter: [
                            LengthLimitingTextInputFormatter(14),
                            InputMask.mask("000.000.000-00"),
                          ],
                          controller: cpfController,
                          focus: cpfFocus,
                          nextFocus: bornFocus,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O CPF é obrigatório";
                            } else if (!CPFValidator.isValid(value)) {
                              return "CPF inválido";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          maxLength: 14,
                        ),
                        DefaultTextField(
                          title: "Data de nascimento",
                          inputType: TextInputType.datetime,
                          textInputFormatter: [
                            LengthLimitingTextInputFormatter(10),
                            InputMask.mask("00/00/0000"),
                          ],
                          controller: bornController,
                          focus: bornFocus,
                          nextFocus: crpNumberFocus,
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
                            }

                            bornDateTime = date;
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                          maxLength: 11,
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
                                        setState(() {
                                          genderValue = text.toString();
                                        });
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
                          title: "Número do registro do CRP",
                          maxLength: 10,
                          inputType: TextInputType.number,
                          textInputFormatter: [
                            InputMask.mask("00/0000000"),
                          ],
                          controller: crpNumberController,
                          focus: crpNumberFocus,
                          nextFocus: crpRegionFocus,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "O número de registro do CRP é obrigatório";
                            } else if (value.length > 15 || value.length < 3) {
                              return "O número do CRP deve ter no máximo 15 caracteres";
                            }
                            return null;
                          },
                          suffixIcon: const SizedBox(),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              bottom: crpRegionError ? 15.0 : 30.0),
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
                                      color: crpRegionError
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
                                      value: crpRegionValue,
                                      items:
                                          crpRegionOptions.map((String value) {
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
                                        return crpRegionOptions
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
                                        onMonthChange(text.toString());
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              crpRegionError
                                  ? Container(
                                      padding: const EdgeInsets.only(
                                          left: 15.0, top: 10.0),
                                      child: const Text(
                                        "A região do CRP é obrigatória",
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
                            } else if (value.length < 8) {
                              return "A senha precisa ter no mínimo 8 caracteres";
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
                          obscureText: true,
                          actionButton: TextInputAction.send,
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
                          nextFocus: FocusNode(),
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
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.white,
                              ),
                            ),
                            child: const Text(
                              "Próxima etapa >>",
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xff1b8dcb),
                              ),
                            ),
                            onPressed: () {
                              if (crpRegionValue == crpRegionOptions[0]) {
                                setState(() {
                                  crpRegionError = true;
                                });
                              } else {
                                setState(() {
                                  crpRegionError = false;
                                });
                              }

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
                                  !crpRegionError) {
                                // psychologist.name = nameController.text;
                                // psychologist.cpf =
                                //     CPFValidator.strip(cpfController.text);
                                // psychologist.bornDate = bornDateTime;
                                // psychologist.gender = genderValue;
                                // psychologist.crpNumber =
                                //     crpNumberController.text;
                                // psychologist.crpRegion = crpRegionValue;
                                // psychologist.email = emailController.text;
                                // psychologist.password = passwordController.text;

                                Navigator.pushNamed(
                                    context, registerPsychologistDocumentRoute);
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

  String toOriginalFormatString(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    return "$d/$m/$y";
  }
}
