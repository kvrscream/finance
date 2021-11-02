import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final void Function(String value) onChanged;
  final String? Function(String?)? validator;
  final bool? numeric;
  final TextEditingController? controller;
  const FormFieldWidget({
    Key? key,
    required this.labelText,
    required this.onChanged,
    required this.validator,
    this.numeric = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Container(
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          keyboardType:
              this.numeric == true ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            labelText: labelText,
            contentPadding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
