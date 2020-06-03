import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:parkit_com/screens/parkinglist.dart';

class Search extends StatefulWidget {
  _ParkingSeach createState() => _ParkingSeach();
}

class _ParkingSeach extends State<Search> {
  TextEditingController searchController = new TextEditingController();
  Future<List<ParkingList>> parkings = null;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: <Widget>[
      Container(
          width: 350,
          height: 320,
          padding: EdgeInsets.fromLTRB(20, 60, 20, 10),
          child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(70, 0, 8, 10),
                  child: Image.asset(
                    'lib/assets/images/location3.png',
                    width: 25,
                    height: 25,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text("Search",
                      style: TextStyle(
                          color:  Hexcolor('#ffae19'),
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(" Parking",
                      style: TextStyle(
                          color: Hexcolor('#ffae19'),
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                )
              ]),
              Card(
                color: Hexcolor("#f3f7f6"),
                child: Container(
                    width: 300,
                    height: 150,
                   
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              size: 15,
                              color: Colors.grey,
                            ),
                            Text("City",
                                style: TextStyle(
                                    color: Colors.blueGrey, fontSize: 11))
                          ],
                        ),
                      ),

                      //input text
                      Container(
                        height: 38,
                        padding: EdgeInsets.fromLTRB(14, 0, 20, 0),
                        decoration: BoxDecoration(
                          color: Hexcolor('#d8a45f'),
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          child: TextField(
                            controller: searchController,
                            // keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                              
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic),
                              hintText: 'e.g:Lahore',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(bottom:10),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(13),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      //Search Button
                      RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ParkingList(searchController.text)),
                            );
                          },
                          textColor: Colors.white,
                          color:  Hexcolor('#ffae19'),
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            width: 255,
                            height: 25,
                            decoration: const BoxDecoration(
                              // gradient: LinearGradient(
                              //   colors: <Color>[
                              //   //  Hexcolor('#00997b'),
                              //   //   Hexcolor('#00997b'),
                              //   //    Hexcolor('#00997b'),
                              //   ],
                              // ),
                            ),
                            // padding: const EdgeInsets.all(10.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(100, 5, 100, 0),
                              child: const Text('Search',
                                  style: TextStyle(fontSize: 13)),
                            ),
                          )),
                    ])),
              ),
            ],
          )),

//card
    ]));
  }
}
