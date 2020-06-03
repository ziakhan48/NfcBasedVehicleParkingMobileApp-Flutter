import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parkit_com/models/Api/Recomendation_Model.dart';
import 'package:parkit_com/utils/apiurl.dart';


class RecomendationService {
  static List<RecomendationModel> parseProducts(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<RecomendationModel>((json) => RecomendationModel.fromJson(json))
        .toList();
  }



  static Future<List<RecomendationModel>> RecomendedParkings(String city) async {
    final response = await http.get('${ApiUrl.url}/Recomendation/'+city);
    if (response.statusCode == 200) {
      return parseProducts(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
