import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  SharedPreferences? sharedpreferences;
  AppConfigProvider() {
    getConfigData();
  }
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;
  Future<void> getConfigData() async {
    sharedpreferences = await SharedPreferences.getInstance();
    appLanguage = sharedpreferences!.getString("Language") ?? "en";
    appTheme = sharedpreferences!.getString("Theme") == "dark"
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    }
    sharedpreferences = await SharedPreferences.getInstance();
    await sharedpreferences!.setString('Language', newLanguage);
    appLanguage = newLanguage;
    notifyListeners();
  }

  Future<void> changeMode(ThemeMode newMode) async {
    if (appTheme == newMode) {
      return;
    }
    sharedpreferences = await SharedPreferences.getInstance();
    await sharedpreferences!
        .setString('Theme', newMode == ThemeMode.dark ? "dark" : "light");
    appTheme = newMode;
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
