import 'dart:core';

import 'package:visualizer/base/base_sort.dart';

class HeapSort extends BaseSort {
  HeapSort() : super();

  @override
  void generateData() {
    super.generateData();
    sorted = array.length;
    notifyListeners();
  }

  @override
  Future startSorting() async {
    // prevent from double click
    if (isSorting) return;

    isSorting = true;
    // build max heap first
    await buildMaxHeap();

    // start sorting
    left = 0;
    sorted = array.length;
    while (sorted > 0) {
      // interrupt when data changed
      if (!isSorting) return;
      sorted--;
      await swap(left, sorted);
      await siftDown(left, sorted);
    }
    left = -1;
    right = -1;
    notifyListeners();
  }

  // O(n) time to build
  Future buildMaxHeap() async {
    sorted = array.length;
    left = parentI(array.length - 1);
    while (left >= 0) {
      await siftDown(left, array.length);
      left--;
    }
    left = -1;
    right = -1;
  }

  int parentI(int childI) => (childI - 1) ~/ 2;

  int childOI(int parentI) => parentI * 2 + 1;

  int childTI(int parentI) => parentI * 2 + 2;

  // O(1) operation
  Future swap(int i, int j) async {
    if (!isSorting) return;
    final int tmp = array[i];
    array[i] = array[j];
    array[j] = tmp;
    notifyListeners();
    await sleep();
  }

  // O(log(n)) time
  // sift down exclusively
  Future siftDown(int start, int end) async {
    int chOneI = childOI(start);
    while (chOneI < end) {
      if (!isSorting) return;

      final int chTwoI = childTI(start) < end ? childTI(start) : -1;
      if (chTwoI != -1 && array[chTwoI] > array[chOneI]) {
        right = chTwoI;
      } else {
        right = chOneI;
      }
      if (array[right] > array[start]) {
        await swap(start, right);
        start = right;
        chOneI = childOI(start);
      } else {
        break;
      }
      notifyListeners();
    }
  }
}
