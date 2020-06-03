class AddReviewModel {
  static final _controller = AddReviewModel._internal();
  AddReviewModel._internal();

  factory AddReviewModel() {
    return _controller;
  }

  String Parking;
  String Name;
  String Review;
  String ReviewNo;

  String getParking() {
    return this.Parking;
  }

  String getName() {
    return this.Name;
  }

  String getReview() {
    return this.Review;
  }

  String getReviewNo() {
    return this.ReviewNo;
  }

  void setParking(parking) {
    this.Parking = parking;
  }

  void setName(name) {
    this.Name = name;
  }

  void setReview(review) {
    this.Review = review;
  }

  void setReviewNo(reviewno) {
    this.ReviewNo = reviewno;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["parking"] = this.Parking;
    map["name"] = this.Name;
    map["review"] = this.Review;
    map["reviewno"] = this.ReviewNo;
    return map;
  }
}
