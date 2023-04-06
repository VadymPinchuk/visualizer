import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/base/base_sort_widget.dart';
import 'package:visualizer/heap/heap_sort.dart';
import 'package:visualizer/strings.dart';

class HeapSortWidget extends BaseSortWidget {
  @override
  String algorithmName() => HEAP_SORT;

  @override
  String algorithmComplexity() => 'Time: O(n*log(n))  Space: O(1)';

  @override
  Widget consumerWidget() => Consumer<HeapSort>(
        builder: (context, state, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: buildItemsArray(
            state.array,
            state.left,
            state.right,
            state.sorted,
            Colors.cyan,
          ),
        ),
      );
}
