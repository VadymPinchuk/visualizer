import 'dart:core';

import 'package:visualizer/base/base_sort.dart';

class InsertionSort extends BaseSort {
  InsertionSort() : super();

  @override
  void generateData() {
    super.generateData();
    sorted = array.length;
    notifyListeners();
  }

  @override
  Future startSorting() async {
    if (isSorting) return;

    isSorting = true;
    prev = 0;
    curr = 1;
    for (int i = 1; i < array.length; i++) {
      prev = i - 1;
      curr = i;
      notifyListeners();
      while (isSorting && prev >= 0 && array[curr] < array[prev]) {
        notifyListeners();
        final int tmp = array[prev];
        array[prev] = array[curr];
        array[curr] = tmp;
        curr--;
        prev--;
        notifyListeners();
        await sleep();
      }
      if (!isSorting) {
        return;
      }
    }
    sorted = 0;
    prev = -1;
    curr = -1;
    notifyListeners();
  }
}
