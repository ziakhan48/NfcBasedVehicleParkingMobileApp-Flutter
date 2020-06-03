import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';
import 'package:parkit_com/widgets/slotlistscreenwidget/parkingslotdesign.dart';

class SlotListScreen extends StatelessWidget {
  SlotListScreen(int id) {
    this.id = id;
  }
  int id;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
       backgroundColor:Colors.white,
         iconTheme: IconThemeData( color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[
          
        ],
      ),
      body: ListView(children: <Widget>[
        SlotDesign(id),
        //Parking Search
      ]),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
