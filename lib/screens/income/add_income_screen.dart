import 'package:finance/components/form_field_widget.dart';
import 'package:finance/screens/income/add_income_controller.dart';
import 'package:finance/styles/app_colors.dart';
import 'package:finance/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:lottie/lottie.dart';

class AddIncomeScreen extends StatefulWidget {
  const AddIncomeScreen({Key? key}) : super(key: key);

  @override
  _AddIncomeScreenState createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  AddIncomeController controller = AddIncomeController();
  final moneyInput = MoneyMaskedTextController(
      leftSymbol: "R\$", decimalSeparator: ",", thousandSeparator: ".");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adicionar entrada",
          style: AppTextStyles.titleAppBar,
        ),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                FormFieldWidget(
                  validator: controller.validateDescription,
                  labelText: "Descrição",
                  onChanged: (value) =>
                      {controller.onChanged(description: value)},
                ),
                FormFieldWidget(
                  numeric: true,
                  validator: controller.validateValue,
                  labelText: "Valor",
                  controller: moneyInput,
                  onChanged: (value) {
                    controller.onChanged(value: moneyInput.numberValue);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
                  child: Row(
                    children: [
                      Text("Recebe todos os meses?"),
                      Checkbox(
                          value: controller.checkRecurrent,
                          onChanged: (value) {
                            setState(() {
                              controller.checkRecurrent =
                                  !controller.checkRecurrent;
                            });

                            controller.onChanged(
                                recurrent: controller.checkRecurrent);
                          }),
                    ],
                  ),
                ),
                Lottie.asset("assets/lotties/save_money.json"),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool output = await controller.saveIncome();
          print(controller.income.toJson());
          if (output) {
            controller.showAlert(context, "Salvo com sucesso!");
          } else {
            controller.showAlert(context, "Ocorreu um erro ao salvar!");
          }
        },
        child: Icon(Icons.save),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
