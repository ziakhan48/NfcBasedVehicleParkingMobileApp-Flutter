class SlotReservationModel {
  static final _controller = SlotReservationModel._internal();
  SlotReservationModel._internal();

  factory SlotReservationModel() {
    return _controller;
  }

  String id;
  String phone;
  String name;
  String no;
  String type;
  String email;
  String city;
  String noOfhours;
  String zipCode;

  String getid() {
    return this.id;
  }

  String getemail() {
    return this.email;
  }

  String getcity() {
    return this.city;
  }

  String getnoOfhours() {
    return this.noOfhours;
  }

  String getZipCode() {
    return this.zipCode;
  }

  String getname() {
    return this.name;
  }

  String getno() {
    return this.no;
  }

  String gettype() {
    return this.type;
  }

  String getphone() {
    return this.phone;
  }

  void setid(id) {
    this.id = id;
  }

  void setemail(email) {
    this.email = email;
  }

  void setcity(city) {
    this.city = city;
  }

  void setnoOfhours(noOfhours) {
    this.noOfhours = noOfhours;
  }

  void setzipCode(zipCode) {
    this.zipCode = zipCode;
  }

  void setname(name) {
    this.name = name;
  }

  void setphone(phone) {
    this.phone = phone;
  }

  void settype(type) {
    this.type = type;
  }

  void setno(no) {
    this.no = no;
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = this.id;
    map["name"] = this.name;
    map["phone"] = this.phone;
    map["type"] = this.type;
    map["no"] = this.no;
    map['email'] = this.email;
    map['city'] = this.city;
    map['noOfhours'] = this.noOfhours;
    map['zipCode'] = this.zipCode;
    return map;
  }
}
