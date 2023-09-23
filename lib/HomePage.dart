// import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget{

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List myColors = <Color>[
  Colors.red,
  Colors.yellow,
  Colors.brown,
  Colors.blue,
  Colors.deepOrangeAccent,
  Colors.pink,
];
Color primaryColor = myColors[4];

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: navbar(),
        backgroundColor: primaryColor.withOpacity(0.99),
      ),
      body: Center(
        child: Stack(
          children: [
            buildImage(),
            buildColorIcons(),
            buildAmountTag(),
          ],
        ),
      ),
    );
  }

  Widget navbar() => const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Icon(
            Icons.person,
            color: Colors.black87,
            size: 40,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.black87,
              size: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.share_outlined,
                color: Colors.black87,
                size: 32,
              ),
            ),
          ],
        )
        ],
      );

  Widget buildImage() => Container(
         width: MediaQuery.of(context).size.width,
         // height: MediaQuery.of(context).size.height,
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(primaryColor, BlendMode.hue),
          child: Container(
              color: Colors.white,
              child: Transform.translate(
                  offset: Offset(35, -30),
                      child: Image.asset(
                        "assets/images/t-shirt.jpg",
                        fit: BoxFit.contain,
                      ),
                  ),
              ),
          ),
        );



  Widget buildColorIcons() =>
      Positioned(
        bottom: 35,
        right: 10,
        child: Column(
          children: [for(var i = 0; i < 6; i++) buildIconBtn(myColors[i])],
        ),
      );


  Widget buildIconBtn(Color myColor) =>
      Stack(
      children: [
      Positioned(
        top: 12.5,
        left: 12.5,
        child: Icon(
          Icons.check,
          size: 20,
          color: primaryColor == myColor ? myColor : Colors.transparent,
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.circle,
          color: myColor.withOpacity(0.85),
          size: 30,
        ),
        onPressed: () {
          setState(() {
            primaryColor = myColor;
          });
        },
      ),
    ],
  );



  Widget buildAmountTag() =>
      Positioned(
        bottom: 125,
        left: 50,
        child: Text(
          "\$1250.99",
          style: TextStyle(
              color: primaryColor.withOpacity(0.65),
              fontSize: 20.00,
              fontWeight: FontWeight.w500
          ),
        ),
      );
}