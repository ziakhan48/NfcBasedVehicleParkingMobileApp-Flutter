class ProfileUpdate_Model {
  static final _controller = ProfileUpdate_Model._internal();
  ProfileUpdate_Model._internal();

  factory ProfileUpdate_Model() {
    return _controller;
  }

  String Email;
  String FullName;
  String Phone;
  String City;
  String Address;

  String getEmail() {
    return this.Email;
  }

  String getPhone() {
    return this.Phone;
  }

  String getAddress() {
    return this.Address;
  }

  String getFullName() {
    return this.FullName;
  }

  String getCity() {
    return this.City;
  }

  void setEmail(email) {
    this.Email = email;
  }

  void setFullName(name) {
    this.FullName = name;
  }

  void setCity(city) {
    this.City = city;
  }

  void setPhone(phone) {
    this.Phone = phone;
  }

  void setAddress(address) {
    this.Address = address;
  }

  _EmailToUser() {
    return this.Email.split("@")[0];
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["address"] = this.Address;
    map["email"] = this.Email;
    map["fullname"] = this.FullName;
    map["phone"] = this.Phone;
    map["city"] = this.City;

    return map;
  }
}
