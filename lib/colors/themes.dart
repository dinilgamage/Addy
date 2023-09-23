import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    // textTheme: const TextTheme(
    //     displayMedium: TextStyle(
    //   color: Colors.white,
    // )),
    colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 112, 177, 173),
        background: Color.fromARGB(255, 112, 177, 173),
        secondary: Color.fromARGB(255, 35, 93, 89)),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(
    //       Color.fromARGB(255, 35, 93, 89),
    //     ),
    //   ),
    // ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 49, 51, 51),
      background: Color.fromARGB(255, 30, 30, 30),
      secondary: Color.fromARGB(255, 35, 93, 89),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all<Color>(
    //       Color.fromARGB(255, 35, 93, 89),
    //     ),
    //   ),
    // ),
  );
}
