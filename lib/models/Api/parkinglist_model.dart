class ParkingListModel {
  final String name;
  final String city;
  final int slot;
  final int id;
  final String image;

  ParkingListModel({this.name, this.city, this.slot, this.id, this.image});

  factory ParkingListModel.fromJson(Map<String, dynamic> json) {
    return ParkingListModel(
        name: json['name'],
        city: json['city'],
        slot: json['slot'],
        id: json['id'],
        image: json['image']
        );
  }
}
