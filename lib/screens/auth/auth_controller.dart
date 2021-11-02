import 'dart:convert';

import 'package:finance/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  UserModel get user => _user!;

  void setUser(UserModel? user, BuildContext context) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/Home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/Login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());

    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    if (instance.containsKey("user")) {
      String userJson = await instance.getString("user") as String;
      setUser(UserModel.fromJson(userJson), context);
    } else {
      setUser(null, context);
    }

    return;
  }
}
