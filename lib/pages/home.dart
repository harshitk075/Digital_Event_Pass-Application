import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
               shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.orangeAccent,
                elevation: 10,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pushNamed(context, "/organizerPage");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    width: 300.0,
                    height:170.0,
                    child :const ListTile(
                      leading: Icon(Icons.album, size: 70),
                      title: Text('ORGANIZE AN EVENT', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.orangeAccent,
                elevation: 10,
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pushNamed(context, "/userPage");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    width: 300.0,
                    height:170.0,
                    child :const ListTile(
                      leading: Icon(Icons.album, size: 70),
                      title: Text('EXPLORE EVENTS', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
            ],

          ),
      ),
    );
  }
}
