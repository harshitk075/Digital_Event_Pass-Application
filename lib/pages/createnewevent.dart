import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:digitaleventpass/post_class.dart';

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

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
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
                }
                ,
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
                       SizedBox(height: 20.0),
                       Card(
                           color: Colors.grey[200],
                           child: Padding(
                             padding: EdgeInsets.all(8.0),
                             child: TextField(
                               maxLines: 8,
                               decoration: InputDecoration.collapsed(hintText: "Add Event Description"),
                             ),
                           )
                       ),
                       Card(

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
}
