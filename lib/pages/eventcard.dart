import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digitaleventpass/pages/display_event.dart';
import 'package:digitaleventpass/pages/eventupdations.dart';
import 'package:flutter/material.dart';
import 'package:digitaleventpass/Services/dispalyfunctions.dart';
import 'package:digitaleventpass/post_class.dart';
class EventCard extends StatelessWidget {

	final String event,venue,eventID,eventimageurl, route;
	EventCard({this.event,this.venue,this.eventID,this.eventimageurl,this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Card(
			 elevation: 10.0,
			  child: InkWell(
				 splashColor: Colors.blue.withAlpha(30),
					 onTap: () async{
					   Post ref=  await FuncEvent(eventID);
						 Navigator.push(
								 context,
								 MaterialPageRoute(
										 builder: (context) => (route=="/eventdisplay") ? EventDisplay(box : ref) : EventUpdations()));
				 },
					child: Container(
				 	  width: 300,
						height: 300,
				  	decoration: BoxDecoration(
						color: Colors.blueGrey[100],
					),
					 child: Padding(
					  padding: const EdgeInsets.all(10.0),
					  child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
					  	children: <Widget>[
					  		  Container(
					  				 height: 150.0,
					  				 width: 300.0,
					  				 child: Image.network(
											 eventimageurl,
											 fit: BoxFit.cover,
											 loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
												 if (loadingProgress == null)
													 return child;
												 return Center(
													 child: CircularProgressIndicator(
														 value: loadingProgress.expectedTotalBytes != null
																 ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
																 : null,
													 ),
												 );
											 },
										 ),
					  			 ),
					  	 	  Container(
					  				height: 40.0,
					  				width: 300.0,
					  				decoration: BoxDecoration(
					  						color: Colors.black,
					  				),
					  				child: Center(
					  					child: Text(event,style: TextStyle(color: Colors.white,letterSpacing: 2.0,fontSize: 20.0),),
					  				),
					  			),
								SizedBox(height: 20.0,),
								Row(
									mainAxisAlignment: MainAxisAlignment.spaceAround,
									children: <Widget>[
										Text("VENUE"),
										Text(venue.toUpperCase()),
									],
								),
								SizedBox(height: 15.0,),
//								 Row(
//									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//									children: <Widget>[
//										Text("DATE AND TIME"),
//										Text(time),
//									],
//								),
					  	],
					  ),
					),
				),
			),
		),
    );
  }
}
