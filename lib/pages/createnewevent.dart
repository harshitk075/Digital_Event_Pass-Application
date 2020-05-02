import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaleventpass/date_time_picker.dart';
import 'package:digitaleventpass/pages/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:digitaleventpass/post_class.dart';
import 'package:digitaleventpass/pages/guest_class.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:digitaleventpass/globals.dart';

class CreateNewEvent extends StatefulWidget {
  @override
  _CreateNewEventState createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {

  File _image;
  Post event;
  String eventname;
  String description;
  String venue;
  String imageUrl;
  DateTime time;
  double duration;
  String eventtype;

  StorageReference storageReference;
  Future<void> uploadImage() async{

    String filename = p.basename(_image.path);
    storageReference = FirebaseStorage.instance.ref().child("images/$filename");
    final StorageUploadTask uploadTask = storageReference.putFile(_image);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    imageUrl =url;
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void takedate(DateTime value) {
    time = value;
    //print(time);
  }

  String dropdownValue = 'EVENTCHOOSE';

  final databaseReference = Firestore.instance;
  Future SaveEvent() async {
    await uploadImage();
    //print(imageUrl);
    await databaseReference.collection("OrganizerContainer").document(Globaldata.OrganizerID).collection("Events")
          .add({
      "eventname": eventname,
      "eventtype": eventtype,
      "eventduration":duration,
      "eventvenue": venue,
      "imageurl"  : imageUrl,
      "eventdescription" : description,
      "eventTimeAndDate" : time.toString(),
    });

    await databaseReference.collection("events")
        .add({
      "eventname": eventname,
      "eventtype": eventtype,
      "eventduration":duration,
      "eventvenue": venue,
      "imageurl"  : imageUrl,
      "eventdescription" : description,
      "eventTimeAndDate" : time.toString(),
    });

  }

  @override
  Widget build(BuildContext context) {
    return (Guest.is_profileset == 1) ? Container(
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
                  ) : ClipRRect(child: Image.file(_image,fit: BoxFit.cover,),borderRadius: BorderRadius.circular(30.0),),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Enter Event Name',
                        labelText: 'Event Name',
                      ),
                      onChanged: (value) {
                        setState(() {
                          eventname = value;
                        });
                      },
                    ),
                    SizedBox(height: 15.0,),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_downward),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                color: Colors.black
                            ),
                            underline: Container(
                              height: 2,
                              color: Colors.black,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                eventtype = newValue;
                              });
                            },
                            items: <String>[
                              'EVENTCHOOSE',
                              'Concert',
                              'Comedy',
                              ' Sports',
                              'Circus',
                              'Theatre',
                              'Dance'
                            ]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0,),
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
                      onChanged: (value) {
                        setState(() {
                          duration = double.parse(value);
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.location_on),
                        hintText: 'Enter venue',
                        labelText: 'Veneue',
                      ),
                      onChanged: (value) {
                        setState(() {
                          venue = value;
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
                            decoration: InputDecoration.collapsed(
                                hintText: "Add Event Description"),
                            onChanged: (value) {
                              setState(() {
                                description = value;
                              });
                            },
                          ),
                        )
                    ),
                    FlatButton(
                      color: Colors.blue,
                      child: Text("SAVE EVENT"),
                      onPressed: () async {
                          await SaveEvent();
                          Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ) : Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("YOU NEED TO SET YOUR PROFILE FIRST"),
            SizedBox(height: 20.0,),
            RaisedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/createorgprofile");
              },
              icon: Icon(
                Icons.person,
              ),
              label: Text("SET PROFILE"),
            )
          ],
        ),
      ),
    );
  }
}