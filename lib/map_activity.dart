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
  String address;
  String searchString;
  static Position position;
  static LatLng positionx;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(51.5074, 0.1278),
    zoom: 14.4746,
  );
  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(21.9254986, 78.1152833),
      tilt: 59.440717697143555,
      zoom: 14.151926040649414);
  void getLocation() async {
    List<Placemark> placemark;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
//      double distanceInMeters = await Geolocator().distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838);
//      print(distanceInMeters);
      placemark = await Geolocator()
          .placemarkFromCoordinates(position.latitude, position.longitude);
//      List<Placemark> placemark = await Geolocator().placemarkFromAddress("Amla, Madhya Pradesh");
      print("xxxxxxxxxxxxxxxxx");
      print(placemark[0].name);
    } catch (e) {
      print(e);
    }
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 14.151926040649414),
      ),
    );
    setState(() {
      allMarkers.clear();
      address = placemark[0].name;
      allMarkers.add(Marker(
        markerId: MarkerId('myMarker1'),
        draggable: true,
        position: LatLng(position.latitude, position.longitude),
        onDragEnd: (newPosition) {
          print(newPosition.toString());
          positionx = newPosition;
        },
        onTap: () {
          print('marker1 tapped: ' + position.toString());
        },
      ));
    });
  }

  @override
  void initState() {
    allMarkers.add(Marker(
      markerId: MarkerId('myMarker'),
      draggable: true,
      position: LatLng(51.5074, 0.1278),
      onDragEnd: (newPosition) {
        print(newPosition.toString());
        positionx = newPosition;
      },
      onTap: () {
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
        child: Stack(children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set.from(allMarkers),
          ),
          Container(
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Text(
                    'Selected Address: ${address ?? 'Please type more specific address'}',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text('SET LOCATION'),
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    // createnewevent.address(address);
                    Navigator.pop(context, address);
                  },
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(),
                  labelText: 'Search Address',
                ),
                onChanged: (text) {
                  setState(() {
                    searchString = text;
                  });
                },
              ),
              RaisedButton(
                child: Text('Search'),
                color: Theme.of(context).accentColor,
                onPressed: () async {
                  try {
                    List<Placemark> placemark =
                        await Geolocator().placemarkFromAddress(searchString);
                    position = placemark[0].position;
                    address = placemark[0].name;
                  } catch (e) {
                    print(e);
                    address = null;
                  }
                  final GoogleMapController controller =
                      await _controller.future;
                  controller.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(position.latitude, position.longitude),
                          zoom: 14.151926040649414),
                    ),
                  );
                  setState(() {
                    allMarkers.clear();
                    address = address;
                    allMarkers.add(Marker(
                      markerId: MarkerId('myMarker1'),
                      draggable: true,
                      position: LatLng(position.latitude, position.longitude),
                      onDragEnd: (newPosition) {
                        print(newPosition.toString());
                        positionx = newPosition;
                      },
                      onTap: () {
                        print('marker1 tapped: ' + position.toString());
                      },
                    ));
                  });
                },
              ),
            ],
          ),
        ]),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 100.0),
        child: FloatingActionButton(
          onPressed: _goToTheLake,
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
