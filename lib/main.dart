import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:object_theme_app/HomePage.dart';


Future<void> main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBDfLdn0ite09E1bLEAN6DSktTP3yCMbIs",
        projectId: "object-theme",
        databaseURL: "https://object-theme-default-rtdb.asia-southeast1.firebasedatabase.app",
        messagingSenderId: "121994124107",
        appId: "1:121994124107:web:6e628794238456a723a6ce",

      )
  );
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  // ignore: non_constant_identifier_names
  //connecting cloud_firestore
  // stream is use for real time change update in data
  final Stream<QuerySnapshot> productDetails =
  FirebaseFirestore.instance.collection('productDetails').snapshots();

   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: productDetails,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return const MaterialApp(
          title: 'Object-Theme-App',
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      }
    );
  }
}