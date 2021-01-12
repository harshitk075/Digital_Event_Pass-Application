import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaleventpass/sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _f = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/loginback.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30.0),
                    _signInButton(),
//                           RaisedButton.icon(
//                               onPressed: (){},
//                                icon: Icon(Icons.subdirectory_arrow_right),
//                               label: Text("Login"),
//                               color: Colors.orangeAccent,
//                               colorBrightness: Brightness.dark,
//                           ),
                    SizedBox(height: 10.0),
                    Text("New User register here !!!"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButton() {
    return RaisedButton(
      elevation: 6,
      color: Colors.white,
      splashColor: Colors.white,
      onPressed: () {
        checkInternetConnection().then((isWorking) => isWorking
            ? signInWithGoogle(context).whenComplete(() {
//          Navigator.of(context).push(
//            MaterialPageRoute(
//              builder: (context) {
//                return FirstScreen();
//              },
//            ),
//          );
                checkIfRegistered().then((x) async {
                  if (x == false) {
                    SharedPreferences preferences =
                        await SharedPreferences.getInstance();
                    preferences.setString('kSPuid', uid);
                    preferences.setBool('kSPfirstLogIn', false);
                    home.setUid(uid);
                    Navigator.pushReplacementNamed(
                        context, "/createorgprofile");
                  } else
                    Navigator.pushReplacementNamed(context, "/");
                });
              })
            : Fluttertoast.showToast(
                msg: 'Please check your internet connection'));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.jpg"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> checkIfRegistered() async {
    bool _isRegistered = false;

    try {
      print(uid);
      var value = await _f.collection('OrganizerContainer').document(uid).get();
      print(value.data);
      if (value.data != null) {
        setState(() {
          _isRegistered = true;
        });
      } else {
        throw Exception("Not registered!");
      }
    } catch (e) {
      print('naaaaaaaaaaa: $e');
    }
    return _isRegistered;
  }

  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Internet Working Fine');
        return true;
      }
    } on SocketException catch (_) {
      print('Internet Sucks');
    }
    return false;
  }
}
