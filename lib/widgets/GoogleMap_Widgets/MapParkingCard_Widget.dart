import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/Api/parkinglist_model.dart';
import 'package:parkit_com/screens/ParkingDetail_Screen.dart';
import 'package:parkit_com/screens/slotlistscreen.dart';
import 'package:parkit_com/services/parkinglistservice.dart';

class MapParkingCard extends StatefulWidget {
  MapParkingCard(String city) {
    this.city = city;
  }
  String city;
  @override
  _MapParkingCardState createState() => _MapParkingCardState(city);
}

class _MapParkingCardState extends State<MapParkingCard> {
  _MapParkingCardState(String city) {
    this.city = city;
  }

  String city;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ParkingListService.fetchParkingListByCity(city),
      builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none &&
            projectSnap.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        return ListView.builder(
          itemCount: projectSnap.data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            ParkingListModel parking = projectSnap.data[index];
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
                              height: 150,
                              width: 146,
                              decoration: BoxDecoration(
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(parking.image != null
                                      ? parking.image
                                      : "lib/assets/images/g7.jpg"),
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
                                    parking.name != null
                                        ? parking.name
                                        : "Parking",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: Hexcolor('#008b45'),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          parking.city != null
                                              ? parking.city
                                              : "City",
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
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Container(
                                          width: 100,
                                          child: RaisedButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              10.0))),
                                              onPressed: () {
                                                 Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ParkingDetailScreen(
                                                             parking.id)),
                                                );
                                              },
                                              textColor: Colors.white,
                                              color: Colors.pink,
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 0, 5, 0),
                                              child: Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        color: Colors.pink,
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 4, 4, 4),
                                                        child: Text(
                                                          'Deal',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                4, 0, 10, 0),
                                                        child: Icon(
                                                          Icons.directions_car,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  )))),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
          },
        );
      },
    );
  }
}
