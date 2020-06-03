class SlotReservationDetailModel {
  final int id;
  final int no;
  final String parking;
  final bool reserved;
  final String reservationtime;
  final String endtime;
  final String address;
  final String description;
  final String city;

  SlotReservationDetailModel(
      {this.id,
      this.no,
      this.parking,
      this.reserved,
      this.reservationtime,
      this.endtime,
      this.address,
      this.description,
      this.city});

  factory SlotReservationDetailModel.fromJson(Map<String, dynamic> json) {
    return SlotReservationDetailModel(
        id: json['id'],
        no: json['no'],
        parking: json['parking'],
        reserved: json['reserved'],
        reservationtime: json['reservationtime'],
        endtime: json['endtime'],
        address: json['address'],
        description: json['description'],
        city: json['city']);
  }
}
