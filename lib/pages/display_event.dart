import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/post_class.dart';

class EventDisplay extends StatefulWidget {

  final Post box;
  EventDisplay({Key key, @required this.box}):super(key: key);

  @override
  _EventDisplayState createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {

  String ename;
  String etype;
  String evenue;
  double duration;
  String description;
  String ImageURL;
  String Orgname;
  int Orgnumber;
  String Orgemail;
  String time;
  @override
  void initState() {

    Post newref= widget.box;
    ename= newref.eventname;
    etype= newref.eventtype;
    evenue= newref.eventvenue;
    duration= newref.duration;
    description=newref.eventDescription;
    ImageURL= newref.imageUrl;
    Orgname= newref.Orgname;
    Orgnumber=newref.Orgnumber;
    Orgemail=newref.Orgemail;
    time = newref.time;
    super.initState();
  }


  int _selectedIndex = 0;
  void _onItemTapped(int index){
    if(index==0)
    {
      Navigator.pop(context);
    }
    else if(index==1)
    {
      //Navigator.popAndPushNamed(context, '/');
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body: ListView(
          children: <Widget>[
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 250.0,
                  width: 200.0,
                  child: Image.network(
                    ImageURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null)
                        return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(child: Text(ename.toUpperCase(),style: TextStyle(
                letterSpacing: 3.0,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
               ),
              ),
            ),
            Divider(thickness: 5.0,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/ticket");
                },
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("OPEN QR CODE ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Event organizer",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                                backgroundColor: Colors.grey,
                            ),
                          ),
                          Text(Orgname.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text(
                              "CONTACT NUMBER",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 12.0,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "$Orgnumber",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Email-ID",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 12.0,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              Orgemail,
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 13.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("VENUE",
                         style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                           backgroundColor: Colors.grey,
                         ),
                       ),
                          Text(
                              evenue.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                              "DATE AND TIME",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Text(
                             time.substring(0,16),
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "EVENT TYPE",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                              backgroundColor: Colors.grey
                            ),
                          ),
                          Text(
                            etype.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Center(
                            child: Text("   EVENT \n DURATION",
                              style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 15.0,
                                backgroundColor: Colors.grey,
                              ),
                            ),
                          ),
                          Text(
                              "   $duration \n minutes",
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 2.0,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
              ],
            )
          ],
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
