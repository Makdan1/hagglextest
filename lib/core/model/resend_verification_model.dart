/// email : "mayomidedaniel@gmail.com"

class ResendVerificationModel {
  String _email;

  String get email => _email;

  ResendVerificationModel({
      String email}){
    _email = email;
}

  ResendVerificationModel.fromJson(dynamic json) {
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['email'] = _email;
    return map;
  }

}