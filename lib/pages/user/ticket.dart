import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticket extends StatefulWidget {
  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {

  GlobalKey _renderObjectKey;

  String QRdata;
  String RegID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Ticket"),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 20.0),
          Center(
            child: Text(
              "Event Name",
              style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
              height: 450.0,
              width: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(child: Text(
                        "Your Ticket Information",
                        style: TextStyle(
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),),
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  (QRdata!=null)?
                  RepaintBoundary(
                    key: _renderObjectKey,
                    child: QrImage(data: QRdata,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ):Container(
                    height: 200,
                    width: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Text("ENTER UNIQUE QR"),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Unique Code',
                      ),
                      onChanged: (value) {
                        RegID=value;
                      },
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        QRdata= RegID;
                      });
                    },
                    color: Theme.of(context).accentColor,
                    child: Text("ROLL IN"),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );;
  }
}
