import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class organizerPage extends StatefulWidget {
  @override
  _organizerPageState createState() => _organizerPageState();
}

class _organizerPageState extends State<organizerPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
       body: SafeArea(
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 30.0),
           child: ListView(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(left: 30.0, right: 120.0),
                 child: Text(
                   "choose your action",
                   style: TextStyle(
                     fontSize: 30.0,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               ),
               SizedBox(height: 20.0),
                Row(
                  children: <Widget>[

                  ],
                ),
               SizedBox(height: 40.0),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Options available",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18.0,
                             letterSpacing: 1.5,
                           ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 300.0,
                    color: Colors.blueGrey,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: null
                    ),
                  ),
                ],
              )
             ],
           ),
         ),
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
