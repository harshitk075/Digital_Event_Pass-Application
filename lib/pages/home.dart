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
          margin: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    padding: EdgeInsets.fromLTRB(30, 15, 15, 15),
                    height:170.0,
                    child :Row(

                       children: <Widget>[Icon(Icons.business_center, size: 70,
                       color: Colors.brown[800],),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('ORGANIZE AN EVENT', style: TextStyle(
                          color: Colors.brown[800],
                      fontWeight: FontWeight.w800,
                        fontSize: 20
                      ),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: 18.0),
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
                  child:Container(
                    padding: EdgeInsets.fromLTRB(30, 15, 15, 15),
                    width: 300.0,
                    height:170.0,
                    child :Row(

                        children: <Widget>[Icon(Icons.event, size: 70),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text('EXPLORE EVENTS', style: TextStyle(color: Colors.white)),
                        ]),
                  ),
                ),
              ),
            ],

          ),
      ),
    );
  }
}
