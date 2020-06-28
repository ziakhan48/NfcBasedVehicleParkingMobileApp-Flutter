import 'package:parkit_com/models/Api/SlotReservation_model.dart';

class SlotReservationController {
  var Model = SlotReservationModel();
  static final _controller = SlotReservationController._internal();
  SlotReservationController._internal();

  factory SlotReservationController() {
    return _controller;
  }

  String Phone_Validate(String text) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (text.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(text)) {
      return 'Please enter valid mobile number';
    }
    print("Reservation: Phone Validation Passed");
    this.Model.phone = text;
    return "";
  }

  String FullName_Validator(String text) {
    if (text.length < 5) {
      return "Invalid";
    } else if ((text.split(" ")).length < 2) {
      return "Invalid";
    }

    print("SignUp: FullName Validation Passed");
    this.Model.name = text;
    return "";
  }

  String No_Validator(String text) {
    print("SlotReservation: Vehicle No Validation Passed");
    this.Model.no = text;
    return "";
  }

  String Id_Validator(String text) {
    this.Model.id = text;
    return "";
  }

  String type_Validator(String text) {
    if (!(text == "car" ||
        text == "Car" ||
        text == "bus" ||
        text == "Bus" ||
        text == "Van" ||
        text == "van" ||
        text == "bike" ||
        text == "Bike" ||
        text == "jeep" ||
        text == "Jeep")) {
      return "Invalid";
    }

    print("SlotReservation: type Validation Passed");
    this.Model.type = text;
    return "";
  }

  String Email_Validator(String text) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (text.length < 5) {
      return "Email is Invalid";
    } else if (!regex.hasMatch(text)) {
      return "Email is Invalid";
    }

    print("SignUp: Email Validation Passed");
    this.Model.email = text;
    return "";
  }

  String City_Validator(String text) {
    if (text.length < 3) {
      return "Invalid City Name";
    }

    print("SlotReservation: City Validation Passed");
    this.Model.city = text;
    return "";
  }

  String ZipCode_Validation(String text) {
    print("SlotReservation: Vehicle No Validation Passed");
    this.Model.zipCode = text;
    return "";
  }

  String NoOfHours_Validator(String text) {
    print("SlotReservation: Vehicle No Validation Passed");
    this.Model.noOfhours = text;
    return "";
  }
}
