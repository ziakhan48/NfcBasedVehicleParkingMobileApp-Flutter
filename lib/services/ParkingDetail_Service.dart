import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/ParkingDetail_Model.dart';
import 'package:parkit_com/utils/apiurl.dart';

class ParkingDetailService {
  static Future<ParkingDetailModel> fetchParkingDetail(int id) async {
    final response =
        await http.get('${ApiUrl.url}/ParkingDetail/' + id.toString());
    if (response.statusCode == 200) {
      return ParkingDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
