import 'dart:convert';
import 'dart:typed_data';
//import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';


class Ticket extends StatelessWidget {
	GlobalKey _renderObjectKey;
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
									 RepaintBoundary(
										 key: _renderObjectKey,
									   child: QrImage(data: "SD",
										 version: QrVersions.auto,
										 size: 200.0,
									   ),
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
//	Future<Uint8List> _getWidgetImage() async {
//		try {
//			RenderRepaintBoundary boundary =
//			_renderObjectKey.currentContext.findRenderObject();
//			ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//			ByteData byteData =
//			await image.toByteData(format: ui.ImageByteFormat.png);
//			var pngBytes = byteData.buffer.asUint8List();
//			var bs64 = base64Encode(pngBytes);
//			debugPrint(bs64.length.toString());
//			final directory = (await getExternalStorageDirectory().path())
//			return pngBytes;
//		} catch (exception) {}
//	}
}

