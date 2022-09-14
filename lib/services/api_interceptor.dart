import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:union/services/auth_service.dart';

class ApiInterceptor implements InterceptorContract {
  final storage = const FlutterSecureStorage();

  Future<String> get tokenOrEmpty async {
    String? token = await storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  _checkExpiredToken() async {
    String? tokenExpirationDate =
        await storage.read(key: "tokenExpirationDate");
    if (tokenExpirationDate != null) {
      DateTime parse = DateTime.parse(tokenExpirationDate);
      if (parse.compareTo(DateTime.now()) < 0) {
        await AuthService().refreshToken();
      }
    }
  }

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    if (!data.url.contains("/token/refresh")) {
      await _checkExpiredToken();
    }
    String token = await tokenOrEmpty;
    data.headers["Authorization"] = token;
    data.headers["Content-Type"] = "application/json";
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}
