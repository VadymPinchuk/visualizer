import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/base/base_sort_widget.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/config/config_holder.dart';
import 'package:visualizer/strings.dart';

class BubbleSortWidget extends BaseSortWidget {
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
                BUBBLE_SORT,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Consumer<BubbleSort>(
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
                'Best O(n) Worst O(n^2) time',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  List<Widget> _buildArrayWidgets(
    Color main,
    List<int> array,
    int prev,
    int curr,
    int sorted,
  ) =>
      array
          .mapIndexed(
            (idx, value) => Expanded(
              child: Consumer<ConfigHolder>(
                builder: (context, config, _) => config.showNumbers
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          valueText(idx, value, prev, curr),
                          _oneItem(idx, value, prev, curr, sorted, main)
                        ],
                      )
                    : _oneItem(idx, value, prev, curr, sorted, main),
              ),
            ),
          )
          .toList();

  Widget _oneItem(
    int idx,
    int value,
    int prev,
    int curr,
    int sorted,
    Color main,
  ) =>
      Container(
        height: value.toDouble(),
        margin: const EdgeInsets.all(1.3),
        color: idx == prev
            ? Colors.orange
            : (idx == curr
                ? Colors.red
                : (idx >= sorted ? Colors.greenAccent[700] : main)),
      );
}
