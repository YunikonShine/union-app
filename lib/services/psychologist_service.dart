import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:union/model/psychologist.dart';
import 'package:union/services/api_interceptor.dart';
import 'package:union/services/constants.dart';

class PsychologistService {
  final Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  Future<List<Psychologist>> getPsychologistList() async {
    Uri uri = Uri.parse('${Constants.baseApiURL}/psychologist');
    Response response = await client.get(uri);
    if (response.statusCode == 200) {
      List<Psychologist> psychologistList = [];
      var psychologists = jsonDecode(response.body);
      for (var psychologist in psychologists) {
        psychologistList.add(Psychologist.fromJson(psychologist));
      }
      return psychologistList;
    }
    return [];
  }
}
