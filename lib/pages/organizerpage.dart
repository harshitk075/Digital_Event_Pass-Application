import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class organizerPage extends StatefulWidget {
  @override
  _organizerPageState createState() => _organizerPageState();
}

class _organizerPageState extends State<organizerPage> {

  List<String> coll= ["Create New Event","Manage Existing Event","View Profile"];
  List<String> img= ["assets/newevent.png","assets/img2.png","assets/profile.jpg"];
  List<String> navi=["/newevent","/manageevent","/viewprofile"];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
     if(index==0)
       {
          Navigator.pop(context);
       }
     else if(index==1)
       {
         //Navigator.popAndPushNamed(context, '/');
         Navigator.pop(context);
       }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ListView(
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(width: 5.0),
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    child: Icon(
                      Icons.dehaze,
                      size: 35.0,
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Text(
                    "EVENT ORGANIZER",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.0),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "choose your action",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            letterSpacing: 1.5,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 300.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: coll.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, navi[idx]);
                            },
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              width: 210.0,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Positioned(
                                    bottom: 15.0,
                                    child: Container(
                                      width: 200.0,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .center,
                                          mainAxisAlignment: MainAxisAlignment
                                              .end,
                                          children: <Widget>[
                                            Text(
                                              coll[idx],
                                              style: TextStyle(
                                                fontSize: 22.0,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      boxShadow: [BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(0.0, 2.0),
                                        blurRadius: 6.0,
                                      )
                                      ],
                                    ),
                                    child: Stack(
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              20.0),
                                          child: Image(
                                            height: 180.0, width: 180.0,
                                            image: AssetImage(img[idx]),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],),
                            ),
                          );
                        }
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(
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
                color: Theme.of(context).accentColor,
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            title: Text("Back"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}
