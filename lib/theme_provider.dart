import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// using shared preferences for persistent storage of theme setting

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  ThemeProvider() {
    _loadThemePreference();
  }

  // loads the stored theme setting from shared prefs
  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  // handles text color
  Color get textColor => _isDarkMode ? Colors.white : Colors.black;

  // returns the right image path based on the theme
  // dark mode assets have "_dark" at the end
  String getImagePath(String basePath) {
    if (_isDarkMode) {
      return basePath.replaceFirst('.png', '_dark.png');
    } else {
      return basePath;
    }
  }
}
