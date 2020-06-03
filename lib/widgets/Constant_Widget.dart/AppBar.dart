import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'lib/assets/images/sp3.png',
            height: 35,
            width: 35,
          ),
        ),
        Text("ParkiT",
            textAlign: TextAlign.center,
            style: TextStyle(
               color:  Hexcolor('#008b45'),
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        Text(".Com",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Hexcolor('#ffae19'), fontWeight: FontWeight.bold, fontSize: 18))
      ],
    ));
  }
}
