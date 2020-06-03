import 'package:http/http.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';

import 'package:parkit_com/utils/apiurl.dart';

Signup_Request(_Model) async {
  String url = ApiUrl.url+"/Account";
  Map json = _Model.toMap();

  print(json);

  Response response = await post(url, body: json);

  int statusCode = response.statusCode;
  print("Signup Request Status Code: " + statusCode.toString());
  if(statusCode == 200){
    String body = response.body;
    // Map response_body = jsonDecode(body);
    // email = response_body["email"];
    // username = response_body["username"];
    await saveToken(API_HeaderAuthorizationToken.toString());
    return true;
  }

  return false;
}

