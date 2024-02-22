//Definicion de los temas de estilo de lapp
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //constante de color primario
  static const primaryColor = Color.fromARGB(246, 255, 255, 255);
  //constante d ecolor secundario
  static const secondaryColor = Color.fromARGB(255, 165, 163, 163);
  //constante de color de fondo
  static const backColor = Color.fromARGB(246, 151, 229, 237);
  //constante de temas
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
    appBarTheme: const AppBarTheme(
      color: primaryColor,
    ),
    textTheme: TextTheme(
      //titulos muy grandes
      headlineLarge: GoogleFonts.bebasNeue(
        color: primaryColor,
        fontSize: 26.5,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.underline,
        decorationColor: const Color.fromARGB(255, 165, 163, 163),
        decorationStyle: TextDecorationStyle.wavy,
        decorationThickness: 1.0,
      ),
      //estilo para texto muy pequeño
      bodySmall: GoogleFonts.bebasNeue(color: secondaryColor, fontSize: 16.0),
    ),
  );
}
