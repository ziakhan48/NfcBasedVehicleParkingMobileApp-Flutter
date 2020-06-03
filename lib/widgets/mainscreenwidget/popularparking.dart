import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/popularparking_model.dart';
import 'package:parkit_com/screens/parkinglist.dart';

class PopularParking extends StatelessWidget {
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
                    itemCount: popularpark.length,
                    itemBuilder: (BuildContext context, int index) {
                      PopularPark popular = popularpark[index];
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
                                     
                                    image:  DecorationImage(
                                      fit: BoxFit.fill,
                                      image:  AssetImage(popular.imageUrl),
                                    ),
                                    
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 32,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      color: Hexcolor('#008b45'),
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 10,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        popular.city,
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
