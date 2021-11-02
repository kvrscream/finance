import 'package:finance/models/user_model.dart';
import 'package:finance/screens/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController {
  final authController = new AuthController();

  Future<void> googleSignin(BuildContext context) async {
    GoogleSignIn _googleSignin = GoogleSignIn(scopes: ["email"]);

    try {
      final response = await _googleSignin.signIn();
      print(response);
      final user =
          UserModel(Name: response!.displayName!, PhotoUrl: response.photoUrl!);
      authController.setUser(user, context);
    } catch (error) {
      print("Google Login Error => " + error.toString());
    }

    return;
  }
}
