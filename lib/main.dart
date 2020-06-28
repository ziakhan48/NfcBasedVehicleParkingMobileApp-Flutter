import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/StripePayment/Payment_home.dart';
import 'package:parkit_com/screens/StripePayment/existing-cards.dart';
import 'package:parkit_com/screens/mainscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => MainScreen()
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => PaymentHomePage(),
        '/existing-cards': (context) => ExistingCardsPage()
      },
      title: 'E-Commerce',
      home: Scaffold(
        body: Center(
            child: Container(
                margin: const EdgeInsets.only(top: 80),
                child: Column(children: <Widget>[
                  Image.asset(
                    'lib/assets/images/sp10.jpg',
                    width: 400,
                    height: 380,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 20, 0, 50),
                    child: Container(
                        child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'lib/assets/images/sp3.png',
                            height: 55,
                            width: 60,
                          ),
                        ),
                        Text("ParkiT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Hexcolor('#008b45'),
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(".COM",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Hexcolor('#ffae19'),
                                fontWeight: FontWeight.bold,
                                fontSize: 18))
                      ],
                    )),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //   child: Container(
                  //     height: 40,
                  //     width: 320,
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     child: TypewriterAnimatedTextKit(
                  //       text: ["Park your Car Here!"],
                  //       textAlign: TextAlign.center,
                  //       textStyle: TextStyle(
                  //           fontSize: 18.0,
                  //           color:Colors.red,
                  //           fontFamily: "nunito",
                  //           fontWeight: FontWeight.bold),
                  //       speed: Duration(milliseconds: 150),
                  //     ),
                  //   ),
                  // ),
                ]))),
      ),
    );
  }
}
