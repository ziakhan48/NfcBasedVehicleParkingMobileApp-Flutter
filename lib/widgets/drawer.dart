import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/Api/UserAccoutModels/UserProfile_Model.dart';
import 'package:parkit_com/screens/UserAccount/Account_profile.dart';
import 'package:parkit_com/screens/UserAccount/Change_Password.dart';
import 'package:parkit_com/screens/UserAccount/SlotReservation/ActiveReserved_Slot.dart';
import 'package:parkit_com/screens/UserAccount/SlotReservation/SlotReservation_History.dart';
import 'package:parkit_com/services/UserAccountServices/Profile_Service.dart';

class Drawers extends StatefulWidget {
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawers> {
  Future<UserProfile> UserProfilealbum;

  @override
  void initState() {
    super.initState();
    UserProfilealbum = ProfileService.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfilePage()),
            ),
            child: _createDrawerItem(
              icon: Icons.account_circle,
              text: 'Profile',
            ),
          ),
          _createDrawerItem(
            icon: Icons.error,
            text: 'About',
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ChangePassword()),
            ),
            child: _createDrawerItem(
              icon: Icons.vpn_key,
              text: 'Change Password',
            ),
          ),
          Divider(),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ReservationSlotHistory()),
            ),
            child: _createDrawerItem(
                icon: Icons.history, text: 'Slot Reservation History'),
          ),
          GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ReservedSlot()),
                  ),
              child: _createDrawerItem(
                  icon: Icons.timer, text: 'Active Reservation')),
          _createDrawerItem(icon: Icons.payment, text: 'Payment History'),
          GestureDetector(
            onTap: () {},
            child: _createDrawerItem(
                icon: Icons.power_settings_new, text: 'LogOut'),
          ),
          Divider(),
          _createDrawerItem(icon: Icons.settings, text: 'Account Setting'),
        ],
      ),
    );
  }

//drawer header

  Widget _createHeader() {
    return DrawerHeader(
      child: FutureBuilder<UserProfile>(
          future: UserProfilealbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Stack(children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 5, right: 20, top: 30, bottom: 70),
                      width: 65.0,
                      height: 200.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image:
                                  AssetImage("lib/assets/images/user.jpg"))),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 5, right: 20, top: 10, bottom: 80),
                      child: Text(
                        snapshot.data.Name != null
                            ? snapshot.data.Name
                            : "eg.name",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          left: 100, right: 20, top: 60, bottom: 20),
                      child: Text(
                        snapshot.data.Email != null
                            ? snapshot.data.Email
                            : "eg .email@.com",
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                )
              ]);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      decoration: BoxDecoration(
        color: Hexcolor('#e9c749'),
      ),
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
    );
  }

//drawer items

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
