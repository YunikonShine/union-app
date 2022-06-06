// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_grid/responsive_grid.dart';
// import 'package:union/RoutesNames.dart';
// import 'package:union/client/PsychologistClient.dart';
// import 'package:union/domain/Psychologist.dart';
// import 'package:union/ui/widgets/AlertDialogMessage.dart';
// import 'package:http/http.dart' as http;
import 'package:union/ui/widgets/alert_dialog_message.dart';
import 'package:union/routes_names.dart';

class RegisterPsychologistDocuments extends StatefulWidget {
  const RegisterPsychologistDocuments({Key? key}) : super(key: key);

  // final Psychologist psychologist;

  // RegisterPsychologistDocuments(this.psychologist);

  @override
  _RegisterPsychologistDocumentsState createState() =>
      _RegisterPsychologistDocumentsState();
}

class _RegisterPsychologistDocumentsState
    extends State<RegisterPsychologistDocuments> {
  // final Psychologist psychologist;

  // _RegisterPsychologistDocumentsState(this.psychologist);

  @override
  void initState() {
    super.initState();
    // FirebaseAnalytics().setCurrentScreen(
    //     screenName: RegisterPsychologistDocumentRoute);
  }

  XFile? _imageDocumentFront;
  XFile? _imageDocumentBack;
  XFile? _imageDocumentCRP;
  XFile? _imageDocumentSelfie;
  XFile? _imageCRPSelfie;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff14bed8),
      body: SingleChildScrollView(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "Agora precisamos",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "de",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            "algumas fotos :)",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Documento - Frente",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentFront =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.photo_library,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentFront =
                                          await _picker.pickImage(
                                              source: ImageSource.camera,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 300,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/square.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Documento - Verso",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentBack =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.photo_library,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentBack =
                                          await _picker.pickImage(
                                              source: ImageSource.camera,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 300,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/square.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Carteirinha CRP",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentCRP =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.photo_library,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentCRP =
                                          await _picker.pickImage(
                                              source: ImageSource.camera,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            width: 300,
                            height: 200,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/square.png"),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Selfie com documento",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentSelfie =
                                          await _picker.pickImage(
                                              source: ImageSource.gallery,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.photo_library,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageDocumentSelfie =
                                          await _picker.pickImage(
                                              source: ImageSource.camera,
                                              maxWidth: null,
                                              maxHeight: null,
                                              imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // _imageDocumentSelfie != null
                          //     ? Container(
                          //         margin: const EdgeInsets.only(top: 10.0),
                          //         width: 300,
                          //         height: 200,
                          //         decoration: BoxDecoration(
                          //           image: DecorationImage(
                          //             image: FileImage(_imageDocumentSelfie),
                          //             fit: BoxFit.contain,
                          //           ),
                          //         ),
                          //       )
                          //     :
                          RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/square.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  "Selfie com carteirinha",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageCRPSelfie = await _picker.pickImage(
                                          source: ImageSource.gallery,
                                          maxWidth: null,
                                          maxHeight: null,
                                          imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.photo_library,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        const Color(0xff14bed8),
                                      ),
                                      textStyle:
                                          MaterialStateProperty.all<TextStyle>(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        const EdgeInsets.all(10.0),
                                      ),
                                    ),
                                    onPressed: () async {
                                      _imageCRPSelfie = await _picker.pickImage(
                                          source: ImageSource.camera,
                                          maxWidth: null,
                                          maxHeight: null,
                                          imageQuality: null);
                                      setState(() {});
                                    },
                                    child: const Icon(
                                      Icons.camera_alt,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // _imageCRPSelfie != null
                          //     ? Container(
                          //         margin: const EdgeInsets.only(top: 10.0),
                          //         width: 300,
                          //         height: 200,
                          //         decoration: BoxDecoration(
                          //           image: DecorationImage(
                          //             image: FileImage(_imageCRPSelfie),
                          //             fit: BoxFit.contain,
                          //           ),
                          //         ),
                          //       )
                          //     :
                          RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              width: 300,
                              height: 200,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/square.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 250.0,
                        height: 50.0,
                        margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            )),
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
                            if (_imageDocumentFront == null ||
                                _imageDocumentBack == null ||
                                _imageDocumentCRP == null ||
                                _imageDocumentSelfie == null ||
                                _imageCRPSelfie == null) {
                              AlertDialogMessage.showDialogMessage(
                                  "Oops...",
                                  "Nós precisamos que você nos mande fotos de "
                                      "todos os documentos solicitados para nós "
                                      "podermos finalizar o seu cadastro",
                                  "OK",
                                  context, () {
                                Navigator.pop(context);
                              });
                              return;
                            }
                            // psychologist.files.clear();

                            AlertDialogMessage.showLoading(context);

                            // psychologist.files.add(base64Encode(
                            //     await _imageDocumentFront.readAsBytes()));
                            // psychologist.files.add(base64Encode(
                            //     await _imageDocumentBack.readAsBytes()));
                            // psychologist.files.add(base64Encode(
                            //     await _imageDocumentCRP.readAsBytes()));
                            // psychologist.files.add(base64Encode(
                            //     await _imageDocumentSelfie.readAsBytes()));
                            // psychologist.files.add(base64Encode(
                            //     await _imageCRPSelfie.readAsBytes()));

                            // http.Response response =
                            //     await savePsychologist(psychologist);

                            Navigator.pop(context);

                            // if (response.statusCode == HttpStatus.created) {
                            AlertDialogMessage.showDialogMessage(
                                "Parabéns!!!",
                                "Você se cadastrou com succeso no projeto "
                                    "Union, nós agradacemos muito sua "
                                    "colaboração e o tempo gasto conosco, "
                                    "esperamos fazer o melhor para ajudá-lo "
                                    "sempre, precisamos que confirme o e-mail "
                                    "que acabamos de enviar e em até 5 dias "
                                    "enviaremos outro e-mail ativando o seu "
                                    "cadastro e você poderá ajudar as pessoas, "
                                    "obrigado ^^",
                                "OK",
                                context, () {
                              Navigator.pushNamed(context, loginRoute);
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
                            //     //Navigator.pushNamed(context, LoginRoute);
                            //   });
                            // }
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
    );
  }
}
