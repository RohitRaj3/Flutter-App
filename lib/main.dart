// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:object_theme_app/HomePage.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  //connecting cloud_firestore
  // final Stream<QuerySnapshot> productDetails =
  //      FirebaseFirestore.instance.collection('productDetails').snapshots();
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Object-Theme-App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
