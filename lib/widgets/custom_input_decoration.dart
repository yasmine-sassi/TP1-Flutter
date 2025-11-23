import 'package:flutter/material.dart';

class CustomInputDecoration {
  String label;
  String hint;
  Icon icon;

  CustomInputDecoration(this.label, this.hint, this.icon);

  InputDecoration customInputDecoration() {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      prefixIcon: icon,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
