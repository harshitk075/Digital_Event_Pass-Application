import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {

	String gender= "male";

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
				title: Text("View Profile"),
			),
			body: ListView(
				children: <Widget>[
					SizedBox(height: 10.0,),
					Center(
						child: CircleAvatar(
							backgroundImage: NetworkImage("https://avatars1.githubusercontent.com/u/47221273?s=460&u=e86600f2266d871277b266cd11092f9778f4c496&v=4"),
							maxRadius: 100.0,
						),
					),
					SizedBox(height: 20.0,),
					Center(child: Text("##NAMEORGANIZER",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2.0),)),
					SizedBox(height: 30.0,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							  Text(
									"EMAIL"
								),
							SizedBox(width: 30.0,),
							Text(
								"##EMIAL"
							)
						],
					),
					SizedBox(height: 20.0,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							Text(
									"Contact Number"
							),
							SizedBox(width: 30.0,),
							Text(
									"##Number"
							)
						],
					),
					SizedBox(height: 20.0,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							Text(
									"Gender"
							),
							SizedBox(width: 30.0,),
							(gender=="male" || gender=="MALE") ? Icon(FontAwesomeIcons.male,size: 40.0,color: Theme.of(context).accentColor): Icon(FontAwesomeIcons.female,size: 40.0,color: Theme.of(context).accentColor),
						],
					),
				],
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
