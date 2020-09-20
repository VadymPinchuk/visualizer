import 'package:visualizer/base/base_sort.dart';

class BubbleSort extends BaseSort {
  BubbleSort() : super();

  @override
  void generateData() {
    super.generateData();
    sorted = array.length;
    notifyListeners();
  }

  @override
  Future startSorting() async {
    bool isChanged = true;
    int counter = 0;
    isSorting = true;
    while (isSorting && isChanged) {
      isChanged = false;
      for (int i = 0; i < array.length - 1 - counter; i++) {
        if (!isSorting) {
          return;
        }
        prev = i;
        curr = i + 1;
        notifyListeners();
        if (array[prev] > array[curr]) {
          notifyListeners();
          isChanged = true;
          final double tmp = array[prev];
          array[prev] = array[curr];
          array[curr] = tmp;
          await sleep();
        }
      }
      sorted = array.length - 1 - counter;
      counter++;
      notifyListeners();
    }
    prev = -1;
    curr = -1;
    sorted = 0;
    notifyListeners();
  }
}
