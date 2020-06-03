


import 'package:shared_preferences/shared_preferences.dart';

var username = "";
var email = "";
var API_HeaderAuthorizationToken = "";

Map<String, String> headers = Map<String,String>();


readToken() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'auth_token';
  final value = await prefs.getString(key) ?? 0;
  print('read: $value');
  return value;
}

saveToken(value_) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'auth_token';
  final value = value_;
  prefs.setString(key, value);
  print('saved $value');
}
