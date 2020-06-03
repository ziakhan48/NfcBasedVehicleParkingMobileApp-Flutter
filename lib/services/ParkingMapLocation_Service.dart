import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/ParkingMapLocation_Model.dart';
import 'package:parkit_com/utils/apiurl.dart';


class ParkingMapLocationService {
  static List<ParkingMapLocationModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ParkingMapLocationModel>((json) => ParkingMapLocationModel.fromJson(json))
        .toList();
  }



  static Future<List<ParkingMapLocationModel>> fetchParkingMapLocation(String city) async {
    final response = await http.get('${ApiUrl.url}/ParkingMap/'+city);
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
