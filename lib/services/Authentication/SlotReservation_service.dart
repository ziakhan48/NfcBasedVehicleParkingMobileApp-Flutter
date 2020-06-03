import 'package:http/http.dart';
import 'dart:convert';

import 'package:parkit_com/utils/apiurl.dart';

SlotReservation_Request(_Model) async {
  String url = ApiUrl.url+"/SlotReservations";
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

