import 'package:finance/screens/login/login_controller.dart';
import 'package:finance/styles/app_colors.dart';
import 'package:finance/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController controller = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "Bem vindo!",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Center(
              child: Text("Este é o App da sua vida finceira!",
                  style: AppTextStyles.title, textAlign: TextAlign.center),
            ),
          ),
          Lottie.asset("assets/lotties/login.json"),
          Container(
            //color: AppColors.secondaryGray,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondaryGray,
            ),
            child: TextButton.icon(
              onPressed: () async {
                await controller.googleSignin(context);
              },
              icon: Icon(FontAwesomeIcons.google, color: Colors.red[300]),
              label: Text(
                "Entrar com o google",
                style: AppTextStyles.loginButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
