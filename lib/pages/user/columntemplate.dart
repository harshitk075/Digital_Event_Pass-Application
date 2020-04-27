import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';


class ColumnTemplate extends StatelessWidget {

	final String columnTitle;
	final Widget childWidget;

	ColumnTemplate({this.columnTitle,this.childWidget});

	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.stretch,
			children: <Widget>[
				Expanded(
					child: Container(
						padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								Padding(
									padding: EdgeInsets.fromLTRB(8,0,0,0),
									child: TypewriterAnimatedTextKit(
										isRepeatingAnimation: false,
										text:['$columnTitle'],
										textStyle: TextStyle(fontSize: 40.0 ),
									),
								),
								childWidget,
							],
						),
					),
				),
			],
		);
	}
}