import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelolasampah/constants.dart';
import 'package:http/http.dart' as http;
import 'package:kelolasampah/global/global_constant.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  _RiwayatState createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  List riwayat = [];
  // Map result;

  Future _getTransaction() async {
    var url = Uri.parse(GlobalConstant().url + '/api/transactions');
    var response = await http.get(url);
    Map result = json.decode(response.body);
    // print(result);
    if (response.statusCode == 200) {
      setState(() {
        riwayat = result['data'];
      });
    } else {
      setState(() {
        riwayat = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    // print(riwayat.to);
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: riwayat.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Colors.white,
                        ),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  GlobalConstant().url +
                                      '/storage/' +
                                      riwayat[index]['gambar'],
                                  height: 100,
                                ),
                              ),
                              Text(riwayat[index]['description']),
                            ],
                          ),
                        )),
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 1,
                          offset: Offset(0, 1),
                          color: Colors.grey.shade200)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(riwayat[index]['nama_kategori'].toString()),
                      Icon(Icons.arrow_forward_ios_rounded)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
