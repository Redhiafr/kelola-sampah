import 'package:flutter/material.dart';
import 'package:kelola_sampah/Screens/login.dart';


class Register extends StatelessWidget {
  const Register({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
       appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.teal.shade700,
      ),
      body: 
     Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: Container(
              width: 350,
              height: 200,
              child: Image.asset(
                'asset/images/logo.png',
              ),
            ),
          ),
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
          ),
        ),
        Padding(
          //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
           padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                // border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter your email'),
          ),
        ),
        Padding(
          // padding: const EdgeInsets.only(
          //     left: 15.0, right: 15.0, top: 15, bottom: 0),
           padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            // obscureText: true,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter your password',
            ),
          ),
        ),
         Padding(
          // padding: const EdgeInsets.only(
          //     left: 15.0, right: 15.0, top: 15, bottom: 0),
           padding: EdgeInsets.symmetric(horizontal: 50),
          child: TextField(
            keyboardType: TextInputType.visiblePassword,
            // obscureText: true,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
            ),
          ),
        ),
        FlatButton(
          onPressed: () {
            Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
          },
          child: Text(
            'Already Have Account?',
            style: TextStyle(color: Colors.blue, fontSize: 15),
          ),
        ),
        Container(
          height: 45,
          width: 200,
          decoration: BoxDecoration(color: Colors.teal.shade700),
          // borderRadius: BorderRadius.circular(20)),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Login()));
            },
            child: Text(
              'REGISTER',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
        SizedBox(
          height: 130,
        ),
      ],
    ),
    );
  }
}


