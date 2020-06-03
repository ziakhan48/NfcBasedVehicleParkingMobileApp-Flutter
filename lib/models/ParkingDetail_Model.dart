class ParkingDetailModel {
  final String Parking;
  final int Slots;
  final int Id;
  final String City;
  final String Address;
  final String Description;
  final int Review;

  ParkingDetailModel({
    this.Parking,
    this.Slots,
    this.Id,
    this.City,
    this.Address,
    this.Description,
    this.Review,
  });

  factory ParkingDetailModel.fromJson(Map<String, dynamic> json) {
    return ParkingDetailModel(
      Parking: json['parking'],
      Slots: json['slots'],
      Id: json['id'],
      City: json['city'],
      Address: json['address'],
      Description: json['description'],
      Review: json['review'],
    );
  }
}
