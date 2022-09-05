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

  Future<bool> updateUser(Map<String, dynamic> user) async {
    Uri loginUri = Uri.parse('${Constants.baseApiURL}/user');
    Response response = await client.put(loginUri, body: jsonEncode(user));
    if (response.statusCode == 204) {
      return await getUserData();
    }
    return false;
  }

  Future<bool> checkOldPassword(Map<String, dynamic> oldPassword) async {
    Uri loginUri = Uri.parse('${Constants.baseApiURL}/user/password/check');
    Response response = await client.post(loginUri, body: jsonEncode(oldPassword));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updatePassword(Map<String, dynamic> password) async {
    Uri loginUri = Uri.parse('${Constants.baseApiURL}/user/password');
    Response response = await client.put(loginUri, body: jsonEncode(password));
    if (response.statusCode == 204) {
      return true;
    }
    return false;
  }
}
