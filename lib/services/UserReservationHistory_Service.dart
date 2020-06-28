import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:parkit_com/models/Api/UserReservationHistory_Model.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/utils/apiurl.dart';

class UserReservationHistoryService {
  static Future<UserReservationHistoryModel> fetchReservationHistory(
      int reservationId) async {
    var authkey = await readToken();
    headers["Authorization"] = "Bearer " + authkey;
 
    Dio dio = new Dio();
    final response = await dio.get(
        '${ApiUrl.userurl}/UnreservedSlot/' + reservationId.toString(),
        options: Options(
          headers: headers,
        ));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return UserReservationHistoryModel.fromJson(json.decode(response.toString()));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}