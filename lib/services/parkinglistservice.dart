import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/parkinglist_model.dart';
import 'package:parkit_com/utils/apiurl.dart';


class ParkingListService {
  static List<ParkingListModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ParkingListModel>((json) => ParkingListModel.fromJson(json))
        .toList();
  }

  static Future<List<ParkingListModel>> fetchParkingList() async {
    final response = await http.get('${ApiUrl.url}/Parkings');
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }

  static Future<List<ParkingListModel>> fetchParkingListByCity(String city) async {
    final response = await http.get('${ApiUrl.url}/Parkings/'+city);
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
