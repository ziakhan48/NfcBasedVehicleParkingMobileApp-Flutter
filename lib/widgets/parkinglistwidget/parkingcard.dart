import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/GoogleMap_Screen.dart';
import 'package:parkit_com/screens/ParkingDetail_Screen.dart';
import 'package:parkit_com/screens/slotlistscreen.dart';
import 'package:parkit_com/services/parkinglistservice.dart';

class ParkingCard extends StatefulWidget {
  ParkingCard(String city) {
    this.city = city;
  }

  String city;

  _Parkingcard createState() => _Parkingcard(city);
}

class _Parkingcard extends State<ParkingCard> {
  String city;
  _Parkingcard(String city) {
    this.city = city;
  }
  // Future<List<ParkingList>> futureAlbum;
  ParkingListService obj = ParkingListService();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
      Container(
        width: 350,
        height: 132,
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Image.asset(
                  'lib/assets/images/parkimage.png',
                  width: 90,
                  height: 90,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text("Parking List",
                    style: TextStyle(
                        color: Hexcolor('#ffae19'),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 27,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Hexcolor('#ffae19'),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      city != null ? city : "no City",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),

      Padding(
        padding: const EdgeInsets.fromLTRB(250, 0, 0, 30),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GoogleMapMain(city)),
            );
          },
          child: Container(
            width: 140,
            height: 60,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 12.0,
                ),
              ],
              // borderRadius: BorderRadius.circular(20),
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("lib/assets/images/map.jpg"),
              ),
            ),
          ),
        ),
      ),

      FutureBuilder(
        future: ParkingListService.fetchParkingListByCity(city),
        builder: (context, snapshot) {
          final parkings = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 50,
                    color: Colors.white,
                  );
                },
                itemBuilder: (context, index) {
                  return Card(
                    color: Hexcolor("#f3f7f6"),
                    child: Container(
                        width: 350,
                        height: 170,
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
                                  height: 160,
                                  width: 137,
                                  decoration: BoxDecoration(
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          parkings[index].image != null
                                              ? parkings[index].image
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 40, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        parkings[index].name,
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

                                        parkings[index].slot.toString() +
                                            " Slots",
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
                                padding: const EdgeInsets.fromLTRB(10, 7, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                      width: 75,
                                      decoration: BoxDecoration(
                                          color: Hexcolor('#008b45'),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          parkings[index].city,
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
                                          30, 0, 0, 0),
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
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5, 7, 0, 0),
                                child: Row(
                                  children: <Widget>[
                                    // Text(
                                    //   // employees[index].noOfslot,
                                    //   //  parkings[index].noofslot,

                                    //   parkings[index].slot.toString() +
                                    //       " Slots",
                                    //   style: TextStyle(
                                    //       color:  Hexcolor('#008b45'),
                                    //       fontStyle: FontStyle.italic,
                                    //       fontSize: 13,
                                    //       fontWeight: FontWeight.bold),
                                    // ),
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
                                                          SlotListScreen(
                                                              parkings[index]
                                                                  .id)),
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
                                                          'slots',
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
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Container(
                                          width: 110,
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
                                                              parkings[index]
                                                                  .id)),
                                                );
                                              },
                                              textColor: Colors.white,
                                              color: Hexcolor('#ffae19'),
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
                                                        color:
                                                            Hexcolor('#ffae19'),
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10, 4, 4, 4),
                                                        child: Text(
                                                          'Detail',
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
                                                          Icons
                                                              .perm_device_information,
                                                          color: Colors.white,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  )))),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                          //input text
                        ])),
                  );
                },
                itemCount: parkings.length,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      SizedBox(
        height: 40,
      ),
      //card 2

//card
    ]));
  }
}
