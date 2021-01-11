import 'dart:async';

import 'package:digitaleventpass/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginpage.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool loading = false;
  bool _firstLogIn;
  String _uid;
  @override
  void initState() {
    super.initState();
    checkLogin();
    Timer(Duration(seconds: 3), () {
      if (_firstLogIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ModalProgressHUD(child: Text("LOADING"), inAsyncCall: true),
      ),
    );
  }

  void checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _uid = preferences.getString('kSPuid') ?? "UIDNotFound";
    _firstLogIn = preferences.getBool('kSPfirstLogIn') ?? true;
    // if (!_firstLogIn) {
    //   await _firestore
    //       .collection('OrganizerContainer')
    //       .document(_uid)
    //       .get()
    //       .then((data) async {
    //     home.setUsername(data.data['OrgName']);
    //   });
    // }
  }
}
