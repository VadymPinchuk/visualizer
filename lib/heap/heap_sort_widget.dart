import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/heap/heap_sort.dart';
import 'package:visualizer/strings.dart';

class HeapSortWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                HEAP_SORT,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Consumer<HeapSort>(
                builder: (context, state, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _buildArrayWidgets(
                    Theme.of(context).accentColor,
                    state.array,
                    state.prev,
                    state.curr,
                    state.sorted,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Time: O(n*log(n))  Space: O(1)',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  List<Widget> _buildArrayWidgets(Color main, List<double> array, int prev, int curr, int sorted) => array
      .map((e) => Expanded(
            child: Container(
              height: e,
              margin: const EdgeInsets.all(1.3),
              color: array.indexOf(e) == prev
                  ? Colors.orange
                  : (array.indexOf(e) == curr
                      ? Colors.red
                      : (array.indexOf(e) >= sorted ? Colors.indigoAccent[700] : main)),
            ),
          ))
      .toList();
}
