import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kelola_sampah/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class KalkulatorBiaya extends StatefulWidget {
  const KalkulatorBiaya({Key? key}) : super(key: key);

  @override
  _KalkulatorBiayaState createState() => _KalkulatorBiayaState();
}

class _KalkulatorBiayaState extends State<KalkulatorBiaya> {
  var tanggal;
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    // TODO: implement your code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Estimasi Biaya'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
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
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'ex. kategori',
                  focusedBorder: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Tanggal Pengambilan',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor)),
              SizedBox(
                height: 5,
              ),
              SfDateRangePicker(
                onSelectionChanged: (date) {
                  print(date.value);
                  setState(() {
                    tanggal = date;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Jumlah Sampah hari ini',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor)),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'ex. 10',
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
