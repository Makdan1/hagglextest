/// email : "email"
/// username : "username"
/// password : "password"
/// phonenumber : "phoneNumber"
/// referralCode : ""
/// phoneNumberDetails : {"phoneNumber":"901234566","callingCode":"","flag":""}
/// country : "234"
/// currency : "NGN"

class SignUpBody {
  String _email;
  String _username;
  String _password;
  String _phonenumber;
  String _referralCode;
  PhoneNumberDetails _phoneNumberDetails;
  String _country;
  String _currency;

  String get email => _email;
  String get username => _username;
  String get password => _password;
  String get phonenumber => _phonenumber;
  String get referralCode => _referralCode;
  PhoneNumberDetails get phoneNumberDetails => _phoneNumberDetails;
  String get country => _country;
  String get currency => _currency;

  SignUpBody({
      String email, 
      String username, 
      String password, 
      String phonenumber, 
      String referralCode, 
      PhoneNumberDetails phoneNumberDetails,
      String country, 
      String currency}){
    _email = email;
    _username = username;
    _password = password;
    _phonenumber = phonenumber;
    _referralCode = referralCode;
    _phoneNumberDetails = phoneNumberDetails;
    _country = country;
    _currency = currency;
}

  SignUpBody.fromJson(dynamic json) {
    _email = json['email'];
    _username = json['username'];
    _password = json['password'];
    _phonenumber = json['phonenumber'];
    _referralCode = json['referralCode'];
    _phoneNumberDetails = json['PhoneNumberDetailsInput'] != null ? PhoneNumberDetails.fromJson(json['phoneNumberDetails']) : null;
    _country = json['country'];
    _currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['email'] = _email;
    map['username'] = _username;
    map['password'] = _password;
    map['phonenumber'] = _phonenumber;
    map['referralCode'] = _referralCode;
    if (_phoneNumberDetails != null) {
      map['PhoneNumberDetailsInput'] = _phoneNumberDetails.toJson();
    }
    map['country'] = _country;
    map['currency'] = _currency;
    return map;
  }

}

/// phoneNumber : "901234566"
/// callingCode : ""
/// flag : ""

class PhoneNumberDetails {
  String _phoneNumber;
  String _callingCode;
  String _flag;

  String get phoneNumber => _phoneNumber;
  String get callingCode => _callingCode;
  String get flag => _flag;

  PhoneNumberDetails({
      String phoneNumber, 
      String callingCode, 
      String flag}){
    _phoneNumber = phoneNumber;
    _callingCode = callingCode;
    _flag = flag;
}

  PhoneNumberDetails.fromJson(dynamic json) {
    _phoneNumber = json['phoneNumber'];
    _callingCode = json['callingCode'];
    _flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['phoneNumber'] = _phoneNumber;
    map['callingCode'] = _callingCode;
    map['flag'] = _flag;
    return map;
  }

}