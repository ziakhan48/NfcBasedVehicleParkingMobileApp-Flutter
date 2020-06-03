import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/ParkingReview_Model.dart';
import 'package:parkit_com/utils/apiurl.dart';

class ParkingreviewService {
  static List<ParkingReviewModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ParkingReviewModel>((json) => ParkingReviewModel.fromJson(json))
        .toList();
  }

  static Future<List<ParkingReviewModel>> fetchParkingReviewList(
      int id) async {
    final response = await http.get('${ApiUrl.url}/AddReview/' + id.toString());
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
