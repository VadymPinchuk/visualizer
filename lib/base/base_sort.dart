import 'dart:core';
import 'dart:math';

import 'package:flutter/widgets.dart';

class BaseSort with ChangeNotifier {
  BaseSort() {
    generateData();
  }

  List<int> array = List.empty(growable: true);

  int left = -1;
  int right = -1;
  int sorted = -1;

  bool isSorting = false;

  @mustCallSuper
  void generateData() {
    array.clear();
    isSorting = false;
    int counter = 0;
    final rand = Random();
    left = -1;
    right = -1;
    sorted = -1;

    while (counter < 50) {
      // to show anything in case of 0 -> shifting it to 1
      array.add(rand.nextInt(100) + 1);
      counter++;
      notifyListeners();
    }
  }

  Future startSorting() async {}

  Future sleep() async {
    await Future.delayed(const Duration(milliseconds: 150), () {});
  }
}
