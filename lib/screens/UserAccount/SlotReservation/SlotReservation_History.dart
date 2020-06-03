import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/slotlistscreen.dart';
import 'package:parkit_com/services/SlotReservationHistory_Service.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/UserAccountWidget/UserProfile/Profile_Picture.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class ReservationSlotHistory extends StatefulWidget {
  @override
  _ReservationSlotHistoryState createState() => _ReservationSlotHistoryState();
}

class _ReservationSlotHistoryState extends State<ReservationSlotHistory> {
  String result2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
         iconTheme: IconThemeData( color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     print("Message sent");
          //   },
          // )
        ],
      
        
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white,
                    Colors.white,
                  ],
                  // stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 0.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                    ),
                    ProfilePicture(),
                    Container(
                      height: 1,
                      width: 400,
                      decoration: new BoxDecoration(
                        color: Colors.purple,
                        gradient: new LinearGradient(
                          colors: [Colors.red, Colors.cyan],
                        ),
                      ),
                    ),
                    
                    Row(children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                        child: Image.asset(
                          'lib/assets/images/parkimage.png',
                          width: 70,
                          height: 60,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 10, 0),
                        child: Text("Reservation Slot History",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ),
                    ]),
                    SizedBox(
                      height: 25,
                    ),
                    FutureBuilder(
                      future: SlotReservationHistoryService.fetchSlotReservationHistory(),
                      builder: (context, snapshot) {
                        final reservationHistory = snapshot.data;
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Container(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 100,
                                  color: Colors.grey,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Card(
                                  child: Container(
                                      width: 330,
                                      height: 130,
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),

                                      //Row 1
                                      child: Row(children: <Widget>[
                                        //Column 1
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 80, 0, 0),
                                              height: 130,
                                              width: 120,
                                              decoration: BoxDecoration(
                                                image: new DecorationImage(
                                                  image: new AssetImage(
                                                      'lib/assets/images/slotcar.png'),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        //Column 2
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      60, 0, 80, 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        height: 30,
                                                        width: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Hexcolor(
                                                              '#e9c749'),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 6),
                                                          child: Text(
                                                            reservationHistory[index]
                                                                        .parking !=
                                                                    null
                                                                ? reservationHistory[
                                                                        index]
                                                                    .parking
                                                                : "parkingname",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 14),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 7, 30, 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    reservationHistory[index]
                                                                .no
                                                                .toString() !=
                                                            null
                                                        ? "Slot No:" +
                                                            reservationHistory[index]
                                                                .no
                                                                .toString()
                                                        : "no",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(30, 0, 0, 0),
                                                    child: Text(
                                                      reservationHistory[index]
                                                                  .id
                                                                  .toString() !=
                                                              null
                                                          ? "Reservation Id:" +
                                                              reservationHistory[index]
                                                                  .id
                                                                  .toString()
                                                          : "reser id",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 7, 0, 0),
                                              child: Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(60, 0, 0, 0),
                                                    child: RaisedButton(
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (_) =>
                                                                    SlotListScreen(
                                                                        reservationHistory[index]
                                                                            .id)),
                                                          );
                                                        },
                                                        textColor: Colors.white,
                                                        color: Colors.green,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0.0),
                                                        child: Container(
                                                          width: 40,
                                                          height: 20,

                                                          // padding: const EdgeInsets.all(10.0),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    0, 0, 0, 0),
                                                            child: const Text(
                                                                'Detail',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        )),
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
                              itemCount: reservationHistory.length,
                            ),
                          );
                        }
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(4),
    );
  }
}
