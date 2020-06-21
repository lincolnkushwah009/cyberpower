import 'dart:async';
import 'package:cyberpower/service/http_call_service.dart';
import 'package:http/http.dart' as http;


class LoginService {

  HTTPService httpservice = new HTTPService();

  getUserLogin(url, headers, body, context) async {

    var response;

    try {
      response = await httpservice.httpPost(url, headers, body, context);
    } catch(e) {
      rethrow;
    }

    return response;
  }
}