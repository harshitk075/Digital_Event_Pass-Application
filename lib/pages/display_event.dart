import 'package:flutter/material.dart';

class EventDisplay extends StatefulWidget {

  @override
  _EventDisplayState createState() => _EventDisplayState();
}

class _EventDisplayState extends State<EventDisplay> {

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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    image: DecorationImage(
                      image: NetworkImage("https://www.womensbusinessdaily.com/wp-content/uploads/2017/07/Messe_Luzern_Corporate_Event.jpg"),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Center(child: Text("ASMITA",style: TextStyle(letterSpacing: 3.0,fontSize: 15.0),)),
            SizedBox(height: 20.0),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Event organizer"),
                          Text("##Organizer name"),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                        image: DecorationImage(
                          image: NetworkImage("https://avatars1.githubusercontent.com/u/47221273?s=460&u=e86600f2266d871277b266cd11092f9778f4c496&v=4"),
                          fit: BoxFit.cover,
                        )
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
                        color: Colors.grey[700],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("VENUE"),
                          Text("##PRINT VENUE"),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("DATE AND TIME"),
                          Text("##DATE AND TIME HERE"),
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
                        color: Colors.grey[700],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("details x"),
                          Text("##detail xxxx"),
                        ],
                      ),
                    ),
                    Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[700],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("details x"),
                          Text("##detail xxxx"),
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
