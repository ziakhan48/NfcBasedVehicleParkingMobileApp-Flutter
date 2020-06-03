import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:parkit_com/models/Api/UserAccoutModels/Profile.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/utils/apiurl.dart';

class ProfileS {
  static Future<Profile> fetchProfile() async {
    var authkey = await readToken();
    headers["Authorization"] = "Bearer " + authkey;

    Dio dio = new Dio();
    final response = await dio.get('${ApiUrl.userurl}/Profile',
        options: Options(
          headers: headers,
        ));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Profile.fromJson(json.decode(response.toString()));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
