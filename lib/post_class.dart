class Post {
	String _eventID;
	String _eventname;
	String _eventvenue;
	String _eventtype;
	DateTime _eventdateandtime;
	double _duration;
	String _eventDescription;
	String _imageUrl;

	Post(this._eventID, this._eventname, this._eventvenue,this._eventtype, this._duration, this._eventDescription);

	String get eventID => _eventID;

	set eventID(String value) {
		_eventID = value;
	}

	String get eventname => _eventname;

	String get eventtype => _eventtype;

	String get imageUrl => _imageUrl;

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

	DateTime get eventdateandtime => _eventdateandtime;

	set eventTime(DateTime value) {
		_eventdateandtime = value;
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