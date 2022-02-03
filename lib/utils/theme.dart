import 'package:flutter/material.dart';
import 'package:wikidoscorno/utils/colors.dart';
import 'package:wikidoscorno/utils/custom_material_colors.dart';
import 'package:wikidoscorno/utils/estilos_texto.dart';

class AppTheme {
  final BuildContext context;

  AppTheme(this.context);

  ThemeData get defaultTheme {
    return ThemeData(
      primaryColor: Colors.white,
      primarySwatch: materialWhite,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      errorColor: Colors.orange.shade300,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return Colors.grey.withOpacity(0.3);
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return Colors.grey.withOpacity(0.3);
              } else {
                return Colors.grey.withOpacity(0.3);
              }
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: styleElevatedButton(
          primary: materialWhite,
          onPrimary: websitePurple,
        ),
      ),
    );
  }
}
