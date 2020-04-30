import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class BasicDateField extends StatelessWidget {
	final format = DateFormat("yyyy-MM-dd");
	@override
	Widget build(BuildContext context) {
		return Column(children: <Widget>[
			Text('Basic date field (${format.pattern})'),
			DateTimeField(
				format: format,
				onShowPicker: (context, currentValue) {
					return showDatePicker(
							context: context,
							firstDate: DateTime(1900),
							initialDate: currentValue ?? DateTime.now(),
							lastDate: DateTime(2100));
				},
			),
		]);
	}
}
class BasicTimeField extends StatelessWidget {
	final format = DateFormat("HH:mm");
	@override
	Widget build(BuildContext context) {
		return Column(children: <Widget>[
			Text('Basic time field (${format.pattern})'),
			DateTimeField(
				format: format,
				onShowPicker: (context, currentValue) async {
					final time = await showTimePicker(
						context: context,
						initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
					);
					return DateTimeField.convert(time);
				},
			),
		]);
	}
}

class BasicDateTimeField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd HH:mm");
	Function onChng;
	BasicDateTimeField({this.onChng});

	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
				children: <Widget>[
			Text('Choose DATE And TIME'),
			DateTimeField(
				format: format,
				onShowPicker: (context, currentValue) async {
					final date = await showDatePicker(
							context: context,
							firstDate: DateTime(1900),
							initialDate: currentValue ?? DateTime.now(),
							lastDate: DateTime(2100));
					if (date != null) {
						final time = await showTimePicker(
							context: context,
							initialTime:
							TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
						);
						return DateTimeField.combine(date, time);
					} else {
						return currentValue;
					}
				},
				onChanged: (value) {
					print("onchange called");
					onChng(value);
					},
			),
		]);
	}


}