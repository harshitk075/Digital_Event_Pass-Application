import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/pages/guest_class.dart';
import 'package:image_picker/image_picker.dart';

class CreateOrganizerProfile extends StatefulWidget {
  @override
  _CreateOrganizerProfileState createState() => _CreateOrganizerProfileState();
}

class _CreateOrganizerProfileState extends State<CreateOrganizerProfile> {

  File _image = null;
  String _name;
  String _contactNumber;
  String _emailId;
  String _gender;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Widget BlankIcon(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.add_a_photo,
          size: 30.0,
        ),
        Text("Upload photo"),
      ],
    );
  }

  String dropdownValue = 'GENDER';

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
    }
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
                GestureDetector(
                  onTap: () {
                    getImage();
                    print("$_image");
                  },
                  child: Container(
                    height: 180.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: _image==null ? BlankIcon() : ClipRRect(child: Image.file(_image,fit: BoxFit.cover,),borderRadius: BorderRadius.circular(15.0),),
                  ),
                ),
                SizedBox(width: 8.0,),
                Expanded(
                  child: Container(
                    height: 160.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          onChanged: (text) {
                            _name= text;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                          ),
                          onChanged: (text) {
                            _contactNumber= text;
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.0,),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email-ID',
              ),
              onChanged: (text) {
                _emailId= text;
              },
            ),
            SizedBox(height: 20.0,),
            DropdownButton<String>(
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
               _gender=newValue;
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
                onPressed: (){
                  //here we write a function to instantiate the guest class using Guest() callback
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
