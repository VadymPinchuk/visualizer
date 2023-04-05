import 'dart:core';

import 'package:visualizer/base/base_sort.dart';

class SelectionSort extends BaseSort {
  SelectionSort() : super();

  // next smallest value in front of sorted array
  int next = -1;

  @override
  void generateData() {
    super.generateData();
    next = -1;
    notifyListeners();
  }

  @override
  Future startSorting() async {
    if (isSorting) return;

    isSorting = true;
    left = 0;
    right = 0;

    for (int i = 0; i < array.length - 1; i++) {
      left = i;
      right = i;
      for (next = i + 1; next < array.length; next++) {
        if (!isSorting) {
          return;
        }
        if (array[next] < array[right]) {
          right = next;
        }
        notifyListeners();
        await sleep();
      }
      if (left != right) {
        final int tmp = array[left];
        array[left] = array[right];
        array[right] = tmp;
      }
      sorted = left;
      notifyListeners();
    }

    sorted = array.length;
    left = -1;
    right = -1;
    next = -1;
    notifyListeners();
  }
}
