import 'package:flutter/material.dart';

class userPage extends StatefulWidget {
  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<userPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.indigo,
         title: Text("UserPage"),
         centerTitle: true,
      ),
    );
  }
}
