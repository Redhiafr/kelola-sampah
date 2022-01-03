// import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'i'
import '../constants.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget build(BuildContext context) {
    var widthscreen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  color: kPrimaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 90, left: 20),
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  "https://placeimg.com/480/480/any")))),
                ),
                Positioned(
                    top: 110,
                    left: 140,
                    child: Text(
                      'Wulan Widia Sari',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 2),
                          spreadRadius: 1,
                          color: Colors.black26)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Alamat',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Kalimantan'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Telpon',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('0823091232193'),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pekerjaan',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('Mahasiswa'),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text('SOCIAL MEDIA',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor)),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.pinkAccent,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                FaIcon(FontAwesomeIcons.twitter,
                                    color: Colors.blueAccent)
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
