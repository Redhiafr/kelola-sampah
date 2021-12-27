import 'package:flutter/material.dart';
import 'package:kelola_sampah/components/body.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: Body(),
    );
  }

   AppBar buildAppbar() {
     return AppBar(
      title: Text("Home"),
       backgroundColor: Colors.teal.shade700,
       elevation: 0,
    );
   }
}