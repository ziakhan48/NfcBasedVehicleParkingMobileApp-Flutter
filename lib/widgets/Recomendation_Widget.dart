import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/Repository/Recomendation_Repository.dart';
import 'package:parkit_com/models/Api/Recomendation_Model.dart';
import 'package:parkit_com/models/popularparking_model.dart';
import 'package:parkit_com/screens/parkinglist.dart';

class Recomendation extends StatefulWidget {
  String city;

  Recomendation(String city) {
    this.city = city;
  }

//  List<ParkingList> parkings;
//   ParkingCard({Key key,this.parkings}) : super(key: key);
  _RecomendationState createState() => _RecomendationState(city);
}

class _RecomendationState extends State<Recomendation> {
  String city;
  _RecomendationState(String city) {
    this.city = city;
  }

  List<RecomendationModel> Recomendeparking;

  @override
  void initState() {
    super.initState();
    Recomendeparking = RecomendationRepository.Repomethode(city);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        height: 240.0,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5.0,
          ),
        ]),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 43.0, top: 10.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 0.0, right: 0.0),
                height: 192.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Recomendeparking.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ParkingList(popularpark[index].city)),
                          );
                        },
                        child: Container(
                            height: 170.0,
                            width: 235.0,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 120.0,
                                  width: 200.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new AssetImage(
                                          Recomendeparking[index].Image != null
                                              ? Recomendeparking[index].Image
                                              : "image url"),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 30,
                                    width: 75,
                                    decoration: BoxDecoration(
                                        color: Hexcolor('#e9c749'),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        Recomendeparking[index].Parking != null
                                            ? Recomendeparking[index].Parking
                                            : "parking",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),
              )
            ]));
  }
}
