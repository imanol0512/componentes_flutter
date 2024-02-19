//Definicion de los temas de estilo de lapp
import 'package:flutter/material.dart';

class AppTheme {
  //constante de color primario
  static const primaryColor = Color.fromARGB(246, 255, 255, 255);
  //constante de color de fondo
  static const backColor = Color.fromARGB(246, 151, 229, 237);
  //constante de temas
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: backColor,
      appBarTheme: const AppBarTheme(
        color: primaryColor,
      ));
}
