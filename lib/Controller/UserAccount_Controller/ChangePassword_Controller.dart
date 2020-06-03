
import 'package:parkit_com/models/Api/UserAccoutModels/ChangePassword_Model.dart';

class ChangePasswordController{
  var Model =  ChangePassword_Model();
  static final _controller = ChangePasswordController._internal();
  ChangePasswordController._internal();
  String Password;

  factory ChangePasswordController() {
    return _controller;
  }

String CurrentPassword_Validator(String text){
    if(text.length < 6){
      return "Invalid";
    }

    this.Model.CurrentPassword = text;
    print("ChangePassword: Current Password Validation Passed");
    return "";
  }

  String NewPassword_Validator(String text){
    if(text.length < 6){
      return "Invalid";
    }

    this.Password = text;
    print("ChangePassword: New Password Validation Passed");
    return "";
  }

  String ConfirmPassword_Validator(String text){
    print(this.Password);
    print(text);
    if(text.length < 6){
      return "Invalid";
    }else if(this.Password != text){
      return "Invalid";
    }

    print("ChangePassword: Confirm Password Validation Passed");
    this.Model.NewPassword = text;
    return "";
  }

}