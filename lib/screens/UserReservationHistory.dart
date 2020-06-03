import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/Api/UserReservationHistory_Model.dart';
import 'package:parkit_com/screens/AddReview_Screen.dart';
import 'package:parkit_com/services/UserReservationHistory_Service.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/UserAccountWidget/UserProfile/Profile_Picture.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class UserReservationHistory extends StatefulWidget {
  int reservationId;

  UserReservationHistory(int reservationId) {
    this.reservationId = reservationId;
  }
  _UserReservationHistoryState createState() =>
      _UserReservationHistoryState(reservationId);
}

class _UserReservationHistoryState extends State<UserReservationHistory> {
  int reservationId;

  _UserReservationHistoryState(int reservationId) {
    this.reservationId = reservationId;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Hexcolor('#e9c749'),
        title: Appbar(),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                  child: ProfilePicture(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                  child: Container(
                    height: 1,
                    width: 400,
                    decoration: new BoxDecoration(
                      color: Colors.purple,
                      gradient: new LinearGradient(
                        colors: [Colors.red, Colors.cyan],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: FutureBuilder<UserReservationHistoryModel>(
                      future:
                          UserReservationHistoryService.fetchReservationHistory(
                              reservationId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 50, 0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'your Reservation History',
                                      style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 40, 0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 300,
                                      width: 370,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Reservation Id",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 115,
                                              ),
                                              Text(
                                                snapshot.data.id.toString() !=
                                                        null
                                                    ? snapshot.data.id
                                                        .toString()
                                                    : "some Id",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Slot No',
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 167,
                                              ),
                                              Text(
                                                snapshot.data.no.toString() !=
                                                        null
                                                    ? snapshot.data.no
                                                        .toString()
                                                    : "slot no",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Parking Name",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 110,
                                              ),
                                              Text(
                                                snapshot.data.parking != null
                                                    ? snapshot.data.parking
                                                    : "parking",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "Parking City",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 120,
                                              ),
                                              Text(
                                                snapshot.data.city != null
                                                    ? snapshot.data.city
                                                    : "city",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "ReservationDate",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 80,
                                              ),
                                              Text(
                                                snapshot.data.reservationtime !=
                                                        null
                                                    ? snapshot
                                                        .data.reservationtime
                                                    : "time",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                "End Time",
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(
                                                width: 130,
                                              ),
                                              Text(
                                                snapshot.data.endtime != null
                                                    ? snapshot.data.endtime
                                                    : "endtime",
                                                style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 60, 0),
                                width: double.infinity,
                                child: RaisedButton(
                                  elevation: 5.0,
                                  onPressed: () async {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Addreview(
                                                snapshot.data.parking)));
                                  },
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  color: Hexcolor('#e9c749'),
                                  child: Text(
                                    'Shared Review',
                                    style: TextStyle(
                                      color: Colors.white,
                                      letterSpacing: 1.5,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
        padding: const EdgeInsets.fromLTRB(60, 100, 0, 0),
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
