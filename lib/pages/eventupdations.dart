import 'package:flutter/material.dart';

class EventUpdations extends StatefulWidget {
  final String EventID;

  EventUpdations({Key key, @required this.EventID}):super(key: key);

  @override
  _EventUpdationsState createState() => _EventUpdationsState();
}

class _EventUpdationsState extends State<EventUpdations> {

  int _selectedIndex = 0;
  String EventID;

  @override
  void initState() {

    EventID = widget.EventID;
    super.initState();
  }

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
      appBar: AppBar(
        title: Text("MANAGE EVENT",style: TextStyle(fontSize: 25.0,letterSpacing: 2.0),),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 10.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
        child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               GestureDetector(
                 onTap: (){
                   Navigator.pushNamed(context, "/qrutility");
                 },
                 child: Container(
                   height: 150.0,
                   width: 200.0,
                   decoration: BoxDecoration(
                     color: Theme.of(context).scaffoldBackgroundColor,
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       ClipRRect(
                         borderRadius: BorderRadius.circular(15.0),
                         child: Image(
                           image: AssetImage("assets/qrscan.jpg"),
                         ),
                       ),
                       Text(
                         " SCAN \n QRs",
                         style: TextStyle(
                           fontSize: 30.0,
                           fontWeight: FontWeight.bold,
                           letterSpacing: 2.0,
                           color: Colors.black,
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/makelist", arguments: {'ID': EventID});
                },
                child: Container(
                  height: 150.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: AssetImage("assets/list.png"),
                        ),
                      ),
                      Text(
                        "  Manage \n  Invitees",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: 150.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image(
                          image: AssetImage("assets/change_profile.png"),
                        ),
                      ),
                      Text(
                        " Modify \n Event",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
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
