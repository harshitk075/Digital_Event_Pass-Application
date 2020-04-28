class Ticket{
	String _registraitionID;
	String _eventName;
	String _guestName;
	double _lattitude;
	double _longitude;
	DateTime _eventTime;
	String _eventID;
	String _guestID;


	String get eventID => _eventID;

	set eventID(String value) {
		_eventID = value;
	}

	String get guestID => _guestID;

	set guestID(String value) {
		_guestID = value;
	}

	Ticket(this._eventID, this._guestID);

	String get registraitionID => _registraitionID;

	set registraitionID(String value) {
		_registraitionID = value;
	}

	String get eventName => _eventName;

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

	String get guestName => _guestName;

	set guestName(String value) {
		_guestName = value;
	}

	set eventName(String value) {
		_eventName = value;
	}

}