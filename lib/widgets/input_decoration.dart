import 'package:flutter/material.dart';

InputDecoration customInputDecoration(
  String label,
  String hint,
  Icon prefixIcon,
) {
  return InputDecoration(
    label: Text(label),
    hintText: hint,
    prefixIcon: prefixIcon,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black87, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );
}
