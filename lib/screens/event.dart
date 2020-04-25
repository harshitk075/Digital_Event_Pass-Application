import 'package:flutter/material.dart';

class Event extends StatefulWidget{
    eventState createState() => new eventState();
}
class eventState extends State<Event>{
  List<String> name=["assets/art1.png","assets/art2.png","assets/art3.png","assets/art4.png"];
  List<String> organizeName=["Effe'19","Effe'19","Effe'19","Effe'19"];
  List<String> location=["Allahabad","Allahabad","Allahabad","Allahabad"];
  Widget build(BuildContext context){
    return Scaffold(
      body: _buildList(),
    );
  }
  Widget _buildList() {
      return ListView.builder(
        itemCount: name.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, index){
          return eventCard(index);
            }
          );
        }
  Widget eventCard(int index){
    return Container(
      width: 400,
      height: 400,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0)
        ),
        margin: EdgeInsets.all(10.0),
        color: Colors.grey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album, size:50),
              title: Text("Effe'19", style: TextStyle(color:Colors.white),),
              subtitle: Text("Allahabad", style: TextStyle(color:Colors.white),),
            ),
            Divider(),
            Container(
              height: 200,
              width:400,
              child: Image.asset(name[index],
              fit: BoxFit.cover,),
              color: Colors.teal,
            ),
            Divider(),           
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50,
              width:350,
              child:Row(
                children: <Widget>[
                  Align(
                  child:FlatButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text("Add")),
                  alignment: Alignment(0.0, 0.0)),
                  Align(
                  child:FlatButton.icon(onPressed: (){}, icon: Icon(Icons.share), label: Text("Share")),
                  alignment: Alignment(0.0, 0.0)),
                ],
              )
            )
        ],
      )
    ),
  );
  }
}