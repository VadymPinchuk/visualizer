import 'dart:core';
import 'dart:math';

import 'package:flutter/widgets.dart';

class BaseSort with ChangeNotifier {
  BaseSort() {
    generateData();
  }

  List<double> array = List<double>(50);
  int prev = -1;
  int curr = -1;
  int sorted = -1;
  bool isSorting = false;

  @mustCallSuper
  void generateData() {
    isSorting = false;
    int counter = 0;
    final rand = Random();
    prev = -1;
    curr = -1;
    sorted = -1;

    while (counter < 50) {
      array[counter] = rand.nextDouble() * 100;
      counter++;
      notifyListeners();
    }
  }

  Future performSorting() async {}

  Future sleep() async {
    await Future.delayed(const Duration(milliseconds: 50), () {});
  }

  void breakSortingCondition() {
    if (!isSorting) {
      return;
    }
  }
}
