import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/base/base_sort_widget.dart';
import 'package:visualizer/config/config_holder.dart';
import 'package:visualizer/selection/selection_sort.dart';
import 'package:visualizer/strings.dart';
import 'package:visualizer/theme/theme_config.dart';

class SelectionSortWidget extends BaseSortWidget {
  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 2.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                SELECTION_SORT,
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Consumer<SelectionSort>(
                builder: (context, state, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: _buildItemsArray(
                    state.array,
                    state.left,
                    state.right,
                    state.next,
                    state.sorted,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Best O(n^2) Worst O(n^2) time',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );

  List<Widget> _buildItemsArray(
    List<int> array,
    int left,
    int right,
    int next,
    int sorted,
  ) =>
      array
          .mapIndexed(
            (idx, value) => Expanded(
              flex: idx == left || idx == right || idx == next ? 2 : 1,
              child: Consumer<ConfigHolder>(
                builder: (context, config, _) => config.showNumbers
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          valueText(idx, value, left, right),
                          itemWidget(idx, value, left, right, next, sorted)
                        ],
                      )
                    : itemWidget(idx, value, left, right, next, sorted),
              ),
            ),
          )
          .toList();

  Widget itemWidget(
    int idx,
    int value,
    int left,
    int right,
    int next,
    int sorted,
  ) =>
      Consumer<ThemeConfig>(
        builder: (context, config, _) => Container(
          height: value.toDouble(),
          margin: const EdgeInsets.all(1.3),
          color: idx == left
              ? Colors.yellow
              : (idx == right
                  ? Colors.red
                  : (idx == next
                      ? Colors.orange
                      : (idx <= sorted
                          ? Colors.blueGrey
                          : config.theme.colorScheme.secondary))),
        ),
      );
}
