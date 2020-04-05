import 'package:flutter/material.dart';

class organizerPage extends StatefulWidget {
  @override
  _organizerPageState createState() => _organizerPageState();
}

class _organizerPageState extends State<organizerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.indigo,
         title: Text("Organizer Home Page"),
         centerTitle: true,
      ),
    );
  }
}
