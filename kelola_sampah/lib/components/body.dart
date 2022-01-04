// /import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelolasampah/components/header_with_searchbox.dart';
import 'package:kelolasampah/constants.dart';

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
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
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
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 100,
                      width: 150,
                      child: Stack(children: <Widget>[
                        // FittedBox(
                        //   fit: BoxFit.fill,
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: ShaderMask(
                            shaderCallback: (rect) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.black, Colors.transparent],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: Image.network(
                              'https://placeimg.com/1920/990/any',
                              width: 300,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        // ),
                        Positioned(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'HOT NEWS',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text('lorem ipsum lbalblabl...',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 12))
                            ],
                          ),
                          bottom: 5,
                          left: 10,
                        )
                      ]),
                      // Text('COba')
                    ),
                    // color: kPrimaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: kPrimaryColor),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
