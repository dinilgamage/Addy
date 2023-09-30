import 'package:addy/Dash.dart';
import 'package:addy/loginscreen/login.dart';
import 'package:flutter/material.dart';
import 'package:addy/colors/themes.dart';
import 'package:provider/provider.dart';
import 'landingpage/landing.dart';
import 'registerscreen/register.dart';
import 'homescreen/home.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Addy',
      theme: themeProvider.themeData,
      themeMode: themeProvider.themeMode,
      home: LandingPage(),
    );
  }
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark;

  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData {
    switch (_themeMode) {
      case ThemeMode.dark:
        return AppTheme.darkTheme;
      case ThemeMode.light:
        return AppTheme.lightTheme;
      default:
        return AppTheme.darkTheme; // Default to dark theme
    }
  }

  void toggleTheme() {
    _themeMode =
        _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
