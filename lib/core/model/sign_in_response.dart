/// name : "Daniel Makinde"
/// email : "mayomidedaniel@mail.com"
/// phone : "08169545791"
/// device_token : "765768678686ghfghfgsfdhgfhfg"
/// api_token : "3nuQNur2NLJ8nYDzwWx9m7gYICMqPGPjnKReep5117j6G42uU2WK5tZtkClD"
/// updated_at : "2021-09-19T11:46:33.000000Z"
/// created_at : "2021-09-19T11:46:33.000000Z"
/// id : 5
/// custom_fields : {"bio":{"value":null,"view":"","name":"bio"},"address":{"value":null,"view":null,"name":"address"}}
/// has_media : false
/// roles : [{"id":4,"name":"customer","guard_name":"web","default":"1","created_at":null,"updated_at":null,"pivot":{"model_id":"5","role_id":"4","model_type":"App\\Models\\User"}}]
/// media : []

class SignInResponse {
  String _name;
  String _email;
  String _phone;
  String _deviceToken;
  String _apiToken;
  String _updatedAt;
  String _createdAt;
  int _id;
  Custom_fields _customFields;
  bool _hasMedia;
  List<Roles> _roles;
  List<dynamic> _media;

  String get name => _name;
  String get email => _email;
  String get phone => _phone;
  String get deviceToken => _deviceToken;
  String get apiToken => _apiToken;
  String get updatedAt => _updatedAt;
  String get createdAt => _createdAt;
  int get id => _id;
  Custom_fields get customFields => _customFields;
  bool get hasMedia => _hasMedia;
  List<Roles> get roles => _roles;
  List<dynamic> get media => _media;

  SignInResponse({
      String name, 
      String email, 
      String phone, 
      String deviceToken, 
      String apiToken, 
      String updatedAt, 
      String createdAt, 
      int id, 
      Custom_fields customFields, 
      bool hasMedia, 
      List<Roles> roles, 
      List<dynamic> media}){
    _name = name;
    _email = email;
    _phone = phone;
    _deviceToken = deviceToken;
    _apiToken = apiToken;
    _updatedAt = updatedAt;
    _createdAt = createdAt;
    _id = id;
    _customFields = customFields;
    _hasMedia = hasMedia;
    _roles = roles;
    _media = media;
}

  SignInResponse.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _deviceToken = json['device_token'];
    _apiToken = json['api_token'];
    _updatedAt = json['updated_at'];
    _createdAt = json['created_at'];
    _id = json['id'];
    _customFields = json['custom_fields'] != null ? Custom_fields.fromJson(json['customFields']) : null;
    _hasMedia = json['has_media'];
    if (json['roles'] != null) {
      _roles = [];
      json['roles'].forEach((v) {
        _roles.add(Roles.fromJson(v));
      });
    }
    if (json['media'] != null) {
      _media = [];
      json['media'].forEach((v) {
      //  _media.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['device_token'] = _deviceToken;
    map['api_token'] = _apiToken;
    map['updated_at'] = _updatedAt;
    map['created_at'] = _createdAt;
    map['id'] = _id;
    if (_customFields != null) {
      map['custom_fields'] = _customFields.toJson();
    }
    map['has_media'] = _hasMedia;
    if (_roles != null) {
      map['roles'] = _roles.map((v) => v.toJson()).toList();
    }
    if (_media != null) {
      map['media'] = _media.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// name : "customer"
/// guard_name : "web"
/// default : "1"
/// created_at : null
/// updated_at : null
/// pivot : {"model_id":"5","role_id":"4","model_type":"App\\Models\\User"}

class Roles {
  int _id;
  String _name;
  String _guardName;
  String _default;
  dynamic _createdAt;
  dynamic _updatedAt;
  Pivot _pivot;

  int get id => _id;
  String get name => _name;
  String get guardName => _guardName;
  String get defaults => _default;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  Pivot get pivot => _pivot;

  Roles({
      int id, 
      String name, 
      String guardName, 
      String defaults,
      dynamic createdAt, 
      dynamic updatedAt, 
      Pivot pivot}){
    _id = id;
    _name = name;
    _guardName = guardName;
    _default = defaults;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _pivot = pivot;
}

  Roles.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _guardName = json['guard_name'];
    _default = json['default'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['guard_name'] = _guardName;
    map['default'] = _default;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_pivot != null) {
      map['pivot'] = _pivot.toJson();
    }
    return map;
  }

}

/// model_id : "5"
/// role_id : "4"
/// model_type : "App\\Models\\User"

class Pivot {
  String _modelId;
  String _roleId;
  String _modelType;

  String get modelId => _modelId;
  String get roleId => _roleId;
  String get modelType => _modelType;

  Pivot({
      String modelId, 
      String roleId, 
      String modelType}){
    _modelId = modelId;
    _roleId = roleId;
    _modelType = modelType;
}

  Pivot.fromJson(dynamic json) {
    _modelId = json['model_id'];
    _roleId = json['role_id'];
    _modelType = json['model_type'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['model_id'] = _modelId;
    map['role_id'] = _roleId;
    map['model_type'] = _modelType;
    return map;
  }

}

/// bio : {"value":null,"view":"","name":"bio"}
/// address : {"value":null,"view":null,"name":"address"}

class Custom_fields {
  Bio _bio;
  Address _address;

  Bio get bio => _bio;
  Address get address => _address;

  Custom_fields({
      Bio bio, 
      Address address}){
    _bio = bio;
    _address = address;
}

  Custom_fields.fromJson(dynamic json) {
    _bio = json['bio'] != null ? Bio.fromJson(json['bio']) : null;
    _address = json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_bio != null) {
      map['bio'] = _bio.toJson();
    }
    if (_address != null) {
      map['address'] = _address.toJson();
    }
    return map;
  }

}

/// value : null
/// view : null
/// name : "address"

class Address {
  dynamic _value;
  dynamic _view;
  String _name;

  dynamic get value => _value;
  dynamic get view => _view;
  String get name => _name;

  Address({
      dynamic value, 
      dynamic view, 
      String name}){
    _value = value;
    _view = view;
    _name = name;
}

  Address.fromJson(dynamic json) {
    _value = json['value'];
    _view = json['view'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['value'] = _value;
    map['view'] = _view;
    map['name'] = _name;
    return map;
  }

}

/// value : null
/// view : ""
/// name : "bio"

class Bio {
  dynamic _value;
  String _view;
  String _name;

  dynamic get value => _value;
  String get view => _view;
  String get name => _name;

  Bio({
      dynamic value, 
      String view, 
      String name}){
    _value = value;
    _view = view;
    _name = name;
}

  Bio.fromJson(dynamic json) {
    _value = json['value'];
    _view = json['view'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['value'] = _value;
    map['view'] = _view;
    map['name'] = _name;
    return map;
  }

}