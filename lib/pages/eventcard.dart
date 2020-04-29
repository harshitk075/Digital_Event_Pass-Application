import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {

	final String date,event,venue;

	EventCard({this.date,this.event,this.venue});
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: const EdgeInsets.all(10.0),
       child: Card(
			 elevation: 10.0,
			  child: InkWell(
				 splashColor: Colors.blue.withAlpha(30),
				 onTap: () {
            // Navigator.pushNamed(context, );
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
					  				 decoration: BoxDecoration(
					  					 image: DecorationImage(
					  						 image: NetworkImage("https://www.womensbusinessdaily.com/wp-content/uploads/2017/07/Messe_Luzern_Corporate_Event.jpg"),
					  						 fit: BoxFit.cover,
					  					 )
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
										Text(venue),
									],
								),
								SizedBox(height: 15.0,),
								 Row(
									mainAxisAlignment: MainAxisAlignment.spaceEvenly,
									children: <Widget>[
										Text("DATE"),
										Text(date),
									],
								),
					  	],
					  ),
					),
				),
			),
		),
    );
  }
}
