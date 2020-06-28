import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class ConfirmPayment extends StatefulWidget {
  @override
  _ConfirmPaymentState createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      //  backgroundColor: Hexcolor('#f5f3ee'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[],
      ),
      body: ListView(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Image.network(
            'https://www.pngarts.com/files/4/Reward-PNG-Image-Transparent-Background.png',
            width: 200,
            height: 200,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 85, top: 40),
          child: Text(
            'Transection Done Succesfuly',
            style: TextStyle(
                color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 115),
          child: Text(
            ' Now Park Your Car',
            style: TextStyle(
                color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(0),
    );
  }
}
