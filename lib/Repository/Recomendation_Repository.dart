import 'package:parkit_com/models/Api/Recomendation_Model.dart';
import 'package:parkit_com/services/Recomendation_Service.dart';

class RecomendationRepository {
  static List<RecomendationModel> Repomethode(String city) {
    List<RecomendationModel> _recomendationList =
        List() as List<RecomendationModel>;

    final recomendationList = RecomendationService.RecomendedParkings(city);

    if (recomendationList != null) {
      _recomendationList = recomendationList as List;
    }

    return _recomendationList;
  }
}
