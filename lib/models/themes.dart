import 'package:flutter/material.dart';

class Themes {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.lightBlueAccent,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.lightBlueAccent),
  );

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF1D1E33),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Color(0xFF0A0E21)),
  );


  Color darkColor = Color(0xFF1D1E33);
  Color lightColor = Colors.lightBlueAccent;
}
