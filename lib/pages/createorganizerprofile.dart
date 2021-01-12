import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaleventpass/globals.dart';
import 'package:digitaleventpass/pages/organizerpage.dart';
import 'package:digitaleventpass/sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';

class CreateOrganizerProfile extends StatefulWidget {
  @override
  _CreateOrganizerProfileState createState() => _CreateOrganizerProfileState();
}

final _firestore = Firestore.instance;

class _CreateOrganizerProfileState extends State<CreateOrganizerProfile> {
  File _image = null;
  String orgID = Globaldata.OrganizerID;
  String orgname;
  int orgcontactNumber;
  String orgmailId;
  String orggender;
  String orgimgurl;
  StorageReference storageReference;
  bool isphotoupload = false;

  Future<void> uploadImage() async {
    String filename = p.basename(_image.path);
    storageReference = FirebaseStorage.instance.ref().child("images/$filename");
    final StorageUploadTask uploadTask = storageReference.putFile(_image);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    orgimgurl = url;
    setState(() {
      isphotoupload = true;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget BlankIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.add_a_photo,
          size: 30.0,
        ),
        Text("Choose Profile\n picture"),
      ],
    );
  }

  String dropdownValue = 'GENDER';
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.pop(context);
    } else if (index == 1) {
      //Navigator.popAndPushNamed(context, '/');
      Navigator.pop(context);
    }
  }

  final databaseReference = Firestore.instance;
  //push to firestore function

  Future PushToDb() async {
    //make guest object to reference at alter stage
    bool isNewUser = true;
    try {
      await _firestore
          .collection('OrganizerContainer')
          .document(uid)
          .get()
          .then((value) {
        if (value.data['OrgmailId'] != null) {
          setState(() {
            isNewUser = false;
          });
          _firestore.collection('OrganizerContainer').document(uid).updateData({
            'OrgGender': orggender,
            'OrgContactNumber': orgcontactNumber,
          });
        }
      });
    } catch (e) {
      print('NEW USER');
    }
//      Guest obj = new Guest(orgID,orgname,orgmailId,orggender,orgcontactNumber,orgimgurl);
    if (isNewUser) {
      await databaseReference
          .collection("OrganizerContainer")
          .document(uid)
          .setData({
        'OrgName': orgname,
        'OrgmailId': orgmailId,
        'OrgGender': orggender,
        'OrgContactNumber': orgcontactNumber,
        'OrgimgURL': orgimgurl,
      });
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('kSPuid', uid);
    preferences.setBool('kSPfirstLogIn', false);

    Fluttertoast.showToast(
        msg: 'Profile Saved Successfully', toastLength: Toast.LENGTH_SHORT);
//      Navigator.pop(context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => organizerPage(
            mUid: uid,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                        height: 180.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: _image == null
                            ? BlankIcon()
                            : ClipRRect(
                                child: Image.file(
                                  _image,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                      ),
                    ),
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      //padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () async {
                        await uploadImage();
                        Fluttertoast.showToast(
                            msg: 'Image Uploaded Successfully',
                            toastLength: Toast.LENGTH_SHORT);
                      },
                      child: Text(
                        "  Upload  ",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Container(
                    height: 160.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          validator: (value) =>
                              value.isEmpty ? 'Name cannot be empty' : null,
                          onChanged: (text) {
                            setState(() {
                              orgname = text;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) =>
                              value.isEmpty ? 'Name cannot be empty' : null,
                          onChanged: (value) {
                            setState(() {
                              orgcontactNumber = int.parse(value);
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              validator: (value) =>
                  value.isEmpty ? 'Name cannot be empty' : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email-ID',
              ),
              onChanged: (text) {
                setState(() {
                  orgmailId = text;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  orggender = newValue;
                });
              },
              items: <String>['GENDER', 'MALE', 'FEMALE', 'OTHERS']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: RaisedButton(
                onPressed: () async {
                  if (isphotoupload) {
                    await PushToDb();
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Upload Image first',
                        toastLength: Toast.LENGTH_SHORT);
                  }
                },
                color: Theme.of(context).accentColor,
                child: Text("SUBMIT"),
              ),
            )
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
