class RecomendationModel {
  final String Parking;
  final int AverageReview;
  final int Id;
  final String Image;

  RecomendationModel({this.Parking, this.AverageReview, this.Id,this.Image});

  factory RecomendationModel.fromJson(Map<String, dynamic> json) {
    return RecomendationModel(
        Id: json['id'],
        Parking: json['parking'],
        AverageReview: json['averagereview'],
         Image: json['image']);
  }
}
