import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/merge/merge_sort.dart';

class MergeSortWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Merge sort',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Consumer<MergeSort>(
              builder: (context, state, _) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: _buildArrayWidgets(
                  state.array,
                  state.left,
                  state.right,
                  state.sorted,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Average O(n*log(n)) time, O(n) space',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  List<Widget> _buildArrayWidgets(List<double> array, int curr, int next, int sorted) => array
      .map((e) => Container(
            width: 4,
            height: e,
            margin: const EdgeInsets.all(1),
            color: array.indexOf(e) == curr
                ? Colors.orange
                : (array.indexOf(e) == next ? Colors.red : (array.indexOf(e) >= sorted ? Colors.blue : Colors.cyan)),
          ))
      .toList();
}
