import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelolasampah/constants.dart';

class TambahKategori extends StatefulWidget {
  const TambahKategori({Key? key}) : super(key: key);

  @override
  _TambahKategoriState createState() => _TambahKategoriState();
}

class _TambahKategoriState extends State<TambahKategori> {
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
                      decoration: InputDecoration(hintText: 'ex. Plastik'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Deskripsi'),
                    TextField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(hintText: 'ex. Plastik'),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Berat (kg)'),
                    TextField(
                      decoration: InputDecoration(hintText: 'ex. Plastik'),
                    )
                  ],
                )
              ],
            ),
            TextButton(
              onPressed: () {},
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
