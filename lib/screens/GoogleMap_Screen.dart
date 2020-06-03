import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/GoogleMap_Widgets/GoogleMap_Widget.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class GoogleMapMain extends StatelessWidget {
  GoogleMapMain(String city) {
    this.city = city;
  }
  String city;
  String result2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appbar(),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( color: Hexcolor('#ffae19')),
      ),
      body: GooglemapWidget(city),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

 
}
