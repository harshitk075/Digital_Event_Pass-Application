import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
		body: Container(
		child: Padding(
			padding: EdgeInsets.symmetric(
			vertical: 16.0, horizontal: 8.0,
),
		  child: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
		  	children: <Widget>[
				Text("My Profile",
				style: TextStyle(
					fontSize: 25,
					fontWeight: FontWeight.bold
				)),
					CircleAvatar(radius: 45,
					child: ClipRRect(borderRadius: BorderRadius.circular(15.0),
					child: Image.network("https://avatars0.githubusercontent.com/u/45289002?s=400&u=b16c25f2f53e1bd99cdd812198df21b9a20a596f&v=4"),),),
					Center(child: Text("SHREYANSH SAHU",
					style: TextStyle(
						fontSize: 16, fontWeight: FontWeight.bold
					),),),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Padding(
								padding: EdgeInsets.all(8.0),
							  child: Column(
									children: <Widget>[
										Text('Roll No',style: TextStyle(fontSize: 18,color: Colors.grey),),
										Text('IIT2018073'),
									],
							  ),
							),
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.end,
									children: <Widget>[
										Text('Email',style: TextStyle(fontSize: 18,color: Colors.grey),),
										Text('iit2018073@iiita.ac.in'),
									],
								),
							),
						],
						),
					Row(
						mainAxisAlignment: MainAxisAlignment.spaceBetween,
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.all(32.0),
								child: Text('Gender',style: TextStyle(fontSize: 18,color: Colors.grey),),
							),
							Row(
								mainAxisAlignment: MainAxisAlignment.end,
								children: <Widget>[
									Padding(
										padding: const EdgeInsets.all(8.0),
										child: Container(
											child: Icon(
												FontAwesomeIcons.mars,
												color: Colors.white,
												size: 50,
											),
											height: 80,
											width: 80,
											decoration: BoxDecoration(
												borderRadius: BorderRadius.circular(10),
												color: Color.fromARGB(255, 166, 22, 92),
											),
										),
									),
									Padding(
										padding: const EdgeInsets.all(8.0),
										child: Container(
											child: Icon(
												FontAwesomeIcons.venus,
												color: Colors.white,
												size: 50,
											),
											height: 80,
											width: 80,
											decoration: BoxDecoration(
												borderRadius: BorderRadius.circular(10),
												color: Colors.grey,
											),
										),
									),

								],
							),
						],
					),
					Text('Phone Number',style: TextStyle(fontSize: 18,color: Colors.grey),),
					Row(
						children: <Widget>[
							Container(
								color: Colors.grey[200],
								width: 80,
								child: Padding(
									padding: const EdgeInsets.all(16.0),
									child: Text('+91',style: TextStyle(fontSize: 18,color: Colors.grey),),
								),
							),
							SizedBox(width: 10,),
							Expanded(
								child: Container(
									color: Colors.grey[200],
									child: Padding(
										padding: const EdgeInsets.all(16.0),
										child: Text("9685073001",style: TextStyle(fontSize: 18,color: Colors.grey[700],fontWeight: FontWeight.bold),),
									),
								),
							)
						],
					),
						],

					),


),
		),
		);

  }
}
