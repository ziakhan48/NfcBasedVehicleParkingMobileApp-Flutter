class ParkingMapLocationModel {
  final String CityName;
  final String ParkingName;
  final double CityLatitude;
  final double CityLongitude;
  final double ParkingLatitude;
  final double ParkingLongitude;

  ParkingMapLocationModel(
      {this.CityName,
      this.ParkingName,
      this.CityLatitude,
      this.CityLongitude,
      this.ParkingLatitude,
      this.ParkingLongitude});

  factory ParkingMapLocationModel.fromJson(Map<String, dynamic> json) {
    return ParkingMapLocationModel(
        CityName: json['cityName'],
        ParkingName: json['parkingName'],
        CityLatitude: json['cityLatitude'],
        CityLongitude: json['cityLongitude'],
        ParkingLatitude: json['parkingLatitude'],
        ParkingLongitude: json['parkingLongitude']);
  }
}
