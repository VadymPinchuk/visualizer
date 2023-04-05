import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/base/base_sort_widget.dart';
import 'package:visualizer/insertion/insertion_sort.dart';
import 'package:visualizer/strings.dart';

class InsertionSortWidget extends BaseSortWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                INSERTION_SORT,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Consumer<InsertionSort>(
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
              ),
              const SizedBox(height: 10),
              const Text(
                'Best O(n) Worst O(n^2) time',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
}
