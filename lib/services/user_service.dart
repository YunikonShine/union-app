import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:union/model/logged_user.dart';
import 'package:union/model/password.dart';
import 'package:union/model/user.dart';
import 'package:union/services/api_interceptor.dart';
import 'package:union/services/constants.dart';

class UserService {
  final Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  Future<bool> registerUser(User user) async {
    Uri uri = Uri.parse('${Constants.basePublicURL}/register/common-user');
    Response response = await client.post(uri, body: jsonEncode(user.toMap()));
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> getUserData() async {
    Uri uri = Uri.parse('${Constants.baseApiURL}/user/data');
    Response response = await client.get(uri);
    if (response.statusCode == 200) {
      LoggedUser.fromJson(jsonDecode(response.body));
      return true;
    }
    return false;
  }

  Future<bool> updateUser(User user) async {
    Uri uri = Uri.parse('${Constants.baseApiURL}/user');
    Response response = await client.put(uri, body: jsonEncode(user.toMap()));
    if (response.statusCode == 204) {
      return await getUserData();
    }
    return false;
  }

  Future<bool> checkOldPassword(Password oldPassword) async {
    Uri uri = Uri.parse('${Constants.baseApiURL}/user/password/check');
    Response response = await client.post(uri, body: jsonEncode(oldPassword.toMap()));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updatePassword(Password password) async {
    Uri uri = Uri.parse('${Constants.baseApiURL}/user/password');
    Response response = await client.put(uri, body: jsonEncode(password.toMap()));
    if (response.statusCode == 204) {
      return true;
    }
    return false;
  }
}
