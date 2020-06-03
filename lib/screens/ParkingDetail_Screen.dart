import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/utilities/TextStyles.dart';
import 'package:parkit_com/utilities/consts.dart';
import 'package:parkit_com/widgets/Constant_Widget.dart/AppBar.dart';
import 'package:parkit_com/widgets/ImageSlide_Widget.dart';
import 'package:parkit_com/widgets/ParkingDetailOverView_WIdget.dart';
import 'package:parkit_com/widgets/ParkingReview_Widget.dart';
import 'package:parkit_com/widgets/bottonnavigation.dart';


class ParkingDetailScreen extends StatefulWidget {
  ParkingDetailScreen(int id) {
    this.id = id;
  }
  int id;

  @override
  _ParkingDetailScreen createState() => _ParkingDetailScreen(id);
}

class _ParkingDetailScreen extends State<ParkingDetailScreen>
    with SingleTickerProviderStateMixin {
  _ParkingDetailScreen(int id) {
    this.id = id;
  }
  int id;

  TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[


          Positioned(
            top: 0,
            child: Container(
                width: 400,
                height: 270,
                child: ImageCarousel()),
          ),


          Positioned(
            top: 250.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Scaffold(
                  appBar: TabBar(
                    labelColor: kdarkBlue,
                    labelStyle: TextStyle(
                        fontFamily: "nunito", fontWeight: FontWeight.bold),
                    controller: tabController,
                    indicatorColor: kdarkBlue,
                    tabs: <Widget>[
                      Tab(text: "OverView"),
                      Tab(text: "Location"),
                      Tab(text: "Review"),
                    ],
                  ),
                  backgroundColor: kwhite,
                  body: Stack(
                    children: <Widget>[
                      TabBarView(
                        children: <Widget>[
                          ParkingDetailOverview(id),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BoldText("Location", 20.0, kblack),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (_) => GoogleMapMain()),
                                        // );
                                      },
                                      child: Image.asset(
                                        "lib/assets/images/z.png",
                                        fit: BoxFit.fill,
                                        height: 250,
                                        width: 400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        BoldText("Reviews", 20.0, kblack),
                                        BoldText("See all", 16, kdarkBlue),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: 50.0,
                                          decoration: BoxDecoration(
                                            color: korange,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                    ParkingReviewidget(id),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                        controller: tabController,
                      ),
                    ],
                  ),

                  /*Stack(
                    children: <Widget>[
                      Image.asset("assets/hotel.jpg"),





                    ],

                  ),*/
                ),
              ),
            ),
          ),
         
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }
}
