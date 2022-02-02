import 'package:flutter/material.dart';

decorationTextFormField({
  required String label,
  Widget? prefixIcon,
  Color? fillColor,
  TextStyle? labelStyle,
}) =>
    InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      filled: true,
      fillColor: fillColor,
      alignLabelWithHint: true,
      label: Text(
        label,
        style: labelStyle,
      ),
      hintStyle: labelStyle,
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.white),
      ),
    );

decorationDropDownFormField({
  required String label,
  Widget? prefixIcon,
  Color? fillColor,
  TextStyle? labelStyle,
}) =>
    InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
      filled: true,
      fillColor: fillColor,
      alignLabelWithHint: true,
      label: Text(
        label,
        style: labelStyle,
      ),
      hintStyle: labelStyle,
      prefixIcon: prefixIcon,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Colors.white),
      ),
    );
