import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

const double kFontSize = 20.0;

styleTituloNegrito({required Color color}) => GoogleFonts.roboto(
    fontSize: kFontSize, fontWeight: FontWeight.bold, color: color);
var styleTitulo = GoogleFonts.roboto(
  fontSize: kFontSize,
);
