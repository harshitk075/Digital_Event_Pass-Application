import 'package:flutter/material.dart';
import 'package:digitaleventpass/home.dart';

void main() => runApp(MaterialApp(
   initialRoute: "/home",
   routes: {
     "/home" : (context)=> home(),
   },
));


