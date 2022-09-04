import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:union/services/api_interceptor.dart';
import 'package:union/services/constants.dart';

class AuthService {
  final Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  final storage = const FlutterSecureStorage();

  Future<bool> login(String email, String password) async {
    Uri loginUri = Uri.parse('${Constants.basePublicURL}/login');
    String body = jsonEncode({
      "email": email,
      "password": password,
    });
    Response response = await client.post(loginUri, body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      storage.write(
        key: "token",
        value: data['token'],
      );
      storage.write(
        key: "refreshToken",
        value: data['refreshToken'],
      );
      storage.write(
        key: "tokenExpirationDate",
        value: data['expirationDate'],
      );
      return true;
    }
    return false;
  }

  Future<bool> refreshToken() async {
    Uri tokenRefreshUri = Uri.parse('${Constants.basePublicURL}/token/refresh');
    String? refreshToken = await storage.read(key: "refreshToken");
    String body = jsonEncode({
      "refreshToken": refreshToken,
    });
    Response response = await client.post(tokenRefreshUri, body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      storage.write(
        key: "token",
        value: data['token'],
      );
      storage.write(
        key: "refreshToken",
        value: data['refreshToken'],
      );
      storage.write(
        key: "tokenExpirationDate",
        value: data['expirationDate'],
      );
      return true;
    }
    return false;
  }
}
