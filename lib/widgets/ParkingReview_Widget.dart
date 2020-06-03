import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkit_com/services/ParkingReview_Service.dart';

import 'package:parkit_com/utilities/TextStyles.dart';
import 'package:parkit_com/utilities/consts.dart';

class ParkingReviewidget extends StatefulWidget {
  
  ParkingReviewidget(int id) {
    this.id = id;
  }
  int id;

  _ParkingReviewidget createState() => _ParkingReviewidget(id);
}

class _ParkingReviewidget extends State<ParkingReviewidget> {
  _ParkingReviewidget(int id) {
    this.id = id;
  }
  int id;
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      FutureBuilder(
        future: ParkingreviewService.fetchParkingReviewList(id),
        builder: (context, snapshot) {
          final reviews = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 15,
                    color: Colors.grey,
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 24,
                            height: 24,
                            child: CircleAvatar(
                              backgroundColor: kgreyDark,
                              child: Icon(
                                Icons.person,
                                size: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BoldText(
                              reviews[index].Name != null
                                  ? reviews[index].Name
                                  : "some name",
                              16,
                              kblack)
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
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: kwhite,
                                  size: 15.0,
                                ),
                                BoldText(
                                    reviews[index].Review != null
                                        ? reviews[index].Reviews.toString()
                                        : "Some review",
                                    15.0,
                                    kwhite),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      NormalText(
                          reviews[index].Review != null
                              ? reviews[index].Review
                              : "some review",
                          kblack,
                          12.0),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                itemCount: reviews.length,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),

      SizedBox(
        height: 40,
      ),
      //card 2

//card
    ]));
  }
}
