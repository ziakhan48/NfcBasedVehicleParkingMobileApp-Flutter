class UserProfile {
  final String id;
  final String Name;
  final String Email;
  final String Phone;
  final String City;
  final String Address;

  UserProfile(
      {this.id, this.Name, this.Email, this.Phone, this.City, this.Address});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
        id: json['id'],
        Name: json['name'],
        Email: json['email'],
        Phone: json['phone'],
        City: json['city'],
        Address: json['address']);
  }
}
