import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkit_com/widgets/GoogleMap_Widgets/ParkingGoogleMap2_Widget.dart';

import 'MapParkingCard_Widget.dart';

class GooglemapWidget extends StatefulWidget {
  GooglemapWidget(String city) {
    this.city = city;
  }
  String city;
  @override
  _GooglemapWidgetState createState() => _GooglemapWidgetState(city);
}

class _GooglemapWidgetState extends State<GooglemapWidget> {
  _GooglemapWidgetState(String city) {
    this.city = city;
  }
  String city;
  // final Set<Marker> _markers = Set();
  // final double _zoom = 12;
  // CameraPosition _initialPosition =
  //     CameraPosition(target: LatLng(31.582045, 74.329376));
   MapType _defaultMapType = MapType.normal;
  // Completer<GoogleMapController> _controller = Completer();

  // void _onMapCreated(GoogleMapController controller) {
  //   _controller.complete(controller);
  // }

  void _changeMapType() {
    setState(() {
      _defaultMapType = _defaultMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // GoogleMap(
        //   markers: _markers,
        //   mapType: _defaultMapType,
        //   myLocationEnabled: true,
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: _initialPosition,
        // ),
        ParkingGoogleMap2(city),
        Container(
          margin: EdgeInsets.only(top: 80, right: 10),
          alignment: Alignment.topRight,
          child: Column(
            children: <Widget>[
              FloatingActionButton(
                  child: Icon(Icons.layers),
                  elevation: 5,
                  backgroundColor: Colors.teal[200],
                  onPressed: () {
                     _changeMapType();
                     print('Changing the Map Type');
                  }),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 440, bottom: 20),
          child: MapParkingCard(city),
        )
      ],
    );
  }
}

