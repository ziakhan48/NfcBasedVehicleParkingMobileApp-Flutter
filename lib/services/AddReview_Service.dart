import 'package:http/http.dart';

import 'package:parkit_com/utils/apiurl.dart';

AddReview_Request(_Model) async {
  String url = ApiUrl.url+"/AddReview";
  Map json = _Model.toMap();

  print(json);

  Response response = await post(url, body: json);

  int statusCode = response.statusCode;
  print("Signup Request Status Code: " + statusCode.toString());
  if(statusCode == 200){
    String body = response.body;
    return true;
  }

  return false;
}

