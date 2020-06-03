import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';
import 'package:parkit_com/widgets/parkinglistwidget/parkingcard.dart';

class ParkingList extends StatelessWidget {
  String city;

  ParkingList(String city) {
    this.city = city;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: ListView(children: <Widget>[
        //Parking Search
        ParkingCard(city),
       
      ]),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
