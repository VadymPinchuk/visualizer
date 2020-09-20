import 'dart:core';

import 'package:visualizer/base/base_sort.dart';

class SelectionSort extends BaseSort {
  SelectionSort() : super();

  int next = -1;

  @override
  void generateData() {
    super.generateData();
    sorted = -1;
    next = -1;
    notifyListeners();
  }

  @override
  Future startSorting() async {
    isSorting = true;
    prev = 0;
    curr = 0;

    for (int i = 0; i < array.length - 1; i++) {
      prev = i;
      curr = i;
      for (next = i + 1; next < array.length; next++) {
        if (!isSorting) {
          return;
        }
        if (array[next] < array[curr]) {
          curr = next;
        }
        notifyListeners();
        await sleep();
      }
      if (prev != curr) {
        final double tmp = array[prev];
        array[prev] = array[curr];
        array[curr] = tmp;
      }
      sorted = prev;
      notifyListeners();
    }

    sorted = array.length;
    prev = -1;
    curr = -1;
    next = -1;
    notifyListeners();
  }
}
