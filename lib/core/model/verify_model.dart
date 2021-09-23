/// code : 123

class VerifyModel {
  int _code;

  int get code => _code;

  VerifyModel({
      int code}){
    _code = code;
}

  VerifyModel.fromJson(dynamic json) {
    _code = json['code'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    return map;
  }

}