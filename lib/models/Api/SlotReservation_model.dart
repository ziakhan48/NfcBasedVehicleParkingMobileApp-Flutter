
class SlotReservationModel{
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

  String getid(){
    return this.id;
  }

  String getname(){
      return this.name;
  }

  String getno(){
      return this.no;
  }
   String gettype(){
      return this.type;
  }

 String getphone(){
      return this.phone;
  }


  void setid(id){
    this.id = id;
  }

  void setname(name){
    this.name = name;
  }

  void setphone(phone){
    this.phone = phone;
  }

   void settype(type){
    this.type = type;
  }

   void setno(no){
    this.no = no;
  }


  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = this.id;
    map["name"] = this.name;
    map["phone"] = this.phone;
    map["type"] = this.type;
     map["no"] = this.no;
    return map;
  }
}