import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeList extends StatefulWidget {
  @override
  _MakeListState createState() => _MakeListState();
}


class _MakeListState extends State<MakeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INVITEE LIST",style: TextStyle(fontSize: 25.0,letterSpacing: 2.0),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView.builder(itemBuilder: null),
    );
  }
}
