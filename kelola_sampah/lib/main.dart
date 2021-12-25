
import 'package:flutter/material.dart';
import 'package:kelola_sampah/Screens/categories.dart';
import 'package:kelola_sampah/Screens/login.dart';
import 'package:kelola_sampah/Screens/register.dart';
import 'package:kelola_sampah/Screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/categories': (context) => Categories(),
        '/home': (context) => Home(),
        //  '/transactions': (context) => Transactions(),
      },
    );
  }
}

// class LoginDemo extends StatefulWidget {
//   @override
//   _LoginDemoState createState() => _LoginDemoState();
// }

// class _LoginDemoState extends State<LoginDemo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text("Welcome"),
//         backgroundColor: Colors.teal.shade700,
//       ),
//       body: SingleChildScrollView(
//         child: Login(),
//       ),
//     );
//   }
// }