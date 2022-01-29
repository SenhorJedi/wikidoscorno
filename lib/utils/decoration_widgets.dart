import 'package:flutter/material.dart';

decorationTextFormField({
  String? hintText,
  Widget? prefixIcon,
  Color? fillColor,
  TextStyle? hintStyle,
}) =>
    InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      filled: true,
      fillColor: fillColor ?? Colors.white,
      hintText: hintText,
      hintStyle: hintStyle,
      prefixIcon: prefixIcon,
    );
