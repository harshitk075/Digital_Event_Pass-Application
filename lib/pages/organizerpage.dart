import 'package:flutter/cupertino.dart';
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
         title: Row(
           children: <Widget>[
             Text("Organizer Home Page"),
           ],
         ),
         centerTitle: true,
      ),
      drawer : Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.indigo[300],
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: RaisedButton.icon(
          onPressed: (){
             Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
          label: Text("BACK"),
          splashColor: Colors.blueGrey,
       ),
      );
  }
}
