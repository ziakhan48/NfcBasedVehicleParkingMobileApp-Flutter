import 'package:dio/dio.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';

import 'package:parkit_com/utils/apiurl.dart';

ChangePassword_Request(_Model) async {
var authkey = await readToken();
  headers["Authorization"] = "Bearer " + authkey;

  Dio dio = new Dio();

  String url = ApiUrl.userurl + "/ChangePassword";
  Map json = _Model.toMap();
  print(json);

  var response = await dio.post(url,
      data: json,
      options: Options(
        headers: headers,
      ));

  int statusCode = response.statusCode;
  print("Signup Request Status Code: " + statusCode.toString());
  if (statusCode == 200) {
    String body = response.data;
    return true;
  }

  return false;
}

