import 'package:digitaleventpass/pages/createorganizerprofile.dart';
import 'package:digitaleventpass/pages/display_event.dart';
import 'package:digitaleventpass/pages/qr_utilitty.dart';
import 'package:digitaleventpass/pages/user/ticket_template.dart';
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
     primaryColor: Colors.cyan[300],
     scaffoldBackgroundColor: Colors.grey[200],
     accentColor: Colors.blue[400],
   ),
   initialRoute: "/",
   routes: {
     "/"              : (context)=> home(),
     "/organizerPage" : (context)=> organizerPage(),
     "/userPage"      : (context)=> userPage(),
     "/manageevent"   : (context)=> ManageEvent(),
     "/newevent"      : (context)=> CreateNewEvent(),
     "/login"         : (context)=> Login(),
     "/createprofile" : (context)=> ViewProfile(),
     "/showprofile"   : (context)=> ShowProfile(),
     "/viewprofile"   : (context)=> ViewProfile(),
     "/qrutility"     : (context)=> QrUtility(),
     "/ticketshow"    : (context)=> Ticket(),
     "/eventdisplay"   : (context)=> EventDisplay(),
     "/createorgprofile": (context)=> CreateOrganizerProfile() ,
   },
));


