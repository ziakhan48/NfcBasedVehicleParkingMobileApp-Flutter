class SlotReservationHistoryModel {
  final int id;
  final int no;
  final String parking;
  final bool reserved;
  final int parkid;

  SlotReservationHistoryModel({this.id, this.no, this.parking, this.reserved, this.parkid});

  factory SlotReservationHistoryModel.fromJson(Map<String, dynamic> json) {
    return SlotReservationHistoryModel(
        id: json['id'],
        no: json['no'],
        parking: json['parking'],
        reserved: json['reserved'],
        parkid: json['parkid']);
  }
}
