import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/ParkingDetail_Model.dart';
import 'package:parkit_com/screens/slotlistscreen.dart';
import 'package:parkit_com/services/ParkingDetail_Service.dart';
import 'package:parkit_com/utilities/TextStyles.dart';
import 'package:parkit_com/utilities/consts.dart';

class ParkingDetailOverview extends StatefulWidget {
  int id;

  ParkingDetailOverview(int id) {
    this.id = id;
  }
  _ParkingDetailOverview createState() => _ParkingDetailOverview(id);
}

class _ParkingDetailOverview extends State<ParkingDetailOverview> {
  int id;
  _ParkingDetailOverview(int id) {
    this.id = id;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Center(
              child: Column(children: <Widget>[
            FutureBuilder<ParkingDetailModel>(
                future: ParkingDetailService.fetchParkingDetail(id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BoldText(
                              snapshot.data.Parking != null
                                  ? snapshot.data.Parking
                                  : "Name",
                              20.0,
                              kblack),
                          Row(
                            children: <Widget>[
                              BoldText(
                                  snapshot.data.Review.toString() != null
                                      ? snapshot.data.Review.toString() +
                                          " Stars"
                                      : "Stars",
                                  12.0,
                                  korange),
                              SizedBox(
                                width: 16.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: kgreyDark,
                                  size: 15.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: NormalText(
                                    snapshot.data.City != null
                                        ? snapshot.data.City
                                        : "city",
                                    kgreyDark,
                                    15.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, left: 0),
                            child: Card(
                              color: Hexcolor('#ffae19'),
                              child: InkWell(
                                splashColor: Colors.blue.withAlpha(30),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            SlotListScreen(snapshot.data.Id)),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Row(
                                    children: <Widget>[
                                      Image.asset(
                                        'lib/assets/images/sp3.png',
                                        width: 45,
                                        height: 45,
                                      ),
                                      Text(
                                        " Parking Slots",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 27,
                                            color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_right,
                                        size: 60,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          NormalText(
                              snapshot.data.Address != null
                                  ? snapshot.data.Address
                                  : "Address",
                              kgreyDark,
                              13.0),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 2,
                            color: kgreyFill,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BoldText("About this hotel", 20.0, kblack),
                              BoldText(
                                  snapshot.data.Slots.toString() != null
                                      ? snapshot.data.Slots.toString() +
                                          " Slots"
                                      : "Slots",
                                  16,
                                  kdarkBlue)
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          NormalText(
                              snapshot.data.Description != null
                                  ? snapshot.data.Description
                                  : "description",
                              kblack,
                              12.0),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 2,
                            color: kgreyFill,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              BoldText("Facilities", 20.0, kblack),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.money_off),
                                      Text("Online Pyment")
                                    ],
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.map),
                                      Text("Map Direction")
                                    ],
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Icon(Icons.fiber_smart_record),
                                      Text("Wash facility")
                                    ],
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Map",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 6.0,
                              right: 6.0,
                            ),
                            height: 300.0,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 5.0,
                              ),
                            ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 6, top: 10),
                                ),
                                Container(
                                  height: 250.0,
                                  margin: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage('lib/assets/images/z.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            SizedBox(
              height: 40,
            ),
            //card 2

//card
          ])),
        ),
      ],
    );
  }
}
