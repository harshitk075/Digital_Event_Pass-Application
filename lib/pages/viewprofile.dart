import 'package:digitaleventpass/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digitaleventpass/pages/home.dart';

class ViewProfile extends StatefulWidget {
  @override
  _ViewProfileState createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {

	String gender= home.getgender();
	String Orgname= home.getUsername();
  int number=  home.getnumber();
	String mailid =home.getemail();
  String imgurl=home.geturl();

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
							backgroundImage: NetworkImage(imgurl),
							maxRadius: 100.0,
						),
					),
					SizedBox(height: 20.0,),
					Center(child: Text(Orgname,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 2.0),)),
					SizedBox(height: 30.0,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							  Text(
									"EMAIL"
								),
							SizedBox(width: 30.0,),
							Text(
								mailid,
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
									"$number",
							)
						],
					),
					SizedBox(height: 20.0,),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						children: <Widget>[
							Text(
									gender
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
