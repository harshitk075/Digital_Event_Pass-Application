import 'package:flutter/material.dart';
import 'package:digitaleventpass/pages/home.dart';
import 'package:digitaleventpass/pages/organizerpage.dart';
import 'package:digitaleventpass/pages/user/userpage.dart';

void main() => runApp(MaterialApp(
   initialRoute: "/",
   routes: {
     "/" : (context)=> home(),
     "/organizerPage" : (context)=> organizerPage(),
     "/userPage"      : (context)=> userPage(),
   },
));


