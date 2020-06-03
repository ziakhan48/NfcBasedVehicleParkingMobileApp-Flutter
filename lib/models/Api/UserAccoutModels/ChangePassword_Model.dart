

class ChangePassword_Model{
  static final _controller = ChangePassword_Model._internal();
  ChangePassword_Model._internal();


  factory ChangePassword_Model() {
    return _controller;
  }

  String CurrentPassword;
  String NewPassword;

  String getCurrentPassword(){
    return this.CurrentPassword;
  }


  String getNewPassword(){
      return this.NewPassword;
  }

  void setCurrentPassword(currentpassword){
    this.CurrentPassword = currentpassword;
  }

  

  void setNewPassword(newpassword){
    this.NewPassword = newpassword;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["currentpassword"] = this.CurrentPassword;
    map["newpassword"] = this.NewPassword;
    return map;
  }
}