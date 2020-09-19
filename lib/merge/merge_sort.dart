import 'dart:core';

import 'package:visualizer/base/base_sort.dart';

class MergeSort extends BaseSort {
  MergeSort() : super();

  int left = -1;
  int right = -1;

  @override
  void generateData() {
    super.generateData();
    left = -1;
    right = -1;
    sorted = array.length;
    notifyListeners();
  }

  @override
  Future performSorting() async {
    isSorting = true;
    final List<double> copy = List<double>.from(array);
    await _mergeSort(array, 0, array.length - 1, copy);
    sorted = 0;
    left = -1;
    right = -1;
    notifyListeners();
  }

  Future _mergeSort(List<double> main, int start, int end, List<double> copy) async {
    if (!isSorting) return;
    if (start == end) return;
    final int mid = (start + end) ~/ 2;
    await _mergeSort(copy, start, mid, main);
    await _mergeSort(copy, mid + 1, end, main);
    await _merge(main, start, mid, end, copy);
  }

  Future _merge(List<double> main, int start, int mid, int end, List<double> copy) async {
    if (!isSorting) return;
    left = start;
    right = mid + 1;
    int counter = start;
    notifyListeners();
    while (left <= mid && right <= end) {
      if (copy[left] < copy[right]) {
        main[counter++] = copy[left++];
      } else {
        main[counter++] = copy[right++];
      }
      notifyListeners();
      await sleep();
    }
    while (left <= mid) {
      main[counter++] = copy[left++];
      notifyListeners();
      await sleep();
    }
    while (right <= end) {
      main[counter++] = copy[right++];
      notifyListeners();
      await sleep();
    }
  }
}
