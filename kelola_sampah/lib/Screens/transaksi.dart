import 'dart:convert';
import 'dart:io';

import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:kelola_sampah/Screens/bottomModal_success.dart';
import 'package:kelola_sampah/Screens/home.dart';
import 'package:kelola_sampah/constants.dart';
import 'package:kelola_sampah/global/global_constant.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  _TransaksiState createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  // DateTime? selectedDate;
  // print(DateTime.now());'
  GlobalKey? expansionTile;
  var picker = ImagePicker();
  var kategori = '';
  var coba;
  TextEditingController jml = new TextEditingController();
  TextEditingController biaya = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  List katList = [];
  DateTime selectedDate = DateTime.now();
  DateFormat myFormat = new DateFormat('yyyy/MM/dd');
  PickedFile? _image;

  get kPrimaryColor => null;

  Future<void> _select(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future _getCategory() async {
    var url = Uri.parse(GlobalConstant().url + '/api/categories');
    var response = await http.get(url);
    Map result = json.decode(response.body);
    // print(result['data']);
    if (response.statusCode == 200) {
      setState(() {
        katList = result['data'];
      });
    } else {
      setState(() {
        katList = [];
      });
    }
    // return katList;
  }

  Future _push() async {
    // print(_image!.path);
    var url = Uri.parse(GlobalConstant().url + '/api/transactions');
    Map<String, String> requestBody = <String, String>{
      'category_id': kategori.toString(),
      'tanggal_transaksi': myFormat.format(selectedDate),
      'jumlah': jml.text,
      'biaya': biaya.text,
      'description': desc.text,
      // 'status': "1"
    };
    var request = http.MultipartRequest('POST', url)
      //if u have headers, basic auth, token bearer... Else remove line
      ..fields.addAll(requestBody);
    request.files.add(http.MultipartFile(
        'gambar',
        File(_image!.path).readAsBytes().asStream(),
        File(_image!.path).lengthSync(),
        filename: _image!.path.split("/").last));
    var response = await request.send();
    print(response.statusCode);
    if (response.statusCode == 201) {
      BottomModalSuccess.success(context);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      });
    } else {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(height: 100, child: Text('Gagal'));
        },
      );
    }
  }

  Future _selectImage(ImageSource media) async {
    var img = await picker.getImage(source: media);
    if (img == null) {
      setState(() {
        _image = _image;
      });
    } else {
      setState(() {
        _image = img;
      });
    }
  }

  DateTime date = DateTime.now();

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  @override
  Widget build(BuildContext context) {
    // print(katList);
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Kategori',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    ExpansionTile(
                      title: Text(kategori),
                      key: GlobalKey(),
                      // subtitle: Text('Trailing expansion arrow icon'),
                      children: <Widget>[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          key: GlobalKey(),
                          itemCount: katList.length,
                          itemBuilder: (context, index) {
                            print(katList);
                            return Container(
                              child: ListTile(
                                title: Text(katList[index]['name'].toString()),
                                onTap: () {
                                  setState(() {
                                    kategori = katList[index]['id'].toString();
                                  });
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Tanggal Transaksi',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    TextField(
                        // enabled: false,
                        decoration: InputDecoration(
                            hintText: myFormat.format(selectedDate)),
                        onTap: () {
                          _select(context);
                        })
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Jumlah Sampah (kg)',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    TextField(
                      controller: jml,
                      decoration: InputDecoration(hintText: 'Masukkan Jumlah'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Biaya',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    TextField(
                      controller: biaya,
                      decoration: InputDecoration(hintText: 'Masukkan Biaya'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    TextField(
                      controller: desc,
                      maxLines: null,
                      decoration:
                          InputDecoration(hintText: 'Masukkan deskripsi'),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Bukti Sampah',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kPrimaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _image != null
                            ? Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.file(
                                        File(_image!.path),
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 100,
                                      )),
                                ],
                              )
                            : Container(),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16))),
                                    child: Column(children: [
                                      Text('Pilih Untuk Unggah Gambar'),
                                      GestureDetector(
                                        onTap: () {
                                          _selectImage(ImageSource.camera);
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.camera),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Ambil Gambar')
                                          ],
                                        ),
                                      )
                                    ]),
                                  );
                                });

                            // Navigator.popUntil(context, (route) => false);
                          },
                          child: FDottedLine(
                              color: kPrimaryColor,
                              height: 100,
                              width: 100,
                              strokeWidth: 2,
                              dottedLength: 10,
                              space: 2,
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Center(child: Text('+ Unggah Foto')))),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  _push();
                },
                style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
                child: Text('Submit', style: TextStyle(color: Colors.white)))
          ],
        ),
      )),
    );
  }
}

class BottomModalSuccess {
  static void success(BuildContext context) {}
}
