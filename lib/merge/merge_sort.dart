import 'dart:core';

import 'package:visualizer/base/base_sort.dart';

class MergeSort extends BaseSort {
  MergeSort() : super();

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
    final List<int> copy = List<int>.from(array);
    await _mergeSort(array, 0, array.length - 1, copy);
    if (!isSorting) return;
    sorted = 0;
    left = -1;
    right = -1;
    notifyListeners();
  }

  Future _mergeSort(List<int> main, int start, int end, List<int> copy) async {
    if (!isSorting) return;
    if (start == end) return;
    final int mid = (start + end) ~/ 2;
    await _mergeSort(copy, start, mid, main);
    await _mergeSort(copy, mid + 1, end, main);
    await _merge(main, start, mid, end, copy);
  }

  Future _merge(List<int> main, int start, int mid, int end, List<int> copy) async {
    if (!isSorting) return;
    left = start;
    right = mid + 1;
    int counter = start;
    notifyListeners();
    while (left <= mid && right <= end) {
      if (!isSorting) return;
      if (copy[left] < copy[right]) {
        main[counter++] = copy[left++];
      } else {
        main[counter++] = copy[right++];
      }
      notifyListeners();
      await sleep();
    }
    while (left <= mid) {
      if (!isSorting) return;
      main[counter++] = copy[left++];
      notifyListeners();
      await sleep();
    }
    while (right <= end) {
      if (!isSorting) return;
      main[counter++] = copy[right++];
      notifyListeners();
      await sleep();
    }
  }
}
