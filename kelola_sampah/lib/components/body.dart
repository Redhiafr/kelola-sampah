import 'package:flutter/material.dart';
import 'package:kelola_sampah/components/header_with_searchbox.dart';
import 'package:kelola_sampah/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      //bisa scroll
      child: Column(
        children: [
          HeaderWithSearchBox(size: size),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                // height: 44,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Text(
                        "TODAY'S NEWS",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 7,
                          color: kPrimaryColor.withOpacity(0.2),
                        ),
                        
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
