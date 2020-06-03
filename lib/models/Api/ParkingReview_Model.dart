class ParkingReviewModel {
  final String Name;
  final String Review;
  final int Reviews;

  ParkingReviewModel({this.Name, this.Review, this.Reviews});

  factory ParkingReviewModel.fromJson(Map<String, dynamic> json) {
    return ParkingReviewModel(
      Name: json['name'],
      Review: json['review'],
      Reviews: json['reviews'],
      // parkingname: json['contents']['quotes'][0]['author'],
      // city: json['contents']['quotes'][0]['quote'],
      // noOfslot: json['contents']['quotes'][0]['quote'],
    );
  }
}
