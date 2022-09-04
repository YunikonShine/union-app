import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:union/model/user.dart';
import 'package:union/services/api_interceptor.dart';
import 'package:union/services/constants.dart';

class UserService {
  final Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  Future<bool> getUserData() async {
    Uri loginUri = Uri.parse('${Constants.baseApiURL}/user/data');
    Response response = await client.get(loginUri);
    if (response.statusCode == 200) {
      User.fromJson(jsonDecode(response.body));
      return true;
    }
    return false;
  }
}
