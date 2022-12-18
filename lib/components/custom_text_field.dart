import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Function validation;
  final TextEditingController controller;
  bool isPassword;
  final TextInputType textInputType;
  IconData? icon;

  final String label;

  CustomTextfield({
    Key? key,
    this.icon,
    required this.validation,
    required this.label,
    required this.controller,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: textInputType,
      obscureText: isPassword,
      controller: controller,
      validator: (v) => validation(v),
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          label: Text(label),
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
