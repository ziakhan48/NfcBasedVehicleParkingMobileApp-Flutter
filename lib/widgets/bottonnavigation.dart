import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/Authentication/login.dart';
import 'package:parkit_com/screens/ParkingcardExample/parkingcardE.dart';
import 'package:parkit_com/screens/UserReservationHistory.dart';
import 'package:parkit_com/screens/mainscreen.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';

import '../main.dart';

class BottomNavBar extends StatefulWidget {
  int index = 0;
  BottomNavBar(int navigationValues) {
    index = navigationValues;
  }
  @override
  _BottomNavBarState createState() => _BottomNavBarState(index);
}

class _BottomNavBarState extends State<BottomNavBar> {
  int navigationvalues = 0;
  String result2 = null;

  _BottomNavBarState(int index) {
    navigationvalues = index;
  }
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: navigationvalues,
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.blueGrey,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.blueGrey,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.blueGrey,
          ),
          Icon(
            Icons.call_split,
            size: 30,
            color: Colors.blueGrey,
          ),
          Icon(
            Icons.perm_identity,
            size: 30,
            color: Colors.blueGrey,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Hexcolor('#b57017'),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
            );
          } else if (index == 1) {
            print("2");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => MyApp()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SplashScreen()),
            );
            print("2");
          } else if (index == 3) {
            print("index 3");
          } else if (index == 4) {
            print("4");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
            // drawer_condition != null
            //     ? Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (_) => ProfilePage()),
            //       )
            //     : Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (_) => LoginScreen()),
            //       );
          }

          setState(() {
            _page = index;
          });
        });
  }

  Widget drawer_condition() {
    readToken().then((result) {
      result2 = result;
      print("result is ::" + result);
      return result2;
    });
  }
}
