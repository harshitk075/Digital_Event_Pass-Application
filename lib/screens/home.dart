import 'package:flutter/material.dart';
import 'package:digitaleventpass/screens/creator.dart';
import '../commons/customRaisedButton.dart';

class homePage extends StatefulWidget{
  homePageState createState() => homePageState();
}

class homePageState extends State<homePage> {
Widget build(BuildContext context){
  return Scaffold(
    body: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 30),
            child: Card(
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 60.0,
                    width:200.0,
                    child:RaisedButton(
                      onPressed: () => Navigator.pushNamed(context, "/creator"),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              height: 60.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.add, size: 30, color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 2.0, color:Colors.white)
                                )
                              ),
                            ),
                          ),
                          Text("Create Event",style:TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500)),
                          ],
                      ),
                  color: Color(0xFF3366FF),
                )
                  ),
                  Divider(),
                  Container(
                    height: 60.0,
                    width:200.0,
                    child:RaisedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              height: 60.0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.event, size: 30, color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(width: 2.0, color:Colors.white)
                                )
                              ),
                            ),
                          ),
                          Text("Search Events",style:TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w500)),
                          ],
),
                  color: Color(0xFF3366FF)
                )
                  ),
              ]
        ),
            ),
          ), 
      )
    );
}
}