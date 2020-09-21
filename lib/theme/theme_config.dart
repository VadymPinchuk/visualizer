import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeConfig with ChangeNotifier {
  ThemeConfig() {
    _initialConfig();
  }

  ThemeData theme;

  static ThemeData get light => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.lightBlueAccent[400],
        toggleableActiveColor: Colors.lightBlueAccent[400],
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.tealAccent,
        toggleableActiveColor: Colors.tealAccent,
      );

  Future changeTheme() async {
    theme = theme == light ? dark : light;
    await _saveThemeChanges();
    notifyListeners();
  }

  Future _initialConfig() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDark = prefs.getBool('isDark') ?? false;
    theme = isDark ? dark : light;
    notifyListeners();
  }

  Future _saveThemeChanges() async {
    await SharedPreferences.getInstance().then((prefs) => prefs.setBool('isDark', theme == dark));
  }
}
