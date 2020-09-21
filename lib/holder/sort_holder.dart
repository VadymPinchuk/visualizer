import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/bubble/bubble_sort_widget.dart';
import 'package:visualizer/heap/heap_sort.dart';
import 'package:visualizer/heap/heap_sort_widget.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/insertion/insertion_sort_widget.dart';
import 'package:visualizer/merge/merge_sort.dart';
import 'package:visualizer/merge/merge_sort_widget.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/selection/selection_sort_widget.dart';

enum Sorting { Merge, Heap, Insertion, Selection, Bubble }

class SortHolder extends ChangeNotifier {
  SortHolder() {
    _initialConfig();
  }

  final _sortingSet = <Sorting>{};

  Set<Sorting> get sortingSet => _sortingSet;

  bool contains(Sorting type) => sortingSet.contains(type);

  Future switchSorting(Sorting type) async {
    if (_sortingSet.contains(type)) {
      _sortingSet.remove(type);
    } else {
      _sortingSet.add(type);
    }
    notifyListeners();
    await _saveSelection();
  }

  List<Widget> generateWidgets(BuildContext context) {
    final list = <Widget>[];
    for (final Sorting type in _sortingSet) {
      switch (type) {
        case Sorting.Merge:
          list.add(MergeSortWidget());
          break;
        case Sorting.Heap:
          list.add(HeapSortWidget());
          break;
        case Sorting.Bubble:
          list.add(BubbleSortWidget());
          break;
        case Sorting.Insertion:
          list.add(InsertionSortWidget());
          break;
        case Sorting.Selection:
          list.add(SelectionSortWidget());
          break;
      }
    }
    return list;
  }

  void shuffleData(BuildContext context) {
    for (final Sorting type in _sortingSet) {
      switch (type) {
        case Sorting.Merge:
          Provider.of<MergeSort>(context, listen: false).generateData();
          break;
        case Sorting.Heap:
          Provider.of<HeapSort>(context, listen: false).generateData();
          break;
        case Sorting.Bubble:
          Provider.of<BubbleSort>(context, listen: false).generateData();
          break;
        case Sorting.Insertion:
          Provider.of<InsertionSort>(context, listen: false).generateData();
          break;
        case Sorting.Selection:
          Provider.of<SelectionSort>(context, listen: false).generateData();
          break;
      }
    }
  }

  void startSorting(BuildContext context) {
    for (final Sorting type in _sortingSet) {
      switch (type) {
        case Sorting.Merge:
          Provider.of<MergeSort>(context, listen: false).startSorting();
          break;
        case Sorting.Heap:
          Provider.of<HeapSort>(context, listen: false).startSorting();
          break;
        case Sorting.Bubble:
          Provider.of<BubbleSort>(context, listen: false).startSorting();
          break;
        case Sorting.Insertion:
          Provider.of<InsertionSort>(context, listen: false).startSorting();
          break;
        case Sorting.Selection:
          Provider.of<SelectionSort>(context, listen: false).startSorting();
          break;
      }
    }
  }

  Future _initialConfig() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> list = prefs.getStringList('sortingTypes');
    if (list != null) {
      _parseList(list);
      notifyListeners();
    }
  }

  Future _saveSelection() async {
    await SharedPreferences.getInstance().then((prefs) => prefs.setStringList('sortingTypes', _toList()));
  }

  List<String> _toList() => _sortingSet.map((e) => e.index.toString()).toList();

  void _parseList(List<String> list) {
    for (final String each in list) {
      _sortingSet.add(Sorting.values[int.tryParse(each)]);
    }
  }
}
