import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticket extends StatelessWidget {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("My Ticket"),
				centerTitle: false,
			),
			body: ListView(
				children: <Widget>[
					SizedBox(height: 20.0),
					Center(
						child: Text(
							"Event Name",
							 style: TextStyle(
								 letterSpacing: 2.0,
								 fontSize: 25.0,
								 fontWeight: FontWeight.bold,
							 ),
						),
					),
					SizedBox(height: 30.0),
					FractionallySizedBox(
						widthFactor: 0.9,
						child: Container(
							height: 450.0,
							width: 100.0,
							decoration: BoxDecoration(
								color: Colors.white,
								borderRadius: BorderRadius.circular(15.0),
							),
							child: Column(
								 crossAxisAlignment: CrossAxisAlignment.center,
								 children: <Widget>[
								 	 FractionallySizedBox(
										 widthFactor: 1.0,
										 child: Container(
											 height: 50.0,
											 decoration: BoxDecoration(
												 color:Colors.blue,
												 borderRadius: BorderRadius.circular(15.0),
											 ),
											 child: Center(child: Text(
													 "Your Ticket Information",
												    style: TextStyle(
															letterSpacing: 2.0,
															color: Colors.white,
														),
											 ),),
										 ),
									 ),
									 SizedBox(height: 8.0,),
									 QrImage(data: "SD",
										 version: QrVersions.auto,
										 size: 200.0,
									 ),
									 Text("Registration no : "),
									 SizedBox(height: 20.0),
									 Padding(
									   padding: const EdgeInsets.all(10.0),
									   child: Row(
										 mainAxisAlignment: MainAxisAlignment.start,
										 children: <Widget>[
										 	 Text("Guest Name : "),
											 Text("name dalna hai"),
										 ],
									   ),
									 ),
									 Padding(
									   padding: const EdgeInsets.all(10.0),
									   child: Row(
										 mainAxisAlignment: MainAxisAlignment.start,
										 children: <Widget>[
											 Text("Gender : "),
											 Text("gender dalna hai"),
										 ],
									   ),
									 ),
									 Padding(
										 padding: const EdgeInsets.all(10.0),
										 child: Row(
											 mainAxisAlignment: MainAxisAlignment.start,
											 children: <Widget>[
												 Text("Venue : "),
												 Text("venue dalna hain"),
											 ],
										 ),
									 ),
									 Padding(
										 padding: const EdgeInsets.all(10.0),
										 child: Row(
											 mainAxisAlignment: MainAxisAlignment.start,
											 children: <Widget>[
												 Text("Time of event : "),
												 Text("time of event dalna hai"),
											 ],
										 ),
									 ),
								 ],
							),
						),
					)
				],
			),
		);
	}
}

