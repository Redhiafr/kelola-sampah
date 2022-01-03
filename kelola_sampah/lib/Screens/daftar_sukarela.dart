import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:kelolasampah/Screens/bottomModal_success.dart';
import 'package:kelolasampah/Screens/dashboard.dart';
import 'package:kelolasampah/Screens/home.dart';
import 'package:kelolasampah/global/global_constant.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:kelolasampah/constants.dart';

class DaftarSukarela extends StatefulWidget {
  const DaftarSukarela({Key? key}) : super(key: key);

  @override
  _DaftarSukarelaState createState() => _DaftarSukarelaState();
}

class _DaftarSukarelaState extends State<DaftarSukarela> {
  DateTime? _selectedDate;
  TextEditingController nama = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController pekerjaan = TextEditingController();
  TextEditingController tempat_lahir = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  var myFormat = DateFormat('yyyy/MM/d');

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

  Future _submit() async {
    var url = Uri.parse(GlobalConstant().url + '/api/volunteers');
    Map<String, String> reqs = <String, String>{
      'nama': nama.text,
      'alamat': alamat.text,
      'tempat_lahir': tempat_lahir.text,
      'tanggal_lahir': myFormat.format(selectedDate).toString(),
      'pekerjaan': pekerjaan.text
    };
    var response = await http.post(url, body: reqs);
    if (response.statusCode == 201) {
      BottomModalSuccess.success(context);
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      });
    } else {
      print(response.statusCode);
    }
    // print(response.)
  }

  @override
  Widget build(BuildContext context) {
    // print(selectedDate);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
            onPressed: () => Navigator.of(context).pop()),
        title: Text('Pendaftaran Sukarelawan'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.2,
          child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: nama,
                        decoration: InputDecoration(
                            hintText: 'Nama', focusColor: kPrimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: tempat_lahir,
                        decoration: InputDecoration(
                            hintText: 'Tempat Lahir',
                            focusColor: kPrimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // DatePickerDialog(initialDate: DateTime.now(), firstDate: , lastDate: lastDate)

                      TextFormField(
                        onTap: () {
                          _select(context);
                        },
                        decoration: InputDecoration(
                            hintText: myFormat.format(selectedDate),
                            focusColor: kPrimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: alamat,
                        decoration: InputDecoration(
                            hintText: 'Alamat', focusColor: kPrimaryColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: pekerjaan,
                        decoration: InputDecoration(
                            hintText: 'Pekerjaan', focusColor: kPrimaryColor),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        if (alamat.text != null ||
                            pekerjaan.text != null ||
                            tempat_lahir != null ||
                            nama.text != null) {
                          _submit();
                        } else {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Text('data'),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))))
                ],
              )),
        ),
      ),
    );
  }
}
