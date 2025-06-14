import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    primaryColor: Color.fromARGB(255,12,100,100),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      // backgroundColor: Colors.teal,
      // foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black54,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.black45,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255,12,100,100),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    )
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.teal,
    primaryColor: Color.fromARGB(255,12,100,100),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),  
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white54,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.white38,
      ),
    ),
  );
}
