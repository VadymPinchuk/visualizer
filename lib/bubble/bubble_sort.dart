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
    if (isSorting) return;

    bool isChanged = true;
    int counter = 0;
    isSorting = true;
    while (isSorting && isChanged) {
      isChanged = false;
      for (int i = 0; i < array.length - 1 - counter; i++) {
        if (!isSorting) {
          return;
        }
        left = i;
        right = i + 1;
        notifyListeners();
        if (array[left] > array[right]) {
          notifyListeners();
          isChanged = true;
          final int tmp = array[left];
          array[left] = array[right];
          array[right] = tmp;
          await sleep();
        }
      }
      sorted = array.length - 1 - counter;
      counter++;
      notifyListeners();
    }
    left = -1;
    right = -1;
    sorted = 0;
    notifyListeners();
  }
}
