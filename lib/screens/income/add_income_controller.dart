import 'dart:convert';

import 'package:finance/models/income_model.dart';
import 'package:finance/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddIncomeController {
  final formKey = GlobalKey<FormState>();
  IncomeModel income = IncomeModel();
  bool checkRecurrent = false;

  String? validateDescription(String? value) => value?.isEmpty ?? true
      ? "A descrição do valor precisa ser preenchida!"
      : null;

  String? validateValue(String? value) =>
      value?.isEmpty ?? true ? "Valor recebido deve ser informado!" : null;

  void onChanged(
      {double? value, String? description, bool? recurrent, DateTime? date}) {
    income = income.copyWith(
        value: value,
        description: description,
        recurrent: recurrent,
        date: date);
  }

  Future<bool> addIncome() async {
    try {
      final instance = await SharedPreferences.getInstance();
      String userJson = await instance.getString("user") as String;
      print(userJson);
      UserModel user = UserModel.fromJson(userJson);
      income.copyWith(date: DateTime.now(), user: user);

      final incomes = await instance.getStringList("incomes") ?? <String>[];
      incomes.add(income.toJson());
      await instance.setStringList("incomes", incomes);
      return true;
    } catch (erro) {
      print("Erro ao salvar income: " + erro.toString());
      return false;
    }
  }

  Future<bool> saveIncome() async {
    final form = formKey.currentState;

    if (form!.validate()) {
      return await addIncome();
    } else {
      return false;
    }
  }

  void showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"),
                ),
              ],
            ));
  }
}
