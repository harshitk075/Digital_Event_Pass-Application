import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Ticket extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: <Widget>[
					Text(
						"EVENT NAME"
					),
					Row(

					),
					QrImage(data: 'harshit gandu hai',
						version: QrVersions.auto,
						size: 200.0,

					),
				],
			)
		);
  }
}
