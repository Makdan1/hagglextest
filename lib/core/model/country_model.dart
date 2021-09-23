/// _id : "1"
/// flag : ""
/// callingCode : ""
/// name : ""
/// currencyCode : ""

class CountryModel {
  String _id;
  String _flag;
  String _callingCode;
  String _name;
  String _currencyCode;

  String get id => _id;
  String get flag => _flag;
  String get callingCode => _callingCode;
  String get name => _name;
  String get currencyCode => _currencyCode;

  CountryModel({
      String id, 
      String flag, 
      String callingCode, 
      String name, 
      String currencyCode}){
    _id = id;
    _flag = flag;
    _callingCode = callingCode;
    _name = name;
    _currencyCode = currencyCode;
}

  CountryModel.fromJson(dynamic json) {
    _id = json['_id'];
    _flag = json['flag'];
    _callingCode = json['callingCode'];
    _name = json['name'];
    _currencyCode = json['currencyCode'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['_id'] = _id;
    map['flag'] = _flag;
    map['callingCode'] = _callingCode;
    map['name'] = _name;
    map['currencyCode'] = _currencyCode;
    return map;
  }

}