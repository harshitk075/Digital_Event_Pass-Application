import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewEvent extends StatefulWidget {
  @override
  _CreateNewEventState createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/backtexture.png"),
        fit: BoxFit.cover,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: <Widget>[
            Container(
              height: 220.0,
              width: 380.0,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add_a_photo,
                    size: 50.0,
                  ),
                  Text("Upload photo"),
                ],
              )
            ),
            SizedBox(height: 10.0),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.orange[300],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Provide Info For Event",
                       style: TextStyle(
                         letterSpacing: 3.0,
                         fontSize: 20.0,
                         fontWeight: FontWeight.bold,
                       ),
                  ),
                ],
              ),
            ),
            Form(
              autovalidate: true,
               child: Padding(
                 padding: const EdgeInsets.all(13.0),
                 child: Column(
                     children: <Widget>[
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.calendar_today),
                           hintText: 'Enter Event Name',
                           labelText: 'Event Name',
                         ),
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.local_activity),
                           hintText: 'Enter type of event to organize',
                           labelText: 'Event Type',
                         ),
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.date_range),
                           hintText: 'Enter Event Date',
                           labelText: 'Event Date',
                         ),
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.timelapse),
                           hintText: 'Enter time of event',
                           labelText: 'Timing',
                         ),
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.location_on),
                           hintText: 'Enter venue',
                           labelText: 'Veneue',
                         ),
                       ),
                     ],
                   ),
               ),
            ),
          ],
      ),
      ),
    );
  }
}
