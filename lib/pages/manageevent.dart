import 'package:digitaleventpass/pages/qr_utilitty.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaleventpass/pages/user/columntemplate.dart';
import 'package:digitaleventpass/pages/eventcard.dart';
import 'package:intl/intl.dart';

class ManageEvent extends StatefulWidget {
  @override
  _ManageEventState createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {

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

    await for(var snapshot in _firestore.collection('events').orderBy('createdAt', descending: true).snapshots())
    {
      List<EventCard> newUpdatesList = [];
      for(var message in snapshot.documents)
      {
        String msg,event,displayDate;
        msg = message.data['venue']??'Message Text Unavailable';
        event=message.data['event']??'Event Unavailable';

        int timestamp = message.data['createdAt']??1580187210337;
        var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
        displayDate=DateFormat("dd MMM yyyy hh:mm a").format(date).toString();

        newUpdatesList.add(EventCard(event: event,date: displayDate, venue: msg,));
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
          columnTitle: ' Your Events',
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


//FlatButton(
//child: Text("SCAN TICKET"),
//onPressed:() {
//Navigator.pushNamed(context, "/qrutility") ;
//},
//)