class SlotReservedModel {
  final int id;
  final int no;
  final String parking;
  final bool reserved;
  final int parkid;

  SlotReservedModel(
      {this.id, this.no, this.parking, this.reserved, this.parkid});

  factory SlotReservedModel.fromJson(Map<String, dynamic> json) {
    return SlotReservedModel(
        id: json['id'],
        no: json['no'],
        parking: json['parking'],
        reserved: json['reserved'],
        parkid: json['parkid']);
  }
}
