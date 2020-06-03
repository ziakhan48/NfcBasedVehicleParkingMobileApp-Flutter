import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel',
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() =>  _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller =  AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel =  Carousel(
      boxFit: BoxFit.cover,
      images: [
       AssetImage('lib/assets/images/park4.jpg'),
      AssetImage('lib/assets/images/park5.jpg'),
         AssetImage('lib/assets/images/t3.jpeg'),
         AssetImage('lib/assets/images/t2.jpg'),
         AssetImage('lib/assets/images/c6.jpg'),
      AssetImage('lib/assets/images/car3.jpg'),
         AssetImage('lib/assets/images/cars.jpg'),
         AssetImage('lib/assets/images/park5.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

   

    return  Scaffold(
      body:  Center(
        child:  Container(
         
           height: screenHeight / 2,
          child:  ClipRRect(
            child:  Stack(
              children: [
                carousel,
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}