import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kelola_sampah/Screens/bottomModal_success.dart';
import 'package:kelola_sampah/Screens/bottomModal_failed.dart';
import 'package:kelola_sampah/Screens/kategori.dart';
import 'package:kelola_sampah/constants.dart';
import 'package:kelola_sampah/global/global_constant.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  _TambahKategoriState createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _desc = new TextEditingController();
  Future _submit() async {
    var url = Uri.parse(GlobalConstant().url + '/api/categories');

    Map<String, String> reqs = <String, String>{
      "name": _name.text,
      "description": _desc.text
    };

    var response = await http.post(url, body: reqs);
    print(response.statusCode);
    if (response.statusCode == 201) {
      BottomModalSuccess.success(context);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
      });
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context);
      });
    } else {
      BottomModalFailed.failed(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text('Tambah Kategori'),
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nama Kategori'),
                    TextField(
                      controller: _name,
                      decoration: InputDecoration(hintText: 'ex. Plastik'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Deskripsi'),
                    TextField(
                      controller: _desc,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(hintText: 'ex. Plastik'),
                    )
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text('Berat (kg)'),
                //     TextField(
                //       decoration: InputDecoration(hintText: 'ex. Plastik'),
                //     )
                //   ],
                // )
              ],
            ),
            TextButton(
              onPressed: () {
                _submit();
              },
              style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
              child: Text(
                'Upload',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
