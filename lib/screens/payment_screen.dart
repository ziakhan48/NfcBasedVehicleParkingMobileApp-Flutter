import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/StripePayment/Payment_home.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.search),
          //   onPressed: () {
          //     print("Message sent");
          //   },r
          // )
        ],
      ),
      body: ListView(children: <Widget>[
        Center(
          child: Stack(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.network(
                  'https://www.usnews.com/dims4/USNEWS/2bb6b95/2147483647/crop/2120x1391%2B0%2B0/resize/640x420/quality/85/?url=http%3A%2F%2Fmedia.beam.usnews.com%2Fe6%2F07%2F37e17ea743b3831ab2a96c79163f%2Fcreditcardstack.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.fromLTRB(40, 50, 0, 0),
                  child: Text(
                    'Your Reservation Completed Succesfuly...Now Pay To Confirm Reservation',
                    style: TextStyle(
                        color: Hexcolor('#b41418'),
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 70, 10, 0),
          child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => PaymentHomePage()),
                );
              },
              textColor: Colors.white,
              color: Hexcolor('#ffae19'),
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 255,
                height: 25,
                decoration: const BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: <Color>[
                    //   //  Hexcolor('#00997b'),
                    //   //   Hexcolor('#00997b'),
                    //   //    Hexcolor('#00997b'),
                    //   ],
                    // ),
                    ),
                // padding: const EdgeInsets.all(10.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(100, 5, 100, 0),
                  child: const Text('Pay Your Bill',
                      style: TextStyle(fontSize: 15)),
                ),
              )),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
