import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/models/travelaround_model.dart';

class TravelAroundCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        left: 6.0,
        right: 6.0,
      ),
      height: 300.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5.0,
        ),
      ]),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5),

            child: Row(
              children: <Widget>[
                Text(
                  'Book Parking',
                  style: TextStyle(
                      color: Colors.blueGrey, fontStyle: FontStyle.italic),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    height: 27,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Hexcolor('#ffae19'),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        ' in Nearset City',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            // child: RichText(
            //   text: TextSpan(
            //       text: 'Travel Around the Country ,Book Parking ',
            //       style: TextStyle(color: Colors.blueGrey, fontSize: 12),
            //       children: <TextSpan>[
            //         TextSpan(
            //           text: ' in Nearset City',
            //           style: TextStyle(
            //               color:Hexcolor('#e9c749'),
            //               fontSize: 16,
            //               fontWeight: FontWeight.bold),
            //         )
            //       ]),
            // ),
          ),
          SizedBox(
            height: 7.0,
          ),
          Container(
            height: 220.0,
            margin: EdgeInsets.only(left: 6.0, right: 6.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: travel.length,
              itemBuilder: (BuildContext context, int index) {
                Travel interest = travel[index];

                return GestureDetector(
                    onTap: () => print('Abc'),
                    child: Container(
                        height: 140.0,
                        width: 220.0,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 160.0,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: new AssetImage(interest.imageUrl),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  height: 30,
                                  width: 52,
                                  decoration: BoxDecoration(
                                      color: Hexcolor('#008b45'),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: <Widget>[
                                       
                                        
                                          Icon(
                                              Icons.star,
                                              color: Colors.white,
                                            size: 15,
                                            ),
                                         
                                        
                                       
                                        Text(
                                            interest.reviewNo.toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
