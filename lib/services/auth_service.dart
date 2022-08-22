import 'package:http/http.dart';
import 'package:union/services/constants.dart';

class AuthService {
  Future<Response> login(String username, String password) async {
    Uri loginUri = Uri.parse('${Constants.baseURL}/public/login');
    Response response = await post(loginUri, body: {
      "email": username,
      "password": password,
    });
    return response;
  }
}
