import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/SlotReservationHistory_Model.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/utils/apiurl.dart';


class SlotReservationHistoryService {
  static List<SlotReservationHistoryModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SlotReservationHistoryModel>((json) => SlotReservationHistoryModel.fromJson(json))
        .toList();
  }


static Future<List<SlotReservationHistoryModel>> fetchSlotReservationHistory() async {
 var authkey = await readToken();
    headers["Authorization"] = "Bearer " + authkey;

    // Dio dio = new Dio();

        final response = await http.get(
          '${ApiUrl.userurl}/SlotReservationHistory',
          headers: {HttpHeaders.authorizationHeader: "Bearer " + authkey},
    );
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}