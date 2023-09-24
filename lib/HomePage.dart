// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

List myColors = <Color>[
  Colors.blue,
  Colors.yellow,
  Colors.brown,
  Colors.red,
  Colors.deepOrangeAccent,
  // Colors.pink,
].reversed.toList();
Color primaryColor = myColors[0];


class _MyHomePageState extends State<MyHomePage> {

  //for real time data base
  final colorReference = FirebaseDatabase.instance.ref().child('colors');

  //for cloud_firebase
  // late CollectionReference colorCollection;
  // late Stream<QuerySnapshot> colorStream;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   colorCollection = FirebaseFirestore.instance.collection('colors');
  //   colorStream = colorCollection.orderBy('timestamp', descending: true).snapshots();
  // }



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
            // buildColorList(), // Add the color list here
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

  Widget buildImage() => SizedBox(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
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
          children: [for(var i = 0; i <5; i++) buildIconBtn(myColors[i])],
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
          //this will store data in cloud_firebase as json.
          // FirebaseFirestore.instance.collection('colors').add({
          //   'color': myColor.toString(), // Store color as a string
          //   'timestamp': FieldValue.serverTimestamp(),
          // });

         // Send data to Firebase Realtime Database
          colorReference.push().set({
            'color': myColor.toString(), // Store color as a string
            // 'timestamp': ServerValue.timestamp,
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