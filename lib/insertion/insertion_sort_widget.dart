import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/base/base_sort_widget.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/strings.dart';

class InsertionSortWidget extends BaseSortWidget {
  @override
  String algorithmName() => INSERTION_SORT;

  @override
  String algorithmComplexity() => 'Best O(n) Worst O(n^2) time';

  @override
  Widget consumerWidget() => Consumer<InsertionSort>(
        builder: (context, state, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: buildItemsArray(
            state.array,
            state.left,
            state.right,
            state.sorted,
            Colors.indigo,
          ),
        ),
      );
}
