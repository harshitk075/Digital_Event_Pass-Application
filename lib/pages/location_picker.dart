import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
as location_picker;
import 'package:google_map_location_picker/google_map_location_picker.dart';
//import 'package:google_map_location_picker_example/keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'generated/i18n.dart';

class LocationPickerr extends StatefulWidget {

  @override
  _LocationPickerrState createState() => _LocationPickerrState();
}

class _LocationPickerrState extends State<LocationPickerr> {
	LocationResult _pickedLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
			mainAxisAlignment: MainAxisAlignment.center,
			children: <Widget>[
				RaisedButton(
					onPressed: () async {
						LocationResult result = await showLocationPicker(
							context,
							"AIzaSyBpMAnXpVYhjIWRNbizunOVuH4TzYwbkuk",
							initialCenter: LatLng(31.1975844, 29.9598339),
//                      automaticallyAnimateToCurrentLocation: true,
//                      mapStylePath: 'assets/mapStyle.json',
							myLocationButtonEnabled: true,
							layersButtonEnabled: true,
//                      resultCardAlignment: Alignment.bottomCenter,
						);
						print("result = $result");
						setState(() => _pickedLocation = result);
					},
					child: Text('Pick location'),
				),
				Text(_pickedLocation.toString()),
			],
		);


}
}


