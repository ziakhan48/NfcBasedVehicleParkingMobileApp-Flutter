import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkit_com/services/ParkingMapLocation_Service.dart';

class ParkingGoogleMap2 extends StatefulWidget {
  ParkingGoogleMap2(String city) {
    this.city = city;
  }
  String city;
  @override
  _ParkingGoogleMap2State createState() => _ParkingGoogleMap2State(city);
}

class _ParkingGoogleMap2State extends State<ParkingGoogleMap2> {
  _ParkingGoogleMap2State(String city) {
    this.city = city;
  }

  String city;
  double cityLan;
  double cityLat;
  LatLng _center;
  final Map<String, Marker> _markers = {};
  MapType _defaultMapType = MapType.normal;
  Future<void> _onMapCreated(GoogleMapController controller) async {
    
    final parkingMapLOcation =
        await ParkingMapLocationService.fetchParkingMapLocation(city);
         for (final parkingmap in parkingMapLOcation) {
            cityLat=parkingmap.CityLatitude;
            cityLan=parkingmap.CityLongitude;
            break;

         }

         _center =  LatLng(31.5204, 74.3587);
    setState(() {
      _markers.clear();
      for (final parkingmap in parkingMapLOcation) {
        final marker = Marker(
          markerId: MarkerId(parkingmap.ParkingName),
          position: LatLng(parkingmap.ParkingLatitude, parkingmap.ParkingLongitude),
          
          icon: BitmapDescriptor.fromAsset("lib/assets/images/ee.png"),
          infoWindow: InfoWindow(
            title: parkingmap.ParkingName,
            snippet: parkingmap.CityName,
          ),
        );
        _markers[parkingmap.ParkingName] = marker;
      }
    });
  }
 void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return  GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(31.5204, 74.3587),
            zoom: 9,
          ),
          markers: _markers.values.toSet(),
        );
      
    
  }
}
