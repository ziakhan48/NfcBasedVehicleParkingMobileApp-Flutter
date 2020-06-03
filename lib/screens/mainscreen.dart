import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';
import 'package:parkit_com/widgets/drawer.dart';
import 'package:parkit_com/widgets/mainscreenwidget/parkingsearch.dart';
import 'package:parkit_com/widgets/mainscreenwidget/popularparking.dart';
import 'package:parkit_com/widgets/mainscreenwidget/travelaroundcity.dart';

class MainScreen extends StatelessWidget {
  String result2 = null;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    //  backgroundColor: Hexcolor('#f5f3ee'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[],
      ),
      body: ListView(children: <Widget>[
        //Parking Search
        Search(),

        SizedBox(height: 25),

        //Popular Parking text
        Row(children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 0, 10),
            child: Image.asset(
              'lib/assets/images/parkimage.png',
              width: 70,
              height: 60,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 51, 10, 0),
            child: Text("Popular Parking Cities",
                style: TextStyle(
                    color: Hexcolor('#ffae19'),
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
        ]),

        //popular Parking
        PopularParking(),
        SizedBox(height: 10),

        //Smart Parking image
        smart_parking(),
        SizedBox(height: 10),

        //Travelling Aroung The Country Text
        Row(children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 8, 10),
            child: Image.asset(
              'lib/assets/images/location3.png',
              width: 30,
              height: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text("Travel The",
                style: TextStyle(
                    color: Hexcolor('#ffae19'),
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Text(" Country",
                style: TextStyle(
                    color: Hexcolor('#ffae19'),
                    fontWeight: FontWeight.bold,
                    fontSize: 14)),
          ),
        ]),
        TravelAroundCountry(),
        SizedBox(height: 10),
        travelImage(),
      ]),
      bottomNavigationBar: BottomNavBar(0),
      drawer: drawer_condition != null ? Drawers() : null,
    );
  }

  Widget drawer_condition() {
    readToken().then((result) {
      result2 = result;
      print("result is ::" + result);
      return result2;
    });
  }

//sales image methode
  Widget smart_parking() {
    return Container(
      margin: EdgeInsets.only(
        left: 6.0,
        right: 6.0,
      ),
      height: 300.0,
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
            padding: const EdgeInsets.only(left: 6, top: 10),
          ),
          Container(
            height: 250.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image:  DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('lib/assets/images/sp10.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //travel image

  Widget travelImage() {
    return Container(
      margin: EdgeInsets.only(
        left: 6.0,
        right: 6.0,
      ),
      height: 300.0,
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
            padding: const EdgeInsets.only(left: 6, top: 10),
          ),
          Container(
            height: 240.0,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('lib/assets/images/p1.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
