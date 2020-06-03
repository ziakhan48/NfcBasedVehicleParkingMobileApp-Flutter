class Profile {
  final String Name;
  final String Email;

  Profile({this.Name, this.Email});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(Name: json['name'], Email: json['email']);
  }
}
