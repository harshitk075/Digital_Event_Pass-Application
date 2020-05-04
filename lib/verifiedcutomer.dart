import 'package:flutter/material.dart';

class Verified extends StatefulWidget {
  @override
  _VerifiedState createState() => _VerifiedState();
}

class _VerifiedState extends State<Verified> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/verified.png"),
            SizedBox(height: 30.0,),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "SCAN NEXT GUEST",
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
