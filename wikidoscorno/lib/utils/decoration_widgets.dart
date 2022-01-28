import 'package:flutter/material.dart';

decorationTextFormField() => const InputDecoration(
      filled: true,
      fillColor: Colors.white,
      hintText: "diga-me o'que desejas!",
      prefixIcon: Icon(
        Icons.search,
        size: 20,
        color: Colors.black,
      ),
    );
