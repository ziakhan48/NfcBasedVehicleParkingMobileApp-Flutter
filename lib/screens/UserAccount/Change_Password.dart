import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/Controller/UserAccount_Controller/ChangePassword_Controller.dart';
import 'package:parkit_com/services/Token/Token_Handling.dart';
import 'package:parkit_com/services/UserAccountServices/ChangePassword_Service.dart';
import 'package:parkit_com/utilities/constants.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/UserAccountWidget/UserProfile/Profile_Picture.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';
import 'package:parkit_com/widgets/drawer.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  bool _rememberMe = false;
  bool validate = true;
  bool validate1 = true;
  bool validate2 = true;
  final _controller = ChangePasswordController();
  String result2 = null;

  Widget _currentpassword_TF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Current Password',
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
  color: Hexcolor('#e4b981'),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
),
          height: 50.0,
          width: 300,
          child: TextField(
            onChanged: (text) {
              bool validate_;
              String message = _controller.CurrentPassword_Validator(text);
              if (message == "") {
                validate_ = true;
              } else {
                validate_ = false;
              }

              setState(() {
                validate = validate_;
              });
            },
              obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: validate == true
                  ? Icon(Icons.error, color: Colors.white, size: 0)
                  : Icon(Icons.error, color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 9.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Current Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _newPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ' New Password',
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
  color: Hexcolor('#e4b981'),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
),
          height: 50.0,
          width: 300,
          child: TextField(
            onChanged: (text) {
              bool validate_;
              String message = _controller.NewPassword_Validator(text);
              if (message == "") {
                validate_ = true;
              } else {
                validate_ = false;
              }

              setState(() {
                validate1 = validate_;
              });
            },
              obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: validate1 == true
                  ? Icon(Icons.error, color: Colors.white, size: 0)
                  : Icon(Icons.error, color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 9.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your New Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _confirmNewPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirm Password',
          style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
  color: Hexcolor('#e4b981'),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
),
          height: 50.0,
          width: 300,
          child: TextField(
            onChanged: (text) {
              bool validate_;
              String message = _controller.ConfirmPassword_Validator(text);
              if (message == "") {
                validate_ = true;
              } else {
                validate_ = false;
              }

              setState(() {
                validate2 = validate_;
              });
            },
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              suffixIcon: validate2 == true
                  ? Icon(Icons.error, color: Colors.white, size: 0)
                  : Icon(Icons.error, color: Colors.white),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 9.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Confirm your New Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: 300,
      child: RaisedButton(
        elevation: 5.0,
       onPressed: () async {
                  await ChangePassword_Request(this._controller.Model)
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
                                      builder: (_) => ChangePassword()),
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
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color:Hexcolor('#e9c749'),
        child: Text(
          'Update Password',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( color: Hexcolor('#ffae19')),
        title: Appbar(),
        actions: <Widget>[],
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      Colors.white,
                      // Colors.white
                      // Color(0xFF73AEF5),
                      // Color(0xFF61A4F1),
                      // Color(0xFF478DE0),
                      // Color(0xFF398AE5),
                    ],
                    // stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 0.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      ),
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
                      _currentpassword_TF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _newPasswordTF(),
                      SizedBox(
                        height: 20.0,
                      ),
                      _confirmNewPasswordTF(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
}
