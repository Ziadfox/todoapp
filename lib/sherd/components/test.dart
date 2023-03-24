import 'package:flutter/material.dart';

Widget testWidget(
  TextEditingController controller,
  IconData prefixIcon,
  IconData suffixIcon, {
  bool obscureText = false,
  VoidCallback? onSuffixIconPressed,
}) {
  return TextFormField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      prefixIcon: Icon(prefixIcon),
      suffixIcon: GestureDetector(
        child: Icon(suffixIcon),
        onTap: onSuffixIconPressed,
      ),
      labelText: 'Enter Text',
      border: OutlineInputBorder(),
    ),
  );
}
