import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeConfig with ChangeNotifier {
  ThemeConfig() {
    theme = light;
  }

  ThemeData theme;

  static ThemeData get light => ThemeData.light().copyWith(visualDensity: VisualDensity.adaptivePlatformDensity);

  static ThemeData get dark => ThemeData.dark().copyWith(visualDensity: VisualDensity.adaptivePlatformDensity);

  void changeTheme() {
    theme = theme == light ? dark : light;
    notifyListeners();
  }
}
