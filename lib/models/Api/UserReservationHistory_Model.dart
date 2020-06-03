class UserReservationHistoryModel {
  final int id;
  final int no;
  final String parking;
  final String reservationtime;
  final String endtime;
  final String city;

  UserReservationHistoryModel(
      {this.id,
      this.no,
      this.parking,
      this.reservationtime,
      this.endtime,
      this.city});

  factory UserReservationHistoryModel.fromJson(Map<String, dynamic> json) {
    return UserReservationHistoryModel(
        id: json['id'],
        no: json['no'],
        parking: json['parking'],
        reservationtime: json['reservationtime'],
        endtime: json['endtime'],
        city: json['city']);
  }
}
