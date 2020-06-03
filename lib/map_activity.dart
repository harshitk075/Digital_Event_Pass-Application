import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapActivity extends StatefulWidget {
  @override
  _MapActivityState createState() => _MapActivityState();
}

class _MapActivityState extends State<MapActivity> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> allMarkers = [];

  static Position position;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.5074, 0.1278),
    zoom: 14.4746,
  );
  static CameraPosition _kLake =  CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(21.9254986, 78.1152833),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  void getLocation() async{
    try {
      position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      double distanceInMeters = await Geolocator().distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
      print(distanceInMeters);
//      List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(21.9254986, 78.1152833);
      List<Placemark> placemark = await Geolocator().placemarkFromAddress("Amla, Madhya Pradesh");
      print("xxxxxxxxxxxxxxxxx");
      print(placemark[0].position);
    }catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: true,
      position: LatLng(51.5074, 0.1278),
      onDragEnd: (newPosition) {
        print(newPosition.toString());
      },
      onTap: (){
        print('marker tapped: ' + position.toString());
    },

    ));
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set.from(allMarkers),
          ),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               TextField(
                 decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Search Address',

                 ),
                 onChanged: (text){

                 },
               ),
               RaisedButton(
                 child: Text('Search'),
                 color: Theme.of(context).accentColor,
                 onPressed: (){

                 },
               ),

             ],
           ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Selected Address:'
                ,
              ),
            ),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
