import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/users.json');
  }

  Future<Map<String, dynamic>> readUsers() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return json.decode(contents);
    } catch (e) {
      return {};
    }
  }

  Future<File> writeUser(String email, String password) async {
    final file = await _localFile;
    Map<String, dynamic> data = await readUsers();
    data[email] = password;
    return file.writeAsString(json.encode(data));
  }

  Future<bool> validateUser(String email, String password) async {
    Map<String, dynamic> data = await readUsers();
    return data[email] == password;
  }

  // Future<void> saveUserDetails(String firstName, bool isLoggedIn) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('firstName', firstName);
  //   prefs.setBool('isLoggedIn', isLoggedIn);
  // }

  // Future<String?> getFirstName() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('firstName');
  // }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('loggedIn') ?? false;
  }

  Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', value);
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
  }

  Future<ThemeMode> getThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    int? storedThemeIndex = prefs.getInt('theme');
    if (storedThemeIndex == null)
      return ThemeMode.light; // Default to light theme

    return ThemeMode.values[storedThemeIndex];
  }

  Future<void> setThemePreference(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme', themeMode.index);
  }
}
