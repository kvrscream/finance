import 'dart:convert';

class UserModel {
  String Name;
  String PhotoUrl;

  UserModel({required this.Name, this.PhotoUrl = ""});

  Map<String, dynamic> toMap() => {"Name": Name, "PhotoUrl": PhotoUrl};

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(Name: map["Name"], PhotoUrl: map["PhotoUrl"]);
  }

  factory UserModel.fromJson(String json) {
    return UserModel.fromMap(jsonDecode(json));
  }
}
