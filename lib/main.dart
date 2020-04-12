import 'package:flutter/material.dart';
import 'package:digitaleventpass/screens/home.dart';
import 'screens/creator.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  routes: {
    "/creator":(context) => eventCreator()
  },
));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return homePage();
  }
}