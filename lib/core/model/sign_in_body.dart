/// email : "mayomidedaniel@mail.com"
/// password : "password"
/// device_token : "657777777777777"
/// ip_address : "192.168.11.333"
/// mac_address : "34.55..4.5.4354645"

class SignInBody {
  String _input;
  String _password;


  String get input => _input;
  String get password => _password;


  SignInBody({
      String input,
      String password, 
}){
    _input = input;
    _password = password;

}

  SignInBody.fromJson(dynamic json) {
    _input = json['input'];
    _password = json['password'];

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['input'] = _input;
    map['password'] = _password;

    return map;
  }

}