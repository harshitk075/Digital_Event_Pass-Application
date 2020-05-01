import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:digitaleventpass/pages/user/columntemplate.dart';
import 'package:digitaleventpass/pages/eventcard.dart';
import 'package:intl/intl.dart';
import 'package:digitaleventpass/post_class.dart';

class userPage extends StatefulWidget {
  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<userPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _firestore = Firestore.instance;
  int _selectedIndex = 0;

  List<EventCard> eventList = [];
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
  void initState() {
    fetchUpdates();
  }

  void fetchUpdates() async{

    await for(var snapshot in _firestore.collection('events').orderBy('eventTimeAndDate', descending: true).snapshots())
    {
      List<EventCard> newUpdatesList = [];
      print(snapshot.documents.length);
      for(var message in snapshot.documents)
      {
        String eventName,eventVenue,EventID,eventimgURL;
//        String eventDateAndTime;
        EventID= message.documentID;
        eventVenue = message.data['eventvenue']??'Message Text Unavailable';
        eventName = message.data['eventname']??'Event Unavailable';
        eventimgURL= message.data['imageurl']??'No Image';
//      eventDateAndTime = message.data['eventTimeAndDate']??'Time and date not Unavailable';
        newUpdatesList.add(EventCard(event: eventName,venue: eventVenue,eventID: EventID, eventimageurl: eventimgURL, route: "/eventdisplay"));
      }
      setState(() {
        eventList = newUpdatesList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: ColumnTemplate(
         columnTitle: 'Events',
         childWidget: Expanded(
          child: Container(
           child: ListView.builder(
            itemCount: eventList.length,
            itemBuilder: (BuildContext context,int index){
              return eventList[index];
            },
          ),
          ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hi ##NAMEorganizer",
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/party.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            ListTile(
              title: Text('SET PROFILE'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/createorgprofile");
              },
            ),
            Divider(height: 2.0,thickness: 2.0,color: Colors.black,),
            ListTile(
              title: Text('SETTINGS'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
            Divider(height: 2.0,thickness: 2.0,color: Colors.black,),
            ListTile(
              title: Text('LOG OUT'),
              onTap: () {
                // Update the state of the app.
                Navigator.pop(context);
              },
            ),
            Divider(height: 2.0,thickness: 2.0,color: Colors.black,),
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
