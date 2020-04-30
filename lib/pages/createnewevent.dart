import 'dart:io';
import 'package:digitaleventpass/date_time_picker.dart';
import 'package:digitaleventpass/pages/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:digitaleventpass/post_class.dart';

import 'enums.dart';
import 'enums.dart';

class CreateNewEvent extends StatefulWidget {
  @override
  _CreateNewEventState createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  File _image;
  Post _event;
  String _name;
  String _description;
  String _venue;
  String _imageUrl;
  DateTime _time;
  double _duration;
  EventType _eventType = EventType.Theatre;



  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
  void takedate(DateTime value){
      print("takedate working prroperly");
      _time = value;
      print(_time);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/backsm2.jpg"),
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
              child: InkWell(
                onTap: () {
                  getImage();
                  print("$_image");
                },
                child: _image == null ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add_a_photo,
                      size: 50.0,
                    ),
                    Text("Upload photo"),
                  ],
                ): Image.file(_image),
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
                         onChanged: (value){
                           setState(() {
                             _name = value;
                           });
                         },
                       ),
//                          DropdownButton<EventType>(
//                            value: _eventType,
//                            items: EventType.values.map((EventType value){
//                              return DropdownMenuItem<EventType>(
//                               value: value,
//                               child: Text(value.name));
//                              }).toList(),
//                            onChanged: (EventType value) {
//                              setState(() {
//                                _eventType = value;
//                              });
//                            },
//                          ),
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           icon: const Icon(Icons.local_activity),
//                           hintText: 'Enter type of event to organize',
//                           labelText: 'Event Type',
//                         ),
//                         onChanged: (value){
//                           setState(() {
//                             _description = value;
//                           });
//                         },
//                       ),
//                       TextFormField(
//                         decoration: const InputDecoration(
//                           icon: const Icon(Icons.date_range),
//                           hintText: 'Enter Event Date',
//                           labelText: 'Event Date',
//                         ),
//                       ),
                     BasicDateTimeField(
                      onChng: takedate,
                     ),
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.timelapse),
                           hintText: 'Enter duration of event',
                           labelText: 'Duration in minutes',
                         ),
                         keyboardType: TextInputType.number,
                           onChanged: (value){
                             setState(() {
                               _duration = double.parse(value);
                             });
                           },
                       ),
                       TextFormField(
                         decoration: const InputDecoration(
                           icon: const Icon(Icons.location_on),
                           hintText: 'Enter venue',
                           labelText: 'Veneue',
                         ),
                         onChanged: (value){
                           setState(() {
                             _venue = value;
                           });
                         },
                       ),
                       SizedBox(height: 20.0),
                       Card(
                           color: Colors.grey[200],
                           child: Padding(
                             padding: EdgeInsets.all(8.0),
                             child: TextField(
                               maxLines: 8,
                               decoration: InputDecoration.collapsed(hintText: "Add Event Description"),
                               onChanged: (value){
                                 setState(() {
                                   _description = value;
                                 });
                               },
                             ),
                           )
                       ),
                       FlatButton(child: Text("Save"),
                         onPressed:()  {
                            setState(() {
                              saveEvent();
                            });
                         },

                       )
                     ],
                   ),
               ),
            ),
          ],
         ),
      ),
    );
  }

  void saveEvent() {

  }
}
