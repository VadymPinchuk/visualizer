import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/config/config_holder.dart';
import 'package:visualizer/theme/theme_config.dart';

/// Basic widget configurations to be used in one place for simplicity
abstract class BaseSortWidget extends StatelessWidget {
  List<Widget> buildItemsArray(
    List<int> array,
    int left,
    int right,
    int sorted,
    Color sortedColor,
  ) =>
      array
          .mapIndexed(
            (idx, value) => Expanded(
              flex: idx == left || idx == right ? 2 : 1,
              child: Consumer<ConfigHolder>(
                builder: (context, config, _) => config.showNumbers
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          valueText(idx, value, left, right),
                          oneItem(idx, value, left, right, sorted, sortedColor)
                        ],
                      )
                    : oneItem(idx, value, left, right, sorted, sortedColor),
              ),
            ),
          )
          .toList();

  Widget valueText(
    int idx,
    int value,
    int left,
    int right,
  ) =>
      Consumer<ThemeConfig>(
        builder: (context, config, _) => Text(
          value.toString(),
          style: config.theme.textTheme.bodySmall.copyWith(
              fontSize: 9,
              color: idx == left || idx == right
                  ? config.theme.colorScheme.secondary
                  : config.theme.textTheme.bodySmall.color),
        ),
      );

  Widget oneItem(
    int idx,
    int value,
    int left,
    int right,
    int sorted,
    Color sortedColor,
  ) =>
      Consumer<ThemeConfig>(
        builder: (context, config, _) => Container(
          height: value.toDouble(),
          margin: const EdgeInsets.all(1.3),
          color: idx == left
              ? Colors.yellow
              : (idx == right
                  ? Colors.red
                  : (idx >= sorted
                      ? sortedColor
                      : config.theme.colorScheme.secondary)),
        ),
      );
}
