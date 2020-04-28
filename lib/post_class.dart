class Post {
	String _eventID;
	String _title;
	double _lattitude;
	double _longitude;

	Post(this._title, this._lattitude, this._longitude,
			this._eventTime, this._duration, this._eventDescription, this._imageUrl);

	DateTime _eventTime;
	double _duration;
	String _eventDescription;
	String _imageUrl;

	String get eventID => _eventID;

	set eventID(String value) {
		_eventID = value;
	}

	String get title => _title;

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

	DateTime get eventTime => _eventTime;

	set eventTime(DateTime value) {
		_eventTime = value;
	}

	double get longitude => _longitude;

	set longitude(double value) {
		_longitude = value;
	}

	double get lattitude => _lattitude;

	set lattitude(double value) {
		_lattitude = value;
	}

	set title(String value) {
		_title = value;
	}

}

class Organiser{
	String organiserID;
	String contactNumber;
	String email;
	
}