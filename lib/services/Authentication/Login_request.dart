
import 'dart:convert';

import 'package:http/http.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/utils/apiurl.dart';

LoginUser_Request(_Model) async {
  String url = ApiUrl.url+"/Auth/login";
  Map json = _Model.toMap();

  Response response = await post(url, body: json);
  int statusCode = response.statusCode;
  print("Login Request Status Code: " + statusCode.toString());
  if(statusCode == 200){
    String body = response.body;
    Map response_body = jsonDecode(body);
    API_HeaderAuthorizationToken = response_body["auth_token"];
    await saveToken(API_HeaderAuthorizationToken.toString());
    return true;
  }

  return false;
}
