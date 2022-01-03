import 'dart:html';

import 'package:flutter/material.dart';
import 'package:kelola_sampah/constants.dart';

import 'package:kelola_sampah/Screens/dashboard.dart';
import 'package:kelola_sampah/Screens/myprofile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: buildAppbar(),
  //     body: Body(),
  //   );
  // }

    @override
  _HomePageState createState() => _HomePageState();
}

 class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetlist = [Dashboard(), MyProfile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.teal.shade700,
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: buildAppbar(),
      body: _widgetlist.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        // backgroundColor:,
      ),
    );
  }
}
