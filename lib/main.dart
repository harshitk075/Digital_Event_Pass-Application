import 'package:digitaleventpass/pages/createprofile.dart';
import 'package:digitaleventpass/pages/loginpage.dart';
import 'package:digitaleventpass/pages/createnewevent.dart';
import 'package:digitaleventpass/pages/manageevent.dart';
import 'package:digitaleventpass/pages/organizerprofile.dart';
import 'package:digitaleventpass/pages/user/show_profile.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/pages/home.dart';
import 'package:digitaleventpass/pages/organizerpage.dart';
import 'package:digitaleventpass/pages/user/userpage.dart';

void main() => runApp(MaterialApp(
  title: "Digital Event Pass",
   theme: ThemeData(
     brightness: Brightness.dark,
     primaryColor: Color.fromARGB(255, 74, 22, 60),
    scaffoldBackgroundColor: Color.fromARGB(255, 74, 22, 60),
    accentColor: Color.fromARGB(255, 166, 22, 92)
   ),
   initialRoute: "/createprofile",
   routes: {
     "/" : (context)=> home(),
     "/organizerPage" : (context)=> organizerPage(),
     "/userPage"      : (context)=> userPage(),
     "/manageevent"   : (context)=> ManageEvent(),
     "/newevent"      : (context)=> CreateNewEvent(),
     "/orgprofile"    : (context)=> OrgProfile(),
     "/login"         : (context)=> Login(),
     "/createprofile" : (context)=> CreateProfile(),
     "/showprofile"   : (context)=> ShowProfile(),
   },
));


