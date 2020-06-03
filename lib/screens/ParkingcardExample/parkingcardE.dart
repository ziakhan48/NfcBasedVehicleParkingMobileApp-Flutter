import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/global.dart';
import 'package:parkit_com/models/technician.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center =  LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            myLocationButtonEnabled: false,
          ),
          Container(
            padding: EdgeInsets.only(top: 500, bottom: 50),
            child: ListView(
              padding: EdgeInsets.only(left: 20),
              children: getTechniciansInArea(),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      )),
    );
  }

  List<Technician> getTechies() {
    List<Technician> techies = [];
    for (int i = 0; i < 10; i++) {
      AssetImage profilePic = AssetImage("lib/assets/images/sp3.png");
      Technician myTechy = Technician(
          "Carlos Teller",
          "070-379-031",
          "First road 23 elm street",
          529.3,
          4,
          "Available",
          profilePic,
          "Electrician");
      techies.add(myTechy);
    }
    return techies;
  }

  List<Widget> getTechniciansInArea() {
    List<Technician> techies = getTechies();
    List<Widget> cards = [];
    for (Technician techy in techies) {
      cards.add(technicianCard(techy));
    }
    return cards;
  }
}

Map statusStyles = {
  'Available': statusAvailableStyle,
  'Unavailable': statusUnavailableStyle
};

Widget technicianCard(Technician technician) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Card(
      child: Container(
          width: 350,
          height: 130,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

          //Row 1
          child: Row(children: <Widget>[
            //Column 1
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    height: 193,
                    width: 146,
                    decoration: BoxDecoration(
                    
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            // parkings[index].image != null
                            //     ? parkings[index].image:
                            "lib/assets/images/g7.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Column 2
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          // parkings[index].name,
                          "Civic Parking",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Text(
                          // employees[index].noOfslot,
                          //  parkings[index].noofslot,

                          // parkings[index].slot.toString() +
                          "10 Slots",
                          style: TextStyle(
                              color: Hexcolor('#008b45'),
                              fontStyle: FontStyle.italic,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 30,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Hexcolor('#008b45'),
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // parkings[index].city,
                            "Lahore",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.green[500],
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.green[500],
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.green[500],
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                " 10 review",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
            //input text
          ])),
    ),
  );
}


