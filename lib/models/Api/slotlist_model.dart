class SlotListModel {
  final int id;
  final int no;
  final String parking;
  final bool reserved;
  final int parkid;

  SlotListModel({this.id, this.no, this.parking, this.reserved, this.parkid});

  factory SlotListModel.fromJson(Map<String, dynamic> json) {
    return SlotListModel(
        id: json['id'],
        no: json['no'],
        parking: json['parking'],
        reserved: json['reserved'],
        parkid: json['parkid']);
  }
}
