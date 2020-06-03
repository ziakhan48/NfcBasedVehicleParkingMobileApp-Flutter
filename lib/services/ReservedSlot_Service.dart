import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/SlotReserved_Model.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/utils/apiurl.dart';

class ReservedSlotService {
  static List<SlotReservedModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SlotReservedModel>((json) => SlotReservedModel.fromJson(json))
        .toList();
  }

  static Future<List<SlotReservedModel>> fetchReservedSlot() async {
    var authkey = await readToken();
    headers["Authorization"] = "Bearer " + authkey;

    // Dio dio = new Dio();

    final response = await http.get(
      '${ApiUrl.userurl}/ReservedSlot',
      headers: {HttpHeaders.authorizationHeader: "Bearer " + authkey},
    );
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
