import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/base/base_sort_widget.dart';
import 'package:visualizer/merge/merge_sort.dart';
import 'package:visualizer/strings.dart';

class MergeSortWidget extends BaseSortWidget {
  @override
  String algorithmName() => MERGE_SORT;

  @override
  String algorithmComplexity() => 'Time: O(n*log(n))  Space: O(n)';

  @override
  Widget consumerWidget() => Consumer<MergeSort>(
        builder: (context, state, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: buildItemsArray(
            state.array,
            state.left,
            state.right,
            state.sorted,
            Colors.pinkAccent,
          ),
        ),
      );
}
