import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/Slotreservation.dart';
import 'package:parkit_com/services/parkinglistservice.dart';
import 'package:parkit_com/services/slotlistservice.dart';

class SlotDesign extends StatefulWidget {
  int id;

  SlotDesign(int id) {
    this.id = id;
  }
  _SlotDesign createState() => _SlotDesign(id);
}

class _SlotDesign extends State<SlotDesign> {
  int id;
  _SlotDesign(int id) {
    this.id = id;
  }
  // Future<List<ParkingList>> futureAlbum;
  ParkingListService obj = new ParkingListService();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
        width: 350,
        height: 122,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Image.asset(
                  'lib/assets/images/parkimage.png',
                  width: 90,
                  height: 90,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text("Parking Slots Zone",
                    style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ),
            ]),
          ],
        ),
      ),

      FutureBuilder(
        future: SlotListService.fetchParkingListByParkId(id),
        builder: (context, snapshot) {
          final parkings = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: 250,
              child: Wrap(
                alignment: WrapAlignment.start,
                children: <Widget>[
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return Divider(
                        height: 15,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        height: 250,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.white,
                          elevation: 5,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "Slot No : " + parkings[index].no.toString(),
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  parkings[index].parking,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 19),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Image.asset(
                                  "lib/assets/images/slotcar.png",
                                  height: 70,
                                  width: 100,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: _reservation_status(
                                    parkings[index].reserved,
                                    parkings[index].id,
                                    parkings[index].parkid),

                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: parkings.length,
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      SizedBox(height: 40),
      //card 2

//card
    ]));
  }



  Widget _reservation_status(bool reser, int id,int parkid) {
    if (reser == false) {
      return Container(
          height: 100,
          width: 200,
          child: Column(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Hexcolor('#00997b')),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                  child: Text(
                    "F",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 15,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => SlotReservation(id,parkid)),
                    );
                  },
                  textColor: Colors.white,
                  color: Hexcolor('#e9c749'),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 65,
                    height: 20,
                  
                    // padding: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const Text('Reserved',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ],
          ));
    } else if (reser == true) {
      return Container(
          height: 100,
          width: 200,
          child: Column(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                  child: Text(
                    "R",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
              RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 15,
                  textColor: Colors.white,
                  onPressed: null,
                  color: Colors.blueGrey,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 65,
                    height: 20,

                    // padding: const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: const Text('Reserved',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold)),
                    ),
                  )),
            ],
          ));
    }
  }
}
