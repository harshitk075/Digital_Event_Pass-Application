import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
	String _eventID;
	String _eventname;
	String _eventvenue;
	String _eventtype;
	String _eventdateandtime;
	double _duration;
	String _eventDescription;
	String _imageUrl;
  String  _Orgname;
  int _Orgnumber;
  String _Orgemail;
	Post(this._eventID, this._eventname, this._eventvenue,this._eventtype, this._duration, this._eventDescription,this._imageUrl,this._Orgname,this._Orgnumber,this._Orgemail,this._eventdateandtime);

	String get eventID => _eventID;

	set eventID(String value) {
		_eventID = value;
	}

	String get eventname => _eventname;

	String get eventtype => _eventtype;

	String get imageUrl => _imageUrl;

	String get Orgname => _Orgname;

	int get Orgnumber => _Orgnumber;

	String get Orgemail=> _Orgemail;

	String get time => _eventdateandtime;

	set imageUrl(String value) {
		_imageUrl = value;
	}

	String get eventDescription => _eventDescription;

	set eventDescription(String value) {
		_eventDescription = value;
	}

	double get duration => _duration;

	set duration(double value) {
		_duration = value;
	}


	String get eventvenue => _eventvenue;

	set longitude(String value) {
		_eventvenue = value;
	}

}

class Organiser{
	String organiserID;
	String contactNumber;
	String email;

}