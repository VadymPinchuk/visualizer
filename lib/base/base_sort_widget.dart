import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:visualizer/bubble/bubble_sort.dart';
import 'package:visualizer/config/config_holder.dart';
import 'package:visualizer/strings.dart';
import 'package:visualizer/theme/theme_config.dart';

abstract class BaseSortWidget extends StatelessWidget {
  Widget valueText(
    int idx,
    int value,
    int left,
    int right,
  ) =>
      Consumer<ThemeConfig>(
        builder: (context, config, _) => Text(
          value.toString(),
          style: config.theme.primaryTextTheme.bodySmall.copyWith(
              fontSize: 9,
              color: idx == left || idx == right
                  ? Colors.yellow
                  : config.theme.primaryTextTheme.bodySmall.color),
        ),
      );
}
