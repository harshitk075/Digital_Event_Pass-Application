
class Guest{
	static bool is_profileset=true;
	String _guestID;
	String _name;
	String _email;
	String _gender;
	int _contactNumber;
	String _imageUrl;

	Guest(this._guestID, this._name, this._email, this._gender, this._contactNumber, this._imageUrl);

	bool get flag => is_profileset;

	String get guestID => _guestID;

	set guestID(String value) {
		_guestID = value;
	}

	String _dob;

	String get name => _name;

	set name(String value) {
		_name = value;
	}

	String get email => _email;

	set email(String value) {
		_email = value;
	}

	String get gender => _gender;

	set gender(String value) {
		_gender = value;
	}

	int get contactNumber => _contactNumber;

	set contactNumber(int value) {
		_contactNumber = value;
	}

	String get imageUrl => _imageUrl;

	set imageUrl(String value) {
		_imageUrl = value;
	}

	String get dob => _dob;

	set dob(String value) {
		_dob = value;
	}

}