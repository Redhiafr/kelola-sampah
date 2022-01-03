import 'package:flutter/material.dart';
import 'package:kelola_sampah/Screens/home.dart';

import 'package:kelola_sampah/Screens/register.dart';

class Login extends StatelessWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.teal.shade700,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
              child: Container(
                width: 400,
                height: 250,
                child: Image.asset(
                  'asset/images/logo.png',
                ),
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  labelText: 'Email',
                  // hintText: 'Enter your email',
                    icon: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            // padding: const EdgeInsets.only(
            //     left: 15.0, right: 15.0, top: 10, bottom: 0),
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                labelText: 'Password',
                // hintText: 'Enter your password',
                  icon: Icon(Icons.lock),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Lupa Password',
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
                    context, MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text(
                'Sign In',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
           Container(
             margin: EdgeInsets.all(9),
            height: 45,
            width: 200,
            decoration: BoxDecoration(color: Colors.teal.shade700),
            // borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Register()));
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}
