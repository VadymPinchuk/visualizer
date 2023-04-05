import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigHolder extends ChangeNotifier {
  ConfigHolder() {
    _initialConfig();
  }

  bool _showNumbers = false;

  bool get showNumbers => _showNumbers;

  void switchNumberDisplaying() {
    _showNumbers = !_showNumbers;
    notifyListeners();
    _saveConfigs();
  }

  int _sleepTime = 50;

  int get sleepTime => _sleepTime;

  set sleepTime(int value) {
    _sleepTime = value;
    notifyListeners();
    _saveConfigs();
  }

  Future _initialConfig() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _sleepTime = prefs.getInt('sleepTime') ?? 50;
    _showNumbers = prefs.getBool('showNumbers') ?? false;
    notifyListeners();
  }

  Future _saveConfigs() async {
    await SharedPreferences.getInstance().then((prefs) => prefs
      ..setInt('sleepTime', _sleepTime)
      ..setBool('showNumbers', _showNumbers));
  }
}
