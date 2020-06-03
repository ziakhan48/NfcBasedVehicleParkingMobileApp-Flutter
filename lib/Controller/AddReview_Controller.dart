import 'package:parkit_com/models/Api/AddReview_Model.dart';

class AddReviewController {
  var Model = AddReviewModel();
  static final _controller = AddReviewController._internal();
  AddReviewController._internal();

  factory AddReviewController() {
    return _controller;
  }

  String Parking_Validation(String text) {
    print("Reservation: Phone Validation Passed");
    this.Model.Parking = text;
    return "";
  }

  String UserName_Validator(String text) {
    if (text.length < 5) {
      return "Invalid";
    } else if ((text.split(" ")).length < 2) {
      return "Invalid";
    }

    print("SignUp: FullName Validation Passed");
    this.Model.Name = text;
    return "";
  }

  String Review_Validator(String text) {
    print("SlotReservation: Vehicle No Validation Passed");
    this.Model.Review = text;
    return "";
  }

  String ReviewNo_Validator(String text) {
    this.Model.ReviewNo = text;
    return "";
  }
}
