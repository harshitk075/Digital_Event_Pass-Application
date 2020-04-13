import 'package:flutter/material.dart';

class Event extends StatefulWidget{
    eventState createState() => new eventState();
}
class eventState extends State<Event>{
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Card(
          child:
          Column(
            children: <Widget>[
              Container(
          margin: const EdgeInsets.all(10.0),
          height: 300,
          width:400,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color:Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0)
              )
            ]
          ),
          child:Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset('assets/art.png',
                  fit: BoxFit.cover,),
                  ),
              ),
              Container(
                color:Colors.red,
                    width: 400,
                    height:120,
                    child: Column(
                      children: <Widget>[
                        Align(
                        child:Text("Sunidhi@IIIT ALLAHABAD",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0
                        ),
                        ),
                        alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
            ]
              ),
          )
        )
    );
}
}