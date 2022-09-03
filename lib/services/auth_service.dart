import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:union/services/api_interceptor.dart';
import 'package:union/services/constants.dart';

class AuthService {
  final Client client = InterceptedClient.build(interceptors: [
    ApiInterceptor(),
  ]);

  Future<Response> login(String email, String password) async {
    Uri loginUri = Uri.parse('${Constants.baseURL}/public/login');
    String body = jsonEncode({
      "email": email,
      "password": password,
    });
    Response response = await client.post(loginUri, body: body);
    return response;
  }
}
