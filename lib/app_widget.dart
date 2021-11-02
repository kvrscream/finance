import 'package:finance/models/user_model.dart';
import 'package:finance/screens/Home/home_screen.dart';
import 'package:finance/screens/income/add_income_screen.dart';
import 'package:finance/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Finance",
      initialRoute: "/Login",
      routes: {
        "/Login": (context) => LoginScreen(),
        "/Home": (context) => HomeScreen(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        "/AddIncome": (context) => AddIncomeScreen(),
      },
    );
  }
}
