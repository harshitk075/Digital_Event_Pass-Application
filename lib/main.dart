import 'package:digitaleventpass/pages/viewprofile.dart';
import 'package:digitaleventpass/pages/loginpage.dart';
import 'package:digitaleventpass/pages/createnewevent.dart';
import 'package:digitaleventpass/pages/manageevent.dart';
import 'package:digitaleventpass/pages/user/show_profile.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/pages/home.dart';
import 'package:digitaleventpass/pages/organizerpage.dart';
import 'package:digitaleventpass/pages/user/userpage.dart';


void main() => runApp(MaterialApp(
  title: "Digital Event Pass",
   theme: ThemeData(
     primaryColor: Colors.lightBlueAccent,
     scaffoldBackgroundColor: Colors.grey[200],
     accentColor: Colors.orangeAccent,
   ),
   initialRoute: "/",
   routes: {
     "/" : (context)=> home(),
     "/organizerPage" : (context)=> organizerPage(),
     "/userPage"      : (context)=> userPage(),
     "/manageevent"   : (context)=> ManageEvent(),
     "/newevent"      : (context)=> CreateNewEvent(),
     "/login"         : (context)=> Login(),
     "/createprofile" : (context)=> ViewProfile(),
     "/showprofile"   : (context)=> ShowProfile(),
     "/viewprofile"   : (context)=> ViewProfile(),
   },
));


