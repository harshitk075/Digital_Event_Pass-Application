import 'package:digitaleventpass/pages/qr_utilitty.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class ManageEvent extends StatefulWidget {
  @override
  _ManageEventState createState() => _ManageEventState();
}

class _ManageEventState extends State<ManageEvent> {

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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          FlatButton(
            child: Text("SCAN TICKET"),
            onPressed:() {
           Navigator.pushNamed(context, "/qrutility") ;
            },
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
