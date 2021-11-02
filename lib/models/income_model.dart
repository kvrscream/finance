import 'dart:convert';

import 'package:finance/models/user_model.dart';

class IncomeModel {
  double? value;
  String? description;
  bool? recurrent;
  DateTime? date;
  UserModel? user;

  IncomeModel({
    this.value,
    this.description,
    this.recurrent,
    this.date,
    this.user,
  });

  Map<String, dynamic> toMap() => {
        "value": value,
        "description": description,
        "recurrent": recurrent,
        "date": date,
        "user": user
      };

  String toJson() => jsonEncode(toMap());

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
        value: map["value"],
        description: map["description"],
        date: map["date"],
        user: map["user"]);
  }

  factory IncomeModel.fromJson(String json) {
    return IncomeModel.fromMap(jsonDecode(json));
  }

  IncomeModel copyWith({value, description, recurrent, date, user}) {
    return IncomeModel(
        value: value ?? this.value,
        description: description ?? this.description,
        recurrent: recurrent ?? this.recurrent,
        date: date ?? this.date,
        user: user ?? this.user);
  }
}
