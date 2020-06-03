import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/Controller/AddReview_Controller.dart';
import 'package:parkit_com/screens/UserAccount/Account_profile.dart';
import 'package:parkit_com/services/AddReview_Service.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/UserAccountWidget/UserProfile/Profile_Picture.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class Addreview extends StatefulWidget {
  String parking;
  Addreview(String parking) {
    this.parking = parking;
  }

  _AddreviewState createState() => _AddreviewState(parking);
}

class _AddreviewState extends State<Addreview> {
  bool validate = true;
  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  final _controller = AddReviewController();
  String parking;
  _AddreviewState(String parking) {
    this.parking = parking;
  }

  @override
  Widget build(BuildContext context) {
    String parkingtext = _controller.Parking_Validation(parking);
    return new Scaffold(
      appBar: AppBar(
         backgroundColor:Colors.white,
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
        ProfilePicture(),
        Container(
          height: 1,
          width: 500,
          decoration: new BoxDecoration(
            color: Colors.purple,
            gradient: new LinearGradient(
              colors: [Colors.red, Colors.cyan],
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          width: 350,
          height: 130,
          padding: EdgeInsets.fromLTRB(40, 10, 20, 10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 7, 0, 10),
                  child: Image.asset(
                    'lib/assets/images/slotcar.png',
                    width: 90,
                    height: 70,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
                  child: Text("Slot Reservation Form",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              ]),
            ],
          ),
        ),

        //Parking Search
        Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          onChanged: (text) {
                            bool validate_;
                            String message =
                                _controller.UserName_Validator(text);
                            if (message == "") {
                              validate_ = true;
                            } else {
                              validate_ = false;
                            }

                            setState(() {
                              validate = validate_;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: validate == true
                                  ? Icon(Icons.error,
                                      color: Colors.amber, size: 0)
                                  : Icon(Icons.error, color: Colors.amber),
                              hintText: "Enter your Name eg. Ali khan"),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          onChanged: (text) {
                            bool validate_;
                            String message = _controller.Review_Validator(text);
                            if (message == "") {
                              validate_ = true;
                            } else {
                              validate_ = false;
                            }

                            setState(() {
                              validate1 = validate_;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: validate1 == true
                                  ? Icon(Icons.error,
                                      color: Colors.amber, size: 0)
                                  : Icon(Icons.error, color: Colors.amber),
                              hintText: "Share your Reviev......"),
                        ),
                      ),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                  child: new Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new Flexible(
                        child: new TextField(
                          onChanged: (text) {
                            bool validate_;
                            String message =
                                _controller.ReviewNo_Validator(text);
                            if (message == "") {
                              validate_ = true;
                            } else {
                              validate_ = false;
                            }

                            setState(() {
                              validate2 = validate_;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: validate2 == true
                                  ? Icon(Icons.error,
                                      color: Colors.amber, size: 0)
                                  : Icon(Icons.error, color: Colors.amber),
                              hintText: "Review in number 1 ... 5"),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    'Add Review',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Hexcolor('#e9c749'),
                  onPressed: () async {
                    await AddReview_Request(this._controller.Model)
                        .then((success) {
                      if (success) {
                        showDialog(
                          builder: (context) => AlertDialog(
                            title: Text('thank you for sharing your Review'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => ProfilePage()),
                                  );
                                },
                                child: Text('OK'),
                              )
                            ],
                          ),
                          context: context,
                        );
                        return;
                      } else {
                        showDialog(
                          builder: (context) => AlertDialog(
                            title: Text('Errror Occured!!!'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              )
                            ],
                          ),
                          context: context,
                        );
                        return;
                      }
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(1),
    );
  }
}
