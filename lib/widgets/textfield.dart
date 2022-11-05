import 'package:flutter/material.dart';

class TextFormInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final Icon icon;

  const TextFormInputField({
    Key? key,
    required this.controller,
    this.isPass = false,
    required this.hintText,
    required this.textInputType,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      decoration: InputDecoration(
        fillColor: Color(0xffF5F4F8),
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        prefixIcon: icon,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      controller: controller,
      obscureText: isPass,
    );
  }
}
