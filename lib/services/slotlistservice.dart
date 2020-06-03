import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/slotlist_model.dart';
import 'package:parkit_com/utils/apiurl.dart';


class SlotListService {
  static List<SlotListModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SlotListModel>((json) => SlotListModel.fromJson(json))
        .toList();
  }


  static Future<List<SlotListModel>> fetchParkingListByParkId(int id) async {
    final response = await http.get('${ApiUrl.url}/Slots/'+id.toString());
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}