import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/Controller/UserAccount_Controller/Profile_Controller.dart';
import 'package:parkit_com/models/Api/UserAccoutModels/UserProfile_Model.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/services/UserAccountServices/ProfileUpdate_Service.dart';
import 'package:parkit_com/services/UserAccountServices/Profile_Service.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/UserAccountWidget/UserProfile/Profile_Picture.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';
import 'package:parkit_com/widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  Future<UserProfile> UserProfilealbum;
  String result2 = null;
  final _controller = ProfileController();
  bool validate = true;
  bool validate1 = true;
  bool validate2 = true;
  bool validate3 = true;
  bool validate4 = true;
  @override
  void initState() {
    super.initState();
    UserProfilealbum = ProfileService.fetchUserProfile();
  }

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

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
      body: new Center(
          child: FutureBuilder<UserProfile>(
              future: UserProfilealbum,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    color: Colors.white,
                    child: new ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ProfilePicture(),
                            Center(
                              child: new Container(
                                height: 1,
                                width: 400,
                                decoration: new BoxDecoration(
                                  color: Colors.purple,
                                  gradient: new LinearGradient(
                                    colors: [Colors.red, Colors.cyan],
                                  ),
                                ),
                              ),
                            ),
                            new Container(
                              color: Color(0xffFFFFFF),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 25.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Parsonal Information',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                _status
                                                    ? _getEditIcon()
                                                    : new Container(),
                                              ],
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new TextField(
                                                onChanged: (text) {
                                                  bool validate_;
                                                  String message = _controller
                                                      .FullName_Validator(text);
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
                                                          color: Colors.amber,
                                                          size: 0)
                                                      : Icon(Icons.error,
                                                          color: Colors.amber),
                                                  hintText:
                                                      snapshot.data.Name != null
                                                          ? snapshot.data.Name
                                                          : "Username",
                                                ),
                                                enabled: !_status,
                                                autofocus: !_status,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Email ID',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new TextField(
                                                onChanged: (text) {
                                                  bool validate_;
                                                  String message = _controller
                                                      .Email_Validator(text);
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
                                                    suffixIcon: validate1 ==
                                                            true
                                                        ? Icon(Icons.error,
                                                            color: Colors.amber,
                                                            size: 0)
                                                        : Icon(Icons.error,
                                                            color:
                                                                Colors.amber),
                                                    hintText: snapshot
                                                                .data.Email !=
                                                            null
                                                        ? snapshot.data.Email
                                                        : "email Address"),
                                                enabled: !_status,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Mobile',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new TextField(
                                                onChanged: (text) {
                                                  bool validate_;
                                                  String message = _controller
                                                      .Phone_Validate(text);
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
                                                    suffixIcon: validate2 ==
                                                            true
                                                        ? Icon(Icons.error,
                                                            color: Colors.amber,
                                                            size: 0)
                                                        : Icon(Icons.error,
                                                            color:
                                                                Colors.amber),
                                                    hintText: snapshot
                                                                .data.Phone !=
                                                            null
                                                        ? snapshot.data.Phone
                                                        : "phone number"),
                                                enabled: !_status,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'City',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'Address',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0),
                                                child: new TextField(
                                                  onChanged: (text) {
                                                    bool validate_;
                                                    String message = _controller
                                                        .City_Validator(text);
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
                                                      suffixIcon: validate3 ==
                                                              true
                                                          ? Icon(Icons.error,
                                                              color:
                                                                  Colors.amber,
                                                              size: 0)
                                                          : Icon(Icons.error,
                                                              color:
                                                                  Colors.amber),
                                                      hintText: snapshot
                                                                  .data.City !=
                                                              null
                                                          ? snapshot.data.City
                                                          : "city"),
                                                  enabled: !_status,
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                            Flexible(
                                              child: new TextField(
                                                onChanged: (text) {
                                                  bool validate_;
                                                  String message = _controller
                                                      .Address_Validator(text);
                                                  if (message == "") {
                                                    validate_ = true;
                                                  } else {
                                                    validate_ = false;
                                                  }

                                                  setState(() {
                                                    validate4 = validate_;
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                    suffixIcon: validate4 ==
                                                            true
                                                        ? Icon(Icons.error,
                                                            color: Colors.amber,
                                                            size: 0)
                                                        : Icon(Icons.error,
                                                            color:
                                                                Colors.amber),
                                                    hintText: snapshot
                                                                .data.Address !=
                                                            null
                                                        ? snapshot.data.Address
                                                        : "Address"),
                                                enabled: !_status,
                                              ),
                                              flex: 2,
                                            ),
                                          ],
                                        )),
                                    !_status
                                        ? _getActionButtons()
                                        : new Container(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              })),
      bottomNavigationBar: BottomNavBar(4),
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

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color:Hexcolor('#e9c749'),
                onPressed: () async {
                  await ProfileUpdate_Request(this._controller.Model)
                      .then((success) {
                    if (success) {
                      showDialog(
                        builder: (context) => AlertDialog(
                          title: Text('Profile Updated Successfully!!!'),
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

                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
