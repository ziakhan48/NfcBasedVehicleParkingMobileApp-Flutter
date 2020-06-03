import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/Controller/SlotReservation_Controller.dart';
import 'package:parkit_com/screens/slotlistscreen.dart';
import 'package:parkit_com/services/Authentication/SlotReservation_service.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';

class SlotReservation extends StatefulWidget {
  int park_id;
  int slot_id;
  SlotReservation(int slot_id, int park_id) {
    this.slot_id = slot_id;
    this.park_id = park_id;
  }
  _SlotReservationState createState() =>
      _SlotReservationState(slot_id, park_id);
}

class _SlotReservationState extends State<SlotReservation> {
  bool validate = true;
  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  final _controller = SlotReservationController();
  int park_id;
  int slot_id;
  _SlotReservationState(int slot_id, int park_id) {
    this.slot_id = slot_id;
    this.park_id = park_id;
  }

  @override
  Widget build(BuildContext context) {
    String message = _controller.Id_Validator(slot_id.toString());
    return new Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
         iconTheme: IconThemeData( color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[
          
        ],
      ),
      body: ListView(children: <Widget>[
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
                                _controller.FullName_Validator(text);
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
                            String message = _controller.Phone_Validate(text);
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
                              hintText:
                                  "Enter Mobile Number eg. +92345*******"),
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
                            String message = _controller.type_Validator(text);
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
                              hintText: "Enter Vehicle type eg.car etc"),
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
                            String message = _controller.No_Validator(text);
                            if (message == "") {
                              validate_ = true;
                            } else {
                              validate_ = false;
                            }

                            setState(() {
                              validate3 = validate_;
                            });
                          },
                          decoration: InputDecoration(
                              suffixIcon: validate3 == true
                                  ? Icon(Icons.error,
                                      color: Colors.amber, size: 0)
                                  : Icon(Icons.error, color: Colors.amber),
                              hintText: "Enter Car No eg. 2343"),
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
                    'Reserve',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Hexcolor('#e9c749'),
                  onPressed: () async {
                    await SlotReservation_Request(this._controller.Model)
                        .then((success) {
                      if (success) {
                        showDialog(
                          builder: (context) => AlertDialog(
                            title: Text('Slot Reserved Successfully!!!'),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            SlotListScreen(park_id)),
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
