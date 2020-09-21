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
    prev = 0;
    sorted = array.length;
    while (sorted > 0) {
      // interrupt when data changed
      if (!isSorting) return;
      sorted--;
      await swap(prev, sorted);
      await siftDown(prev, sorted);
    }
    prev = -1;
    curr = -1;
    notifyListeners();
  }

  // O(n) time to build
  Future buildMaxHeap() async {
    sorted = array.length;
    prev = parentI(array.length - 1);
    while (prev >= 0) {
      await siftDown(prev, array.length);
      prev--;
    }
    prev = -1;
    curr = -1;
  }

  int parentI(int childI) => (childI - 1) ~/ 2;

  int childOI(int parentI) => parentI * 2 + 1;

  int childTI(int parentI) => parentI * 2 + 2;

  // O(1) operation
  Future swap(int i, int j) async {
    if (!isSorting) return;
    final double tmp = array[i];
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
        curr = chTwoI;
      } else {
        curr = chOneI;
      }
      if (array[curr] > array[start]) {
        await swap(start, curr);
        start = curr;
        chOneI = childOI(start);
      } else {
        break;
      }
      notifyListeners();
    }
  }
}
