import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double kFontSize = 20.0;
const double kFontSizeTitulo = 30.0;

//? styleTituloNegrito
styleTituloNegrito({
  Color? color,
  double? fontSize,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize ?? kFontSizeTitulo,
      fontWeight: FontWeight.bold,
      color: color ?? Colors.black,
    );

//? styleTitulo
styleTitulo({
  Color? color,
  double? fontSize,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize ?? kFontSizeTitulo,
      color: color ?? Colors.black,
    );

//? styleTexto
styleTexto({
  Color? color,
  double? fontSize,
}) =>
    GoogleFonts.roboto(
      fontSize: fontSize ?? kFontSize,
      color: color,
    );

//? styleElevatedButton
styleElevatedButton({
  Color? primary,
  Color? onPrimary,
  Size? minimumSize,
  OutlinedBorder? shape,
}) =>
    ElevatedButton.styleFrom(
      primary: primary,
      onPrimary: onPrimary,
      minimumSize: minimumSize ?? const Size(150, 40),
      shape: shape,
    );
