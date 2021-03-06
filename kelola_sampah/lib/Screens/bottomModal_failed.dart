import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomModalFailed {
  // const BottomModalFailed({ Key? key }) : super(key: key);
  const BottomModalFailed(BuildContext context);

  static Future failed(BuildContext context) async {
    await showModalBottomSheet<void>(
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            // decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(10),
            //         topRight: Radius.circular(10))),
            height: 150,
            // color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * (15 / 100),
                    height: 7,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(7.5 / 2),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.dangerous_outlined,
                        size: 40,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Gagal Disimpan'),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
