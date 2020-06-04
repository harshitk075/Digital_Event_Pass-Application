import 'package:digitaleventpass/Notverified.dart';
import 'package:digitaleventpass/pages/createorganizerprofile.dart';
import 'package:digitaleventpass/pages/display_event.dart';
import 'package:digitaleventpass/pages/eventupdations.dart';
import 'package:digitaleventpass/pages/qr_utilitty.dart';
import 'package:digitaleventpass/pages/user/ticket.dart';
import 'package:digitaleventpass/pages/viewprofile.dart';
import 'package:digitaleventpass/pages/loginpage.dart';
import 'package:digitaleventpass/pages/createnewevent.dart';
import 'package:digitaleventpass/pages/manageevent.dart';
import 'package:digitaleventpass/pages/user/show_profile.dart';
import 'package:digitaleventpass/verifiedcutomer.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/pages/home.dart';
import 'package:digitaleventpass/pages/organizerpage.dart';
import 'package:digitaleventpass/pages/user/userpage.dart';
import 'package:digitaleventpass/pages/eventinviteelist.dart';
import 'map_activity.dart';


void main() => runApp(MaterialApp(
  title: "Digital Event Pass",
   theme: ThemeData(
     primaryColor: Colors.cyan[300],
     scaffoldBackgroundColor: Colors.grey[200],
     accentColor: Colors.blue[400],
   ),
   initialRoute: "/map",
   routes: {
     "/"              : (context)=> home(),
     "/organizerPage" : (context)=> organizerPage(),
     "/userPage"      : (context)=> userPage(),
     "/manageevent"   : (context)=> ManageEvent(),
     "/newevent"      : (context)=> CreateNewEvent(),
     "/login"         : (context)=> Login(),
     "/showprofile"   : (context)=> ShowProfile(),
     "/viewprofile"   : (context)=> ViewProfile(),
     "/qrutility"     : (context)=> QrUtility(),
     "/ticket"        : (context)=> Ticket(),
     "/eventdisplay"   : (context)=> EventDisplay(),
     "/createorgprofile":(context)=> CreateOrganizerProfile(),
     "/eventupdations" : (context)=>EventUpdations(),
     "/makelist"       : (context)=>MakeList(),
     "/verified"       : (context)=>Verified(),
     "/notverified"    :(context)=> NotVerified(),
     "/map": (context)=> MapActivity(),
   },
));


