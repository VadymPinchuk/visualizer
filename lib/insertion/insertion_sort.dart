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
    left = 0;
    right = 1;
    for (int i = 1; i < array.length; i++) {
      left = i - 1;
      right = i;
      notifyListeners();
      while (isSorting && left >= 0 && array[right] < array[left]) {
        notifyListeners();
        final int tmp = array[left];
        array[left] = array[right];
        array[right] = tmp;
        right--;
        left--;
        notifyListeners();
        await sleep();
      }
      if (!isSorting) {
        return;
      }
    }
    sorted = 0;
    left = -1;
    right = -1;
    notifyListeners();
  }
}
