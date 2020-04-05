import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget{
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title: Text("Digital Event Pass",style: TextStyle(color: Colors.black)),
    ),
    body: Center(child: Text("Hello")),
    bottomNavigationBar: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle),
        title: Text("User")),
        BottomNavigationBarItem(icon: Icon(Icons.list),
        title: Text("List")
        )
      ]
    )
  );
}
}