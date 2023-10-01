import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 112, 177, 173),

    textTheme: const TextTheme(
        displayMedium: TextStyle(
      color: Color.fromARGB(255, 35, 93, 89),
    )),
    colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 194, 234, 233),
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
    scaffoldBackgroundColor: Color.fromARGB(255, 80, 80, 80),
    textTheme: const TextTheme(
        displayMedium: TextStyle(
      color: Color.fromARGB(255, 112, 177, 173),
    )),
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 49, 49, 49),
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
