import 'package:email_validator/email_validator.dart';
// import 'package:firebase_analytics/firebase_analKytics.dart';
import 'package:flutter/material.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/ReportClient.dart';
// import 'package:union/domain/ReportMessage.dart';
// import 'package:union/domain/User.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:union/ui/widgets/DefaultTextField.dart';
// import 'package:union/ui/widgets/custom_drawer.dart';
// import 'package:http/http.dart' as http;
import 'package:union/ui/widgets/default/default_text_field.dart';
import 'package:union/ui/widgets/alert_dialog_message.dart';

class ErrorReport extends StatefulWidget {
  const ErrorReport({Key? key}) : super(key: key);

  @override
  State<ErrorReport> createState() => _ErrorReportState();
}

class _ErrorReportState extends State<ErrorReport> {
  // final User user;
  TextEditingController nameController = TextEditingController();

  FocusNode nameFocus = FocusNode();

  TextEditingController emailController = TextEditingController();

  FocusNode emailFocus = FocusNode();

  TextEditingController modelController = TextEditingController();

  FocusNode modelFocus = FocusNode();

  TextEditingController descriptionController = TextEditingController();

  FocusNode descriptionFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // FirebaseAnalytics().setCurrentScreen(screenName: ErrorReportRoute);
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
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Theme(
            data: ThemeData(
                hintColor: const Color(0xffffffff),
                primaryColor: const Color(0xffffffff),
                textSelectionTheme:
                    const TextSelectionThemeData(cursorColor: Colors.white)),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 15.0),
                      child: const Text(
                        "Reporte de erros e sugestões",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: const Text(
                        "Estamos fazendo o possível todos os dias para melhorar "
                        "nosso aplicativo, mas para isso precisamos da sua opinião "
                        "e que nos conte todos os problemas que teve",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                      child: const Text(
                        "Para reportar algum erro ou dar uma sugestão, "
                        "preencha o formulário abaixo",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    DefaultTextField(
                      title: "Nome",
                      maxLength: 100,
                      controller: nameController,
                      focus: nameFocus,
                      nextFocus: emailFocus,
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
                      title: "E-mail",
                      maxLength: 100,
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      focus: emailFocus,
                      nextFocus: modelFocus,
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
                      title: "Modelo do celular",
                      maxLength: 20,
                      controller: modelController,
                      focus: modelFocus,
                      nextFocus: descriptionFocus,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "O modelo é obrigatório";
                        } else if (value.length > 20) {
                          return "O modelo deve no máximo 20 caracteres";
                        }
                        return null;
                      },
                      suffixIcon: const SizedBox(),
                      textInputFormatter: const [],
                    ),
                    DefaultTextField(
                      title: "Conte-nos o que houve",
                      maxLength: 500,
                      minLines: 5,
                      maxLines: 5,
                      actionButton: TextInputAction.send,
                      controller: descriptionController,
                      focus: descriptionFocus,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "A descrição é obrigatória";
                        } else if (value.length > 100 || value.length < 5) {
                          return "A descrição deve ter entre 5 e 100 caracteres";
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.white,
                          ),
                        ),
                        child: const Text(
                          "Enviar",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff1b8dcb),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            // ReportMessage report = ReportMessage();
                            // report.name = nameController.text;
                            // report.email = emailController.text;
                            // report.model = modelController.text;
                            // report.description = descriptionController.text;
                            // AlertDialogMessage.showLoading(context);
                            // http.Response response = await sendError(report);
                            Navigator.pop(context);
                            // if (response.statusCode == HttpStatus.ok) {
                            AlertDialogMessage.showDialogMessage(
                                "Obrigado!!!",
                                "Muito obrigado, estamos atuando para melhorar "
                                    "a cada dia, e o seu reporte é muito importante, "
                                    "iremos dar um feedback o mais rápido possível",
                                "OK",
                                context, () {
                              Navigator.pop(context);
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
                            //     message += "${jsonMessage["defaultMessage"]}\n";
                            //   }
                            //   AlertDialogMessage.showDialogMessage(
                            //       "Opps...", message, "OK", context, () {
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
                            //   });
                            // }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
