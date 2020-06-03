import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkit_com/models/Api/UserAccoutModels/UserProfile_Model.dart';
import 'package:parkit_com/services/UserAccountServices/Profile_Service.dart';

class ProfilePicture extends StatefulWidget {
  _ProfilePicture createState() => _ProfilePicture();
}

class _ProfilePicture extends State<ProfilePicture> {
  Future<UserProfile> UserProfilealbum;

  @override
  void initState() {
    super.initState();
    UserProfilealbum = ProfileService.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FutureBuilder<UserProfile>(
            future: UserProfilealbum,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: 270.0,
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child:
                            new Stack(fit: StackFit.loose, children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                  width: 140.0,
                                  height: 140.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                          'lib/assets/images/user.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 90.0, right: 100.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 25.0,
                                    child: new Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          snapshot.data.Name != null
                              ? snapshot.data.Name
                              : "eg.Name",
                          style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                              fontSize: 23),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                            snapshot.data.Email != null
                                ? snapshot.data.Email
                                : "eg.Email",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                fontStyle: FontStyle.italic)),
                      )
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
